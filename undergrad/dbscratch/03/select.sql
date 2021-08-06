-- Create a select statement that search for the tag trigger 
-- and searches for the word configuration. What interactive 
-- homework has both this tag and this word. Select the title
-- of the interactive homework that matches this criteria

-- t => title
-- m => title_to_tag (short for map)
-- a => tags

SELECT  
    t.title
FROM a03_title t
JOIN a03_title_to_tag m 
    ON t.id = m.title_id
JOIN a03_tags a
    ON a.id = m.tag_id
WHERE 
    t.words @@ to_tsquery('configuration')
    AND a.tag = 'trigger';