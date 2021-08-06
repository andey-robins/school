DROP TABLE IF EXISTS a03_title_to_tag CASCADE;
DROP TABLE IF EXISTS a03_title CASCADE;
DROP TABLE IF EXISTS a03_tags CASCADE;

CREATE TABLE a03_title (
    id uuid DEFAULT uuid_generate_v4() NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    words tsvector,
    updated TIMESTAMP,
    created TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE INDEX a03_title_p1 ON a03_title (created);  
CREATE INDEX a03_title_tsv_g1 ON a03_title USING GIN (words); 

CREATE TABLE a03_title_to_tag (
    id uuid DEFAULT uuid_generate_v4() not null primary key,
    title_id uuid not null,
    tag_id uuid not null
);

CREATE UNIQUE INDEX a03_title_to_tag_u1 on a03_title_to_tag ( title_id, tag_id );
CREATE UNIQUE INDEX a03_title_to_tag_u2 on a03_title_to_tag ( tag_id, title_id );

CREATE TABLE a03_tags (
    id uuid DEFAULT uuid_generate_v4() not null primary key,
    tag text
);

CREATE UNIQUE INDEX a03_tags_p1 on a03_tags ( tag );

ALTER TABLE a03_title_to_tag 
    ADD CONSTRAINT a03_title_id_fk1
    FOREIGN KEY (title_id)
    REFERENCES a03_title (id)
;
ALTER TABLE a03_title_to_tag 
    ADD CONSTRAINT a03_tag_id_fk2
    FOREIGN KEY (tag_id)
    REFERENCES a03_tags (id)
;
