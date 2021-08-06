DROP TABLE IF EXISTS i_issue CASCADE;
DROP TABLE IF EXISTS i_state CASCADE;
DROP TABLE IF EXISTS i_severity CASCADE;
DROP TABLE IF EXISTS i_note CASCADE;
DROP TABLE IF EXISTS i_config CASCADE;

-----------------------------
---- functions
-----------------------------
CREATE OR REPLACE FUNCTION update_modified_column()   
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated = clock_timestamp();
    RETURN NEW;   
END;
$$ language 'plpgsql';

-----------------------------
---- tables
-----------------------------
CREATE TABLE i_state (
    id SERIAL PRIMARY KEY,
    state TEXT NOT NULl
);

CREATE TABLE i_severity (
    id SERIAL PRIMARY KEY,
    severity TEXT NOT NULL
);

CREATE TABLE i_issue (
    id uuid DEFAULT uuid_generate_v4() NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    state_id INT REFERENCES i_state (id),
    severity_id INT REFERENCES i_severity (id),
    words tsvector,
    updated TIMESTAMP DEFAULT current_timestamp NOT NULL,
    created TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE i_note (
    id uuid DEFAULT uuid_generate_v4() NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    issue_id uuid REFERENCES i_issue (id) NOT NULL,
    seq SERIAL,
    words tsvector,
    updated TIMESTAMP DEFAULT current_timestamp NOT NULL,
    created TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE i_config (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    value TEXT
);

-----------------------------
---- triggers
-----------------------------
-- time update trigger on i_issue
DROP TRIGGER IF EXISTS update_modified_issue ON i_issue;
CREATE TRIGGER update_modified_issue
    BEFORE UPDATE
    ON i_issue
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-- time update trigger on i_note
DROP TRIGGER IF EXISTS update_modified_issue ON i_note;
CREATE TRIGGER update_modified_note
    BEFORE UPDATE
    ON i_note
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-----------------------------
---- default insert
-----------------------------
INSERT INTO i_state ( id, state ) VALUES
	( 1, 'Created' ),
	( 2, 'Verified' ),
	( 3, 'In Progress' ),
	( 4, 'Development Complete' ),
	( 5, 'Unit Test' ),
	( 6, 'Integration Test' ),
	( 7, 'Tests Passed' ),
	( 8, 'Documentation' ),
	( 9, 'Deployed' ),
	( 10, 'Closed' ),
	( 11, 'Deleted' )
;
ALTER SEQUENCE i_state_id_seq RESTART WITH 12;

INSERT INTO i_severity ( id, severity ) VALUES
	( 1, 'Unknown' ),
	( 2, 'Ignore' ),
	( 3, 'Minor' ),
	( 4, 'Documentation Error' ),
	( 5, 'Code Change' ),
	( 6, 'User Interface Change' ),
	( 7, 'Severe - System down' ),
	( 8, 'Critial - System down' )
;
ALTER SEQUENCE i_severity_id_seq RESTART WITH 9;

INSERT INTO i_config ( name, value ) VALUES 
	( 'language', 'english' )
;