module SQL_Parser_tests where

import ParserBase
import SQL_Parser

create_syntax =  "CREATE TABLE silly (lastname STRING)"
create1_syntax =  "CREATE TABLE employee (lastname STRING, firstname STRING, age INT, credits INT, major STRING)"
insert_syntax =  "INSERT INTO test ('Caldwell', 'James', 63, 1000, 'COSC')"
select_syntax = "SELECT firstname lastname age FROM test"
select1_syntax = "SELECT firstname lastname age FROM test WHERE 20 < age"
join_syntax = "table1 JOIN table2 ON lastname"
join1_syntax = "table1  JOIN (" ++ select1_syntax ++ ") ON lastname"
join2_syntax = "table1  JOIN (table2 JOIN table3 ON age) ON credits"
seqencing_syntax = " table1 ; table2"
seqencing1_syntax = "table1; table2; table3"
seqencing2_syntax = create1_syntax ++ "; " ++ insert_syntax ++ "; " ++ select1_syntax

tests = [create_syntax, create1_syntax, insert_syntax, select1_syntax, select1_syntax, join_syntax, join1_syntax,
              join2_syntax, seqencing_syntax, seqencing1_syntax, seqencing2_syntax]

testit x = case (fullParse table x) of
                 (Left y) -> (x , y)
                 (Right y) ->  error y
