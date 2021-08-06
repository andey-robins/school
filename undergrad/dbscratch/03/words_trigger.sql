--
-- PROCEDURES
--

-- title update tsvector
CREATE OR REPLACE FUNCTION words_tsvectorize_update_func() RETURNS TRIGGER AS $$
BEGIN
    -- IF NEW.title <> OLD.title OR NEW.body <> OLD.body THEN
        NEW.words = 
            setweight( to_tsvector( 'pg_catalog.english', COALESCE( NEW.title, '' )), 'A' ) || 
            setweight( to_tsvector( 'pg_catalog.english', COALESCE( NEW.body, '' )), 'B' );
    -- END IF;
    RETURN NEW;
END
$$ LANGUAGE 'plpgsql';

-- title insert & generate tsvectors
CREATE OR REPLACE FUNCTION words_tsvectorize_insert_func() RETURNS TRIGGER AS $$
BEGIN
    NEW.words = 
        setweight( to_tsvector( 'pg_catalog.english', COALESCE( NEW.title, '' )), 'A' ) || 
        setweight( to_tsvector( 'pg_catalog.english', COALESCE( NEW.body, '' )), 'B' );
    -- UPDATE a03_title SET words = NEW.words WHERE id = NEW.id;
    RETURN NEW;
END
$$ LANGUAGE 'plpgsql';

--
-- TRIGGERS
--

-- title update tsvector
DROP TRIGGER IF EXISTS words_tsvectorize_update_trigger ON a03_title;
CREATE TRIGGER words_tsvectorize_update_trigger
    BEFORE UPDATE
    ON a03_title
    FOR EACH ROW
        EXECUTE PROCEDURE words_tsvectorize_update_func();

-- title insert & generate tsvectors
DROP TRIGGER IF EXISTS words_tsvectorize_insert_trigger ON a03_title;
CREATE TRIGGER words_tsvectorize_insert_trigger
    BEFORE INSERT
    ON a03_title
    FOR EACH ROW
        EXECUTE PROCEDURE words_tsvectorize_insert_func();