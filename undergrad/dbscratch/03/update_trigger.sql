CREATE OR REPLACE FUNCTION update_modified_column()   
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated = clock_timestamp();
    RETURN NEW;   
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_modified ON a03_title;
CREATE TRIGGER update_modified
    BEFORE UPDATE 
    ON a03_title
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column(); 