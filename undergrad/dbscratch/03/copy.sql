INSERT INTO a03_title ( id, title, body )
    SELECT * FROM a02_title;

INSERT INTO a03_tags
    SELECT * FROM a02_tags;

INSERT INTO a03_title_to_tag
    SELECT * FROM a02_title_to_tag;