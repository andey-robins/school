INSERT INTO a02_title ( id, title, body ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', 'Interactive - 01 - Create Table', '
Create a table with 3 columns.  The table name will be "name_list".
The columns are:

- real_name a text column
- age an integer
- state a 2 character field for a US state code.

```
create table <name> (
	<column>,
	<column>,
	<column>,
	...
	<column>
);
```
The columns are a comma `,` separated list.   The set of
columns tars with a `(` and ends with a `)`.

A `;` (semicolon) is used to mark the end of the statement.

Officially this is call the Data Definition Language or DDL.

We have to declare what we want to store before storing it.

We will get back to data-types and SQL in a future homework.

so with 3 columns

```

DROP TABLE if exists name_list ;

CREATE TABLE name_list (
	real_name text,
	age int,
	state varchar(2)
);


```

Book: Pages 5 to 7





#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '12f4a214-bf5c-4a75-9b96-6d1723d5d66c', 'Interactive - 02 - Insert data into name_list', '
Insert some data into the table.

```
insert into <name> ( <column-name>, <column-name>, .... ) values
	( <colun-data1>, <colun-data2>, ... ),
	( <colun-row2>, <colun-row2>, ... ),
	( <colun-row2>, <colun-row2>, ... )
;
```

so our example, we will use all the columns so we can leave the
list of columns out  and just put the data in the table declared
order.

```
INSERT INTO name_list values
	( ''bob true'',            22, ''WY'' ),
	( ''Jane True'',           20, ''WY'' ),
	( ''Tom Ace'',             31, ''NJ'' ),
	( ''Steve Pen'',           33, ''NJ'' ),
	( ''Laura Jean Alkinoos'', 34, ''PA'' )
;

```

and a single row (note that the column order
is chained).  It is better to list the columns
so that if the table is changed the data can
still be loaded.  It is possible to add new columns to a table
and break old code - so it is better to have:

```
insert into name_list ( real_name, age, state ) values
	( ''bob true'',            22, ''WY'' ),
...
...
...
...
	( ''Laura Jean Alkinoos'', 34, ''PA'' )
;
```

Also note that it is intentional at this point that `bob true` is all lower
case.  We will fix that in a little bit.

```

INSERT INTO name_list ( real_name, state, age )
	values	( ''Philip Schlump'', ''WY'', 62 );

```

Each set of data that we inset is separated with a comma, `,`.
When we insert text we use single quotes, `''` to mark that it is
text.  To insert a quote mark we put in 2 of them in a row.
So, To insert `that''s`  we would use in our insert statement,
`''that''''s``.

Numbers are respresented as a set of digits.  With fractional(floating point) numbers you put in a decimal
point - but note that our column age is not a float - so just whole years.

If all has worked correctly then you should have 6 rows in the table.

```
select count(1) as x
from name_list
;

```

6 rows is good.  Click to grade the homework.

Book: Pages 7 to 9


#### Validate: SQL-Select,"select ''PASS'' as x from ( select count(1) as x from name_list ) as t1 where t1.x = 6 "

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '37fdc806-a5f4-4e25-991d-b64bcc6e4677', 'Interactive - 03 - Select data back from the table', '
Data is more fun when you can put some in and get it
back later.  Enter "select".

```
SELECT * from name_list;

```

gives you get back all the data.  The `*` is the list
of columns you get back.  `*` is for all the columns.

```
SELECT real_name, state from name_list;

```

Gives you back just the name and state.

```
SELECT lower(real_name) as "real_name_lower", real_name
from name_list;

```

Gives you back a lower case version of the name.

Or make it in order from z to a.

```

SELECT lower(real_name) as "real_name_lower", real_name
	FROM name_list
	ORDER BY 1 desc
;

```

Maybe we just want the names in Wyoming.  This is the
where clause.

```

SELECT real_name
	FROM name_list
	WHERE state = ''WY''
;

```

Remember that if you want to match a text field you
have to use quotes.  Also it is case sensitive.

```
select real_name
from name_list
where state = ''wy''
;
```

will not give you any rows.  Try it.

The query to run before to get your grade is:

```

SELECT real_name
	FROM name_list
	WHERE state = ''WY''
;

```

It should return 3 rows.  This is what is checked for by the application.


Book: Chapter 2 - pages 11 to 22.


#### Validate: "CountRows","{%22Nr%22%3A[3]}"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '6d9a68d5-1785-42bd-8d6b-aab690d33953', 'Interactive - 04 - update the table', '
Note that we have an error in our data.  `Bob true` should
be `Bob True`.   Let''s change some data.

```
update <tabe-name>
	set <list of columns to modify>
	where <boolean expresison>
;
```

so... let''s look at the data before the update

```
SELECT * from name_list;

```

Update it to fix it

```
UPDATE name_list
	SET real_name = ''Bob True''
	WHERE real_name = ''bob true''
;

```

Now let''s look at the data:

```
SELECT * from name_list;

```

Much better!  The query should return 6 rows.  The application checks that you are getting back 6 rows
of data for grading.

Book: page 139 talks about update.


#### Validate: "CountRows","{%22Nr%22%3A[6]}"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'e467b4da-e05b-4b0f-b97c-93e0726f03cf', 'Interactive - 05 - insert more data / select unique data', '
Let''s put in some more data - that has some mistakes in it.


```
INSERT INTO name_list values
	( ''Liz Trubune'',         30, ''WY'' ),
	( ''Jane True'',           20, ''WY'' ),
	( ''Lary Smith'',          58, ''NJ'' ),
	( ''Dave Dave'',           21, ''NJ'' ),
	( ''Laura Ann Alkinoos'',  34, ''PA'' )
;


```

The problem is that "Jane True" is now a duplicate!

Let''s see it.

```
SELECT * from name_list;

```

We will get how to prevent this later.
Right now let''s get unique data back when the
actual data has duplicates.   For lots of reasons you
can get duplicates in a set of selected data.

```
SELECT distinct * from name_list;

```

The select should return 10 rows of data.

Book: pages 12 to 14.


#### Validate: "CountRows","{%22Nr%22%3A[10]}"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '0a9536f7-c4e7-4c3e-9b9d-60acb1ad5307', 'Interactive - 06 - count rows of data', '
use count to get how many rows.

```
SELECT count(*) from name_list;

```

You should get 11 rows.

or with a where clause

```
SELECT count(*) from name_list
	WHERE state = ''NJ''
;

```

You should get 4 rows.

with a name for the returned data column

```
SELECT count(*) as "count_of_names"
	FROM name_list
;

```

You should get 11 rows.

Book: page 117 to 118

```
SELECT count(distinct real_name)
	FROM name_list
	WHERE state = ''NJ''
;

```

You should get back 1 row with a count of 10.


#### Validate: "CountRows","{%22Nr%22%3A[1]}"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', 'Interactive - 07 - add a check constraint on age', '
We can use the Data Definition Language (DDL) - create table to check
that values are in a correct range or value.

These are check constrains.

Let''s save our data for later, then recreate the table.

First we are going to rename the table - so we can save
it for later.

```
DROP TABLE if exists old_name_list;
ALTER TABLE name_list
	RENAME TO old_name_list;

```


Now we will re-create the table with the check constraint.

```
create table name_list (
	real_name text,
	age int check ( age > 0 and age < 154 ),
	state char varying (2)
);


```

Now copy the data back.

```
insert into name_list ( real_name, age, state )
	select real_name, age, state
	from old_name_list;

```

Verify data amount.  Check how many rows.

```
select count(1) from name_list;
select count(1) from old_name_list;

```

Provided that the counts are the same let''s clean up the temporary table with the old data.

```
drop table old_name_list;
```

And let''s look at the data.


```
select * from name_list;

```

You should see 11 rows.  The duplicate should be removed.

Book: page 132


#### Validate: "CountRows","{%22Nr%22%3A[11]}"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '4aa22fc3-cae8-459c-86cb-b231a6ebe970', 'Interactive - 08 - create unique id and a primary key', '
It is really hard to update data when you don''t have a unique way of identifying a row.
People will often imagine that there is something unique in the data.  Some combination
of name/date/place-of-birth, generally it is not true.

The easy way to deal with this is to create unique keys.  PostgreSQL offers two ways
of doing this.  The first is a key that counts up.   This makes short keys, that''s good
but also creates a bottle neck with a single source of "count-up" values.  The second
way is use a university unique identifier or UUID.  UUIDs are can be created in parallel
and will not collide.  This has lot''s of advantages, but they are long, hard to type
and take up lots of space in your database.

We will get back to sequential values later, for a different purpose.  Let''s do the
more general approach and use UUIDs.

We are going to change our table to have a unique ID column, then create an index
on that column.

This relies on having a way to generate UUIDs, it is an extension package to the
default PostgreSQL database. (double quotes, `"` are correct for this command).

```
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

```

There are ways to add a column to the table without re-creating the table.
They will not work for this.

Let''s save our data for later, then recreate the table.

First we are going to rename the table, so we can save
it for later. (Familiar, we did this last time)

```
drop table if exists old_name_list;
ALTER TABLE name_list
	RENAME TO old_name_list;

```

Now we will re-create the table with the check constraint.

```
create table name_list (
	name_list_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	real_name text,
	age int check ( age > 0 and age < 154 ),
	state char varying (2)
);

```

Now copy the data back.

```
INSERT INTO name_list ( real_name, age, state )
	SELECT real_name, age, state
	FROM old_name_list;

```

Verify data amount.  Check how many rows.

```
select count(1) from name_list;
select count(1) from old_name_list;
```

Provided that the counts are the same let''s clean up the temporary table with the old data.


```
drop table old_name_list;
```

There are 2 parts that we added.  Both a ID column that is unique and
a thing called a `PRIMARY KEY`.


Your result should be similar to this list (the name_list_id''s will
be unique to you and will not match the UUIDs below).


```
             name_list_id             |      real_name      | age | state
--------------------------------------+---------------------+-----+-------
 1fb069ca-a4a2-412a-8401-c835b6c45cb7 | Jane True           |  20 | WY
 39fff492-f369-4552-bf49-b8d7ae57bf9a | Tom Ace             |  31 | NJ
 8e91d65f-ee0a-4642-8d62-1cc1e1058238 | Steve Pen           |  33 | NJ
 e245b3ec-9e5f-4112-ac7e-1d9732d9a4f1 | Laura Jean Alkinoos |  34 | PA
 b8c2468e-694d-46de-acc3-e8da239aa1a3 | Philip Schlump      |  62 | WY
 983b17d2-39f7-45bc-96b2-66ffdbb96c0e | Bob True            |  22 | WY
 2db6af28-47c7-4107-9b67-bdec3321f14c | Liz Trubune         |  30 | WY
 ea51c6b2-37f0-47ed-9211-d1064d3eacfd | Jane True           |  44 | WY
 4c827537-1755-4242-8241-a77ff4173554 | Lary Smith          |  58 | NJ
 3674b39d-4a61-45e0-99e6-65fb7edbbf82 | Dave Dave           |  21 | NJ
 e543c622-24be-4cc2-8241-e8a2dfd1f15c | Laura Ann Alkinoos  |  34 | PA
(11 rows)

```

The grading code will look at the table name_list and verify that you have 11 rows of data in it.


#### Validate: SQL-Select,"select ''PASS'' as x from ( select count(1) as x from name_list ) as t1 where t1.x = 11 "

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'f71c4c71-46f7-47b7-99a8-65d1231991e3', 'Interactive - 09 - add a table with state codes', '
A check constraint on all the state codes would be very long.   There are also
times when that is just not the best way to check that a value is correct.

There is a different way to check that a value is in a range of values.
That is to add a new table that contains all the values and have the
database verify that new values are in this list.

First let''s create the table with the values.  We can also have the
database verify that nobody puts in an empty state name.  This is
the "NOT NULL" on each of the types.

```
CREATE TABLE us_state (
	state_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	state_name text NOT NULL,
	state char varying (2) NOT NULL,
	FIPS_code char varying (2) NOT NULL
);

```

We will also need an index on the state code so that we can
reference it.


```
CREATE UNIQUE INDEX us_state_uidx1 on us_state ( state );

```

If this is not the first time this is run you may need to delete existing data.

```
DELETE FROM us_state ;
```

Then we need to populate the state table with states.  Please cut-and-paste
this or use the supplied file to insert the states.

```
INSERT INTO us_state ( state_name, state, FIPS_code ) values
	(''Alabama'',''AL'',''01''),
	(''Alaska'',''AK'',''02''),
	(''Arizona'',''AZ'',''04''),
	(''Arkansas'',''AR'',''05''),
	(''California'',''CA'',''06''),
	(''Colorado'',''CO'',''08''),
	(''Connecticut'',''CT'',''09''),
	(''Delaware'',''DE'',''10''),
	(''District of Columbia'',''DC'',''11''),
	(''Florida'',''FL'',''12''),
	(''Georgia'',''GA'',''13''),
	(''Hawaii'',''HI'',''15''),
	(''Idaho'',''ID'',''16''),
	(''Illinois'',''IL'',''17''),
	(''Indiana'',''IN'',''18''),
	(''Iowa'',''IA'',''19''),
	(''Kansas'',''KS'',''20''),
	(''Kentucky'',''KY'',''21''),
	(''Louisiana'',''LA'',''22''),
	(''Maine'',''ME'',''23''),
	(''Maryland'',''MD'',''24''),
	(''Massachusetts'',''MA'',''25''),
	(''Michigan'',''MI'',''26''),
	(''Minnesota'',''MN'',''27''),
	(''Mississippi'',''MS'',''28''),
	(''Missouri'',''MO'',''29''),
	(''Montana'',''MT'',''30''),
	(''Nebraska'',''NE'',''31''),
	(''Nevada'',''NV'',''32''),
	(''New Hampshire'',''NH'',''33''),
	(''New Jersey'',''NJ'',''34''),
	(''New Mexico'',''NM'',''35''),
	(''New York'',''NY'',''36''),
	(''North Carolina'',''NC'',''37''),
	(''North Dakota'',''ND'',''38''),
	(''Ohio'',''OH'',''39''),
	(''Oklahoma'',''OK'',''40''),
	(''Oregon'',''OR'',''41''),
	(''Pennsylvania'',''PA'',''42''),
	(''Puerto Rico'',''PR'',''72''),
	(''Rhode Island'',''RI'',''44''),
	(''South Carolina'',''SC'',''45''),
	(''South Dakota'',''SD'',''46''),
	(''Tennessee'',''TN'',''47''),
	(''Texas'',''TX'',''48''),
	(''Utah'',''UT'',''49''),
	(''Vermont'',''VT'',''50''),
	(''Virginia'',''VA'',''51''),
	(''Virgin Islands'',''VI'',''78''),
	(''Washington'',''WA'',''53''),
	(''West Virginia'',''WV'',''54''),
	(''Wisconsin'',''WI'',''55''),
	(''Wyoming'',''WY'',''56'')
;

```


Now let''s make the relationship between them know to the database.
This is called a foreign key constraint.

```
ALTER TABLE name_list
	ADD CONSTRAINT name_list_state_fk
	FOREIGN KEY (state)
	REFERENCES us_state (state)
;

```

Now when we try to insert data that is has an invalid state code
into our list of names it will get rejected.

The following SQL will *not* run successfully

```
insert into name_list ( real_name, state ) values
	( ''nobody'', ''XX'' )
;
```

You should get an error that looks similar to:

```
ERROR:  insert or update on table "name_list" violates foreign key constraint "name_list_state_fk"
DETAIL:  Key (state)=(XX) is not present in table "us_state".
```

Book: page 107, 136


#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw09_1.sql
#### FilesToRun: hw09_2.sql
#### FilesToRun: hw09_3.sql
#### FilesToRun: hw09_4.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '24673f02-5e9f-4853-85d2-75551caaacea', 'Interactive - 10 - add a index on the name table', '
We have already added indexes but we need to make this process explicit.

The most common indexes are based on special kind of tree called a b-tree.

It is a very wide tree that allows us to get to the data stored on disk
quickly.  This is not the only kind of index.

There are indexes for other things that are built into PostgreSQL.

Let''s create an index on the real_name field.

The general form for the create index looks like:

```
create [unique] index <index-name> on <table-name> (
	<colunm-name-1>,
	<col-2>,
	...
);
```

So...

```
CREATE INDEX name_list_idx1 on name_list ( real_name );

```

Now when we search for a name it will use the index to help to find the
names in the table.  If we have a million names in many blocks of data
it will only take a few blocks of index search to get to the row with
the name we are interested in.

The disadvantage is that we have to have the exact name to search on.
Do you remember our lower-case name, `bob true` from the 2nd homework.
If we look for that we will not find it at all because we fixed the
name to be `Bob True`.


```
select * from name_list where real_name = ''bob true'';
```

Indexes are important because this is the primary way that we can
influence the performance of a database.   If we add the word "unique"
then it also grantees that a column of data is unique.

Note that we can build indexes on more than one column.  If that is
the case then a for a select to use the multi-column index will
require that all of the columns in the index are in the where
clause.

Indexes are also used when we sort data to get it back in order.

Book: Page 108 to 111


#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'bdbb6bed-5e42-4a22-97bf-c72011889bb9', 'Interactive - 11 - add a index on the name table that is case insensitive.', '
Let''s address the case sensitive problem first.

We can create indexes on functions of data.  This allows us to have
an index where we convert the upper/lower case to all lower case
and then index this result.

```
CREATE INDEX user_real_name_ci_idx1 ON name_list ((lower(real_name)));

```

Now when we search the table using the WHERE clause we can use the `lower()` function on
both sides of the equal and use the index to find the data.

```
SELECT *
	FROM name_list
	WHERE lower(real_name) = lower(''Bob True'')
;

```

Indexes are also a disadvantage.  Every insert of a row now requires an insert
to each of the indexes.  They take up storage space.   This means that we are
using space and time at data insert or update to save time when we select the
data back.  Most interactive databases have 10 to 20 times as many selects
as they do insert/update operations.   So this is usually a good tried off.

We can also get the database to tell us the set of indexes that are not
used.  We may want to get rid of unused indexes.  We can do that with

```
drop index <index_name>;
```

Care should be taken.  If the index is a "UNIQUE" index and you remove it
you are also removing the unique constraint on the column of data.

Let''s get rid of the index that is upper-lower case on the table.

```
drop index name_list_idx1;
```

This is the query that I used to find unused indexes (it''s a bit complicated):
We will use this in a homework on database performance later in the class.

```
SELECT
    idstat.relname AS TABLE_NAME,
    indexrelname AS INDEX_NAME,
    idstat.idx_scan AS index_scans_count,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size,
    tabstat.idx_scan AS table_reads_index_count,
    tabstat.seq_scan AS table_reads_seq_count,
    tabstat.seq_scan + tabstat.idx_scan AS table_reads_count,
    n_tup_upd + n_tup_ins + n_tup_del AS table_writes_count,
    pg_size_pretty(pg_relation_size(idstat.relid)) AS table_size
FROM pg_stat_user_indexes AS idstat
	JOIN pg_indexes ON indexrelname = indexname
			AND idstat.schemaname = pg_indexes.schemaname
	JOIN pg_stat_user_tables AS tabstat ON idstat.relid = tabstat.relid
WHERE indexdef !~* ''unique''
ORDER BY
    idstat.idx_scan DESC,
    pg_relation_size(indexrelid) DESC
;

```

Please cut/past the above query and run it once.


Things to note:

1. The index name has to be unique.
2. You can have more than one index on a table.
3. Function based indexes require that the function be run on every insert.  That takes time.
4. We can create our own functions and index on them as well.   We will return to this subject later with `soundex()`


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', 'Interactive - 12 - fix our duplicate data', '
Now that we have a unique primary key we can fix the duplicate name and its row.

```
SELECT * from name_list;

```

This shows us 2 rows and we would like to delete just one of them.  Without the unique
primary key this is really hard to do.  With the key we can delete one of the two rows.

This makes for a complex query.   First let''s select the UUID column, name_list_id
where the duplicate is.


```
SELECT name_list_id
	FROM name_list
	WHERE real_name = ''Jane True''
;

```

Now let''s just select 1 of the IDs. To do this we have to convert the UUID to text,
that is the `::text` so that we can use a function `min()` on it.  This is kind of
a random pick - but it will give us just 1 UUID.


```
SELECT min(name_list_id::text)
	FROM name_list
	WHERE real_name = ''Jane True''
;

```

Now we can delete and skip over the 1 UUID that we picked from above.  This is
the `not in` portion - where we put a select inside the delete.


```
DELETE FROM name_list
	WHERE real_name = ''Jane True''
	  AND name_list_id::text not in (
		SELECT min(name_list_id::text)
		FROM name_list
		WHERE real_name = ''Jane True''
	)
;

```

Now select again and we have removed the duplicate.

```
SELECT * from name_list;

```


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '3a980a42-6c6b-491c-b5ab-6f0badf61426', 'Interactive - 13 - drop both tables', '
Let''s try getting rid of our 2 tables.   Our first attempt to do this will fail.

```
drop table if exists us_state;
```

We have a dependency via foreign constraint on us_state.  That is name_list.

We can do this in order - or we can use an option to "cascade" the drops.
"cascade" is powerful but dangerous.  In PosgreSQL it will drop the table
and associated constraints.  In Oracle it cascades to the tables referenced!


```
DROP table if exists name_list;
DROP table if exists us_state;

```



Now use the supplied script to re-create the tables.  There will be some additional
columns when you do this that we will use in future homework exercises.

The files are hw13_4.sql, hw13_5.sql, hw13_6.sql, hw13_7.sql - run the entire set.  The files are shown below.   After you
have run the file do the select to see a table of the states.

```

DROP TABLE if exists name_list cascade ;
DROP TABLE if exists us_state cascade ;

CREATE TABLE us_state (
	state_id       UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	state_name     text NOT NULL,
	state          char varying (2) NOT NULL,
	FIPS_code      char varying (2) NOT NULL,
	area_rank      int not null default 9999,
	area_sq_mi     numeric not null default 0,
	population     int not null default 0,
	fed_area       int   not null default 0,
	gdp_growth     float null default 0.0,
	gdp            float null default 0.0
);

CREATE UNIQUE INDEX us_state_uidx1 on us_state ( state );



INSERT INTO us_state
    ( state_name,             state,  FIPS_code,  population, area_rank, area_sq_mi, fed_area, gdp_growth, gdp ) values
	( ''Alabama'',               ''AL'',     ''01'' ,      4903185,        25,      50750,     6,         2.0,   196.9  ),
	( ''Alaska'',                ''AK'',     ''02'' ,       731545,         1,     570641,    12,        -0.3,    52.3  ),
	( ''Arizona'',               ''AZ'',     ''04'' ,      7278717,         6,     113642,    12,         4.0,   309.1  ),
	( ''Arkansas'',              ''AR'',     ''05'' ,      3017825,        27,      52075,     8,         0.9,   115.9  ),
	( ''California'',            ''CA'',     ''06'' ,     39512223,         3,     155973,    12,         3.5,  2700.0  ),
	( ''Colorado'',              ''CO'',     ''08'' ,      5758736,         8,     103730,    10,         3.5,   336.4  ),
	( ''Connecticut'',           ''CT'',     ''09'' ,      3565387,        48,       4845,     1,         1.0,   242.2  ),
	( ''Delaware'',              ''DE'',     ''10'' ,       973764,        50,       1955,     3,         0.3,    63.9  ),
	( ''District of Columbia'',  ''DC'',     ''11'' ,       705749,        52,        137,     5,         3.2,  125.94  ),
	( ''Florida'',               ''FL'',     ''12'' ,     21477737,        26,      53997,     6,         3.5,   917.0  ),
	( ''Georgia'',               ''GA'',     ''13'' ,     10617423,        21,      57919,     6,         2.6,   522.4  ),
	( ''Hawaii'',                ''HI'',     ''15'' ,      1415872,        47,       6423,    12,         1.0,    80.8  ),
	( ''Idaho'',                 ''ID'',     ''16'' ,      1787065,        11,      82751,    12,         4.1,    69.9  ),
	( ''Illinois'',              ''IL'',     ''17'' ,     12671821,        24,      55593,     7,         2.1,   764.2  ),
	( ''Indiana'',               ''IN'',     ''18'' ,      6732219,        38,      35870,     7,         1.9,   326.1  ),
	( ''Iowa'',                  ''IA'',     ''19'' ,      3155070,        23,      55875,     7,         1.4,   170.7  ),
	( ''Kansas'',                ''KS'',     ''20'' ,      2913314,        13,      81823,    10,         1.9,   152.3  ),
	( ''Kentucky'',              ''KY'',     ''21'' ,      4467673,        36,      39732,     8,         1.4,   186.1  ),
	( ''Louisiana'',             ''LA'',     ''22'' ,      4648794,        33,      43566,    11,         1.1,   231.2  ),
	( ''Maine'',                 ''ME'',     ''23'' ,      1344212,        39,      30865,     1,         1.9,    56.7  ),
	( ''Maryland'',              ''MD'',     ''24'' ,      6045680,        42,       9775,     5,         1.6,   367.9  ),
	( ''Massachusetts'',         ''MA'',     ''25'' ,      6949503,        45,       7838,     1,         2.7,   501.3  ),
	( ''Michigan'',              ''MI'',     ''26'' ,      9986857,        22,      56539,     7,         2.7,   468.4  ),
	( ''Minnesota'',             ''MN'',     ''27'' ,      5639632,        14,      79617,     9,         2.2,   331.4  ),
	( ''Mississippi'',           ''MS'',     ''28'' ,      2976149,        31,      46914,     6,         1.0,   101.6  ),
	( ''Missouri'',              ''MO'',     ''29'' ,      6137428,        18,      68898,     8,         2.3,   282.2  )
;

INSERT INTO us_state
    ( state_name,             state,  FIPS_code,  population, area_rank, area_sq_mi, fed_area, gdp_growth, gdp ) values
	( ''Montana'',               ''MT'',     ''30'' ,      1068778,         4,     145556,     9,         0.9,    44.8  ),
	( ''Nebraska'',              ''NE'',     ''31'' ,      1934408,        15,      76878,    10,         1.5,   112.2  ),
	( ''Nevada'',                ''NV'',     ''32'' ,      3080156,         7,     109806,    12,         3.2,   146.2  ),
	( ''New Hampshire'',         ''NH'',     ''33'' ,      1359711,        44,       8969,     1,         2.2,    75.6  ),
	( ''New Jersey'',            ''NJ'',     ''34'' ,      8882190,        46,       7419,     5,         2.0,   554.7  ),
	( ''New Mexico'',            ''NM'',     ''35'' ,      2096829,         5,     121365,    11,         1.8,    92.6  ),
	( ''New York'',              ''NY'',     ''36'' ,     19453561,        30,      47224,     2,         2.1,  1400.0  ),
	( ''North Carolina'',        ''NC'',     ''37'' ,     10488084,        29,      48718,     5,         2.9,   496.1  ),
	( ''North Dakota'',          ''ND'',     ''38'' ,       762062,        17,      68994,     9,         2.5,    51.2  ),
	( ''Ohio'',                  ''OH'',     ''39'' ,     11689100,        35,      40953,     4,         1.8,   601.5  ),
	( ''Oklahoma'',              ''OK'',     ''40'' ,      3956971,        19,      68679,    10,         1.8,   193.0  ),
	( ''Oregon'',                ''OR'',     ''41'' ,      4217737,        10,      96003,    12,         3.4,   213.7  ),
	( ''Pennsylvania'',          ''PA'',     ''42'' ,     12801989,        32,      44820,     4,         2.1,   712.1  ),
	( ''Puerto Rico'',           ''PR'',     ''72'' ,      3194000,        49,       3515,     2,         0.4,   101.0  ),
	( ''Rhode Island'',          ''RI'',     ''44'' ,      1059361,        51,       1034,     1,         0.6,    53.7  ),
	( ''South Carolina'',        ''SC'',     ''45'' ,      5148714,        40,      30111,     5,         1.6,   202.8  ),
	( ''South Dakota'',          ''SD'',     ''46'' ,       884659,        16,      75898,     9,         1.3,    45.9  ),
	( ''Tennessee'',             ''TN'',     ''47'' ,      6833174,        34,      41220,     6,         3.0,   322.9  ),
	( ''Texas'',                 ''TX'',     ''48'' ,     28995881,         2,     261914,    11,         3.2,  1700.0  ),
	( ''Utah'',                  ''UT'',     ''49'' ,      3205958,        12,      82168,    12,         4.3,   157.2  ),
	( ''Vermont'',               ''VT'',     ''50'' ,       623989,        43,       9249,     1,         1.2,    30.0  ),
	( ''Virginia'',              ''VA'',     ''51'' ,      8535519,        37,      39598,     5,         2.4,    71.3  ),
	( ''Virgin Islands'',        ''VI'',     ''78'' ,       106977,        53,         68,    12,         0.24,     3.85),
	( ''Washington'',            ''WA'',     ''53'' ,      7614893,        20,      66582,    12,         5.7,   506.7  ),
	( ''West Virginia'',         ''WV'',     ''54'' ,      1792147,        41,      24087,     5,         2.4,    71.3  ),
	( ''Wisconsin'',             ''WI'',     ''55'' ,      5822434,        25,      54314,     7,         2.5,   299.8  ),
	( ''Wyoming'',               ''WY'',     ''56'' ,       578759,         9,      97105,    10,         0.3,    38.4  )
;


CREATE TABLE name_list (
	name_list_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	real_name text check ( length(real_name) >= 1 ) not null,
	age int check ( age > 0 and age < 154 ) not  null,
	state char varying (2) not null,
	pay numeric(10,2)
);

CREATE INDEX name_list_idx1 on name_list ( real_name );
CREATE INDEX user_real_name_ci_idx1 ON name_list ((lower(real_name)));

ALTER TABLE name_list
	ADD CONSTRAINT name_list_state_fk
	FOREIGN KEY (state)
	REFERENCES us_state (state)
;

INSERT INTO name_list ( real_name, age, state, pay ) values
	( ''Bob True'',            22, ''WY'', 31000 ),
	( ''Jane True'',           20, ''WY'', 28000 ),
	( ''Tom Ace'',             31, ''NJ'', 82500 ),
	( ''Steve Pen'',           33, ''NJ'', 89400 ),
	( ''Laura Jean Alkinoos'', 34, ''PA'', 120000 ),
	( ''Philip Schlump'',      62, ''WY'', 101200 ),
	( ''Liz Trubune'',         30, ''WY'', 48000 ),
	( ''Lary Smith'',          58, ''NJ'', 48000 ),
	( ''Dave Dave'',           21, ''NJ'', 48000 ),
	( ''Laura Ann Alkinoos'',  34, ''PA'', 48000 )
;


```

You should have both states and territories with square miles.

```
SELECT * from us_state;
```


#### Validate: SQL-Select,"select ''PASS'' from ( select count(1) as cnt from us_state ) as foo where foo.cnt = 53"

#### FilesToRun: hw13_4.sql
#### FilesToRun: hw13_5.sql
#### FilesToRun: hw13_6.sql
#### FilesToRun: hw13_7.sql


' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'add40e12-c881-434e-a172-e2675b08572c', 'Interactive - 14 - data types', '
This is really the stuff from chapter 3 in the book.

When we create a table,  ( Already created in the last homework when you ran the file )

```
CREATE TABLE us_state (
	state_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	state_name text NOT NULL,
	state char varying (2) NOT NULL,
	FIPS_code char varying (2) NOT NULL,
	area_rank int not null default 9999,
	area_sq_mi numeric not null default 0
);

```

we specify that the columns have a "type" and constraints on the data.

The most common set of types are (ordered from my own code on how frequently I use each type):

| Type               | Description                                                           |
|--------------------|-----------------------------------------------------------------------|
| text               | a string of 0 or more characters.                                     |
| varchar(n)         | a string of 0 to `n` characters.                                      |
| uuid               | a UUID.                                                               |
| date               | a date - not a time.                                                  |
| time               | a time value.                                                         |
| bigint, int8       | 8 byte integer                                                        |
| timestamp          | a date and a time - usually with a time zone.                         |
| numeric            | a large number with (think 130k digits, before/after decimal point)   |
| decimal            | a large number with (think 130k digits, before/after decimal point)   |
| float              | 4 byte - a floating point number with an exponent                     |
| real               | 4 byte - a floating point number with an exponent                     |
| json, jsonb        | JSON data                                                             |
| double precision   | 8 byte - a floating point number with an exponent                     |
| bit, varbit        | variable length bit string values                                     |
| serial             | a 4 byte auto-generated integer that counts up                        |
| interval           | a time interval can be +/- 178million years                           |
| bytea              | byte array - binary data                                              |
| boolean            | true/false                                                            |
| point, line        | geometric data                                                        |
| box, path          | geometric data                                                        |
| polygon, cirlce    | geometric data                                                        |
| tvector, tsquery   | full text search type                                                 |
| inet, cidr         | interget address tyeps, IPv4 122.4.3.22 or IPV6                       |
| user defined tyeps | The type system is extensible!                                        |


Also there is a Geographic Information Package for PostgreSQL that is very good.
It is built on top of the geometric data types and GIN indexes.

We are not going to use all of these types.  Just a few of the most common ones like timestamp.

Often we want a column to show when a new row is inserted or updated in a table.
Let''s add these to our name_list table.

```
ALTER TABLE name_list add updated timestamp ;
ALTER TABLE name_list add created timestamp
	default current_timestamp not null  ;

```

To make the ''updated'' column work we need have PostgreSQL run some
code when an update happens.  This kind of a thing is called a "trigger".

Let''s add a trigger to the table.
Run the file `hw14_2.sql`.  The contents of the file is shown below.


```

CREATE OR REPLACE function name_list_upd()
RETURNS trigger AS
$$
BEGIN
  NEW.updated := current_timestamp;
  RETURN NEW;
END
$$
LANGUAGE ''plpgsql'';


CREATE TRIGGER name_list_trig
	BEFORE update ON name_list
	FOR EACH ROW
	EXECUTE PROCEDURE name_list_upd();


```


Now when we do an update on this table it will set the updated field
to the current time.



#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw14_2.sql

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', 'Interactive - 15 - select with group data of data', '
SQL has the ability to group data.  When we use the count() function
we are grouping by data.  You can only group by data that you
select - you can not group by hidden columns.   However you can
use a nested select to pick just some of the columns after you
have grouped.  The last part of this homework will show this.
First we have to group the data.

```
SELECT
		fed_area,
		min(gdp_growth) as min_growth,
		avg(gdp_growth) as avg_growth,
		max(gdp_growth) as max_growth,
		string_agg(state, '','' ORDER BY state) as  state_list
	FROM us_state
	GROUP BY fed_area
	ORDER BY fed_area
;

```

You can group by more than one column.  All the non-grouped columns
have to be in some form aggregated.   In this example we have min, max, avg
and string_agg.

To group columns the database has to sort them.  So an order by is usually
free.  If you group by a column that there is a b-tree index on the group
by is much faster.   The database will use the index instead of re-sorting
the data.  Other index types do not provide sorted data (gin, gist, hash etc).

Let''s say we just want the avg_growth and the list of states.  We
have to have fed_area to do the grouping - but we can nest
our select.


```
SELECT t1.avg_growth, t1.state_list
	FROM (
		SELECT
				t2.fed_area,
				avg(t2.gdp_growth) as avg_growth,
				string_agg(t2.state, '','' ORDER BY state) as  state_list
			FROM us_state as t2
			GROUP BY t2.fed_area
	) as t1
;

```

## Take Away

1. group by
2. order by
3. min/avg/max
4. nested selects in FROM
4. Aliasing tables int the "FROM" with "as"

## Book

- group by - page 120 to 121
- min, max - page 119
- avg - 64, 195
- order by - page 15, 16
- alias table name - page 86
- nested query in From - page 195 (avg used also)


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '16e9bfe6-8740-477e-94aa-46065b2dba90', 'Interactive - 16 - count matching rows in a select', '
You can count stuff that is grouped.   This turns out to be very useful.

Suppose that we want to know how many states are in a group and the
sum of the population in the group.

```
SELECT
		fed_area,
		round(avg(gdp_growth)::numeric,2)::text||''%'' as avg_growth,
		sum(population) as sum_population,
		count(state) as no_of_states,
		string_agg(state, '','' ORDER BY state) as  state_list
	FROM us_state
	GROUP BY fed_area
	ORDER BY 2 desc
;

```

You should get 12 rows order by decreasing average growth.




## Take Away

1. You can count the number of rows in the group with count.
2. You can order by a column position this is the "2 desc".
3. The function round() takes a numeric argument - but the output of avg() is a double precision float.  A type cast is used.
4. You can convert from the numeric result of round to text with a "::text" type cast - then add the ''%'' to show it is a percentage.



## Book

- group by - page 120 to 121
- avg - 64
- order by - page 15, 16


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '4bb34a81-fce8-4efe-a97d-54367730be6f', 'Interactive - 17 - select with join ( inner join, left outer join )', '
SQL starts to get fun, and become a programming task as soon
as we have more than one table.

We have already seen a join between name_list and us_state based
on state code.  Let''s get specific on how joins work and how
to use them.

The most common join is the "inner" join.   This is when two
tables have a common field and we match that field.

The SQL system takes the first table and creates a loop that
will iterate across the 2nd table and where the field matches
it connects (joins) the data together.

This is all based on sets of data.

Suppose that we have 2 tables, employees and departments.


#### Employee Table


| Name				 | Dept Code |  Pay        |
|--------------------|-----------|-------------|
| Bob                |   1       | $36,000.00  |
| Jane               |   1       | $140,000.00 |
| Sally              |   2       | $121,000.00 |
| Liz                |   2       | $101,000.00 |
| Dave               |   1       | $51,000,00  |
| CEO Kelly          |   3       | $1.00       |
| Uncle Bob          |   NULL    | $96,000.00  |
| Brother Charley    |   NULL    | $48,000.00  |


#### Department

| Department		 | Dept Code |
|--------------------|-----------|
| Sales              |   1       |
| Development        |   2       |
| Executive          |   3       |
| Maintenance        |   4       |

Both tables have `Dept_Code` and by matching them
up we can find that Sally and Liz and the
Development Department.

File: `hw17_1.sql`


```

DROP TABLE if exists employee;
DROP TABLE if exists department;

CREATE TABLE employee (
	employee_id serial not null primary key,
	name text not null,
	department_id  int,
	pay numeric(12,2) not null default 0
);

CREATE TABLE department (
	department_id  serial not null primary key,
	dept_name text not null
);

INSERT INTO department ( department_id, dept_name ) values
	( 1, ''Sales'' ),
	( 2, ''Development'' ),
	( 3, ''Execuatie'' ),
	( 4, ''Maintenance'' )
;

INSERT INTO employee (  name, department_id, pay ) values
	( ''Bob'', 1, 36000 ),
	( ''Jane'', 1, 140000 ),
	( ''Sally'', 2, 121000 ),
	( ''Liz'', 2, 101000 ),
	( ''Dave'', 1, 51000 ),
	( ''CEO Kelly'', 3, 1 ),
	( ''Uncle Bob'', NULL, 96000 ),
	( ''Brother Charley'', NULL, 48000 )
;



```

We have created the table department with a set of used IDs, 1..4.  We need
to update the number generator for the `serial` data to reflect this.
If we don''t it will start with 1 and we have already used 1.  We will not
be able to insert data into it.

The command to do this is:

```
ALTER SEQUENCE department_department_id_seq RESTART WITH 5;

```

However you will want to be able to generate this kind of an alter.
The name for the sequence is,  the table name, concatenated with
an underscore, then the column name, then `_seq`.

## Inner Join

This is the set that both tables have in common.

![PostgreSQL Inner Join](PostgreSQL-Inner-Join.png)


```
SELECT t1.name as "Employee Name", t2.dept_name as "Department Name", t1.pay "Year pay"
	FROM employee as t1
		JOIN department as t2 on ( t1.department_id = t2.department_id )
;

```

You should get back 6 rows.  Note that "Uncle Bob" fails to show up.
This is an inner join - where the common field is not null.

Note the double quotes `"` around the column names to allow for upper-lower
case aliases on column names.

We can get the database to fill in NULLs for all the values for
`Uncle Bob`.  This is a left outer join.  This is the 2nd most common
join.

## Left Outer Join

This is all the rows in the FROM table joined to the right table
or NULLs where they don''t join.

![Left Outer Join](PostgreSQL-Left-Outer-Join.png)

```
SELECT t1.name as "Employee Name", t2.dept_name as "Department Name", t1.pay "Year Pay"
	FROM employee as t1
		LEFT OUTER JOIN department as t2 on ( t1.department_id = t2.department_id )
;

```

Now you should get back 8 rows including "Uncle Bob".


Now we can answer the question how many people are not in departments and
how much do they get payed.

```
SELECt t1.name as "Employee Name", t2.dept_name as "Department Name", t1.pay "Year Pay"
	FROM employee as t1
		LEFT OUTER JOIN department as t2 on ( t1.department_id = t2.department_id )
	WHERE t1.department_id is null
;

```

or how much pay is spent on employees not in departments.


```
SELECT sum(t0.pay) as "Total Pay"
FROM (
	SELECT t1.name, t2.dept_name, t1.pay
	FROM employee as t1
		left outer join department as t2 on ( t1.department_id = t2.department_id )
	WHERE t1.department_id is null
) t0
;

```

Interesting .... That is $144,000.00 payed out to employees that aren''t in
departments.


There are "right" joins but usually I just swap the order of the tables and use the left joins.



#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw17_1.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'a7c7e427-149d-49d9-bbbe-08a485775659', 'Interactive - 18 - More joins (full joins)', '
We will use the same data (hw17_1.sql)


#### Employee Table


| Name				 | Dept Code |  Pay        |
|--------------------|-----------|-------------|
| Bob                |   1       | $36,000.00  |
| Jane               |   1       | $140,000.00 |
| Sally              |   2       | $121,000.00 |
| Liz                |   2       | $101,000.00 |
| Dave               |   1       | $51,000,00  |
| CEO Kelly          |   3       | $1.00       |
| Uncle Bob          |   NULL    | $96,000.00  |
| Brother Charley    |   NULL    | $48,000.00  |


#### Department

| Department		 | Dept Code |
|--------------------|-----------|
| Sales              |   1       |
| Development        |   2       |
| Executive          |   3       |
| Maintenance        |   4       |


## Full Join

This is more of a concatenation of rows of data.

![Full Outer Join](PostgreSQL-Full-Outer-Join.png)

```
SELECT t1.name as "Employee Name", t2.dept_name as "Department Name", t1.pay "Year pay"
	FROM employee as t1
		FULL JOIN  department as t2 on ( t1.department_id = t2.department_id )
;

```

You shoudl get back 9 rows - note where the NULL values are.


## Full Outer Join - Unique to Both tables Rows

You can also use the join to find the rows that are unique in each table.

![PostgreSQL Inner Join](PostgreSQL-Full-Outer-Unique-Join.png)


```
SELECT t1.name as "Employee Name", t2.dept_name as "Department Name", t1.pay "Year pay"
	FROM employee as t1
		FULL JOIN department as t2 on ( t1.department_id = t2.department_id )
	WHERE t1.name is null
	   OR t2.dept_name is null
;

```

You should get back 3 rows.



#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'c8d2f555-dd5e-4c46-802e-c7f9015f92f2', 'Interactive - 19 - select using sub-query and exists', '
Let''s use some of our joins to delete some data.

Let''s get rid of the people that are not in a department.

```
SELECT t0.name as "Employee Name", t0.dept_name as "Department Name", t0.pay "Year Pay"
	FROM  (
			SELECT t1.name, t2.dept_name, t1.pay, t1.employee_id
			FROM employee as t1
				LEFT OUTER join department as t2 on ( t1.department_id = t2.department_id )
			WHERE t1.department_id is null
			ORDER BY 1, 3 desc, 4
		) as t0
	WHERE
		exists (
			SELECT ''found''
			FROM employee as t5
			WHERE t5.pay > 65000
			  and t5.employee_id = t0.employee_id
		)
;

```

You should get back 2 rows.

These rows should be the offending rows with the department-less employees.


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'fe780a7c-ccce-4b6b-8dd6-45ba8eeb4988', 'Interactive - 20 - delete with in based sub-query', '
Let''s use some of our joins to delete some data.

We will recreate the data from homework 17 again.  The file is hw17_1.sql

```

DROP TABLE if exists employee;
DROP TABLE if exists department;

CREATE TABLE employee (
	employee_id serial not null primary key,
	name text not null,
	department_id  int,
	pay numeric(12,2) not null default 0
);

CREATE TABLE department (
	department_id  serial not null primary key,
	dept_name text not null
);

INSERT INTO department ( department_id, dept_name ) values
	( 1, ''Sales'' ),
	( 2, ''Development'' ),
	( 3, ''Execuatie'' ),
	( 4, ''Maintenance'' )
;

INSERT INTO employee (  name, department_id, pay ) values
	( ''Bob'', 1, 36000 ),
	( ''Jane'', 1, 140000 ),
	( ''Sally'', 2, 121000 ),
	( ''Liz'', 2, 101000 ),
	( ''Dave'', 1, 51000 ),
	( ''CEO Kelly'', 3, 1 ),
	( ''Uncle Bob'', NULL, 96000 ),
	( ''Brother Charley'', NULL, 48000 )
;



```


Let''s get rid of the people that are not in a department.

```
DELETE FROM employee as t0
	WHERE t0.employee_id in (
		SELECT t1.employee_id
		FROM employee as t1
			LEFT OUTER join department as t2 on ( t1.department_id = t2.department_id )
		WHERE t1.department_id is null
	)
;

```

It should delete 2 rows.

There are performance reasons to use either exists or in.  Exists combines the queries and is better when the tables are similar in size.
In is usually better when the left table is much smaller than the parent table.  In results in the inside query running to completion
before the outside query.



#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '135d22db-31f2-415f-81be-fb35ed656492', 'Interactive - 21 - select with union / minus', '
You can concatenate results with a "UNION" between two selects.  This can be kind of like a full join
but instead of getting back nulls you can fill in values that you like.

```
	SELECT t1.name as "Employee Name", ''No Departmnt'' "Department Name", t1.pay "Year Pay"
	FROM employee as t1
	WHERE t1.department_id is null
UNION
	SELECT ''No Name'' as "Employee Name", t2.dept_name as "Department Name", 0.0 "Year Pay"
	FROM department as t2
ORDER BY 1
;

```

You should get back 4 rows.


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '7ca6decd-a2d5-4fb4-b877-d027118b9579', 'Interactive - 22 - recursive select - populating existing tables', '
It is also possible to store and query recursive data.   You need a table
with and "id" and a "parent_id" that referees back to the same table.

```
DROP TABLE if exists tree_example ;

CREATE TABLE tree_example (
	id  			int not null primary key,
	manager_id  	int,
	name 			text
);

INSERT INTO tree_example ( id, name, manager_id ) values
	(1, ''Michael North'', NULL),
	(2, ''Megan Berry'', 1),
	(3, ''Sarah Berry'', 1),
	(4, ''Zoe Black'', 1),
	(5, ''Tim James'', 1),
	(6, ''Bella Tucker'', 2),
	(7, ''Ryan Metcalfe'', 2),
	(8, ''Max Mills'', 2),
	(9, ''Benjamin Glover'', 2),
	(10, ''Carolyn Henderson'', 3),
	(11, ''Nicola Kelly'', 3),
	(12, ''Alexandra Climo'', 3),
	(13, ''Dominic King'', 3),
	(14, ''Leonard Gray'', 4),
	(15, ''Eric Rampling'', 4),
	(16, ''Piers Paige'', 7),
	(17, ''Ryan Henderson'', 7),
	(18, ''Frank Tucker'', 8),
	(19, ''Nathan Ferguson'', 8),
	(20, ''Kevin Rampling'', 8)
;

```

Now we can to a recursive query.   In PostgreSQL they are composed of a base query
unironed with all the children.

```
WITH RECURSIVE subordinates AS (
		SELECT
			id,
			manager_id,
			name
		FROM tree_example
		WHERE id = 2
	UNION
		SELECT
			e.id,
			e.manager_id,
			e.name
		FROM tree_example e
		INNER JOIN subordinates s ON s.id = e.manager_id
) SELECT * FROM subordinates
;

```


#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw22_1.sql

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '2d6284fc-96ff-4b30-b976-e9b91ded9bb5', 'Interactive - 23 - with - pre-selects to do stuff.', '
You can run queries before your main query and give the results names.
These are run in order and that can have substantial advantages.

The general syntax is

```
with
	temp_name as ( select ... )

select stufff.

	from  temp_name

;
```

```
WITH
	mystery_employess as ( select sum(pay) total_pay  from name_list where state = ''WY'' ),
	normal_employees as ( select sum(pay) total_pay from name_list where state in ( ''NJ'', ''NY'' ) )
SELECT round( ( tWY.total_pay / ( tWY.total_pay + tEast.total_pay ) ) * 100.0, 2)  as relative_pay
FROM
	mystery_employess  as tWY
	, normal_employees  as tEast
;

```


You should get back a single row of data that tells you that in Wyoming you get 43% as much pay
as a job in NY or NJ (Note that the data in this example is not totally accurate.  Also you have
a much lower cost of living in Wyoming than you do in NY NY.)


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '18487b2d-3c71-4549-ba44-c2c905d0f8ca', 'Interactive - 24 - truncate table', '
PostgreSQL (and most other SQL databases, Oracle, DB/2, DB/2 Universal etc)
provide the ability to discard ALL the data in a table.     This is implemented
as a re-write of the table header info and putting all the data in the table
on the re-claim block list.  So it is linear time(fast).

Also it is a part of the Data Definition Language (not Data Manipulation)
so it often can not be used in a transaction.  It can not be rolled back
if the transaction fails.

Also when you use truncate stuff like triggers for delete will not fire.

```
TRUNCATE TABLE name_list;
SELECT count(1) from name_list;

```

You should get back 0 rows.


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '3b175dee-87b0-4e1f-8300-8d679ca37927', 'Interactive - 25 - drop cascade', '
You can drop a table or other database object.  This destroys it.
PostgreSQL provides the ability to do the "drop" but only if
the object exists.


```
drop table name_list;
```

Will error if the object is not there.

```
DROP TABLE if exists name_list cascade;

```


Drop can also detach a table from the set of constraints that it
may have.  This is the "cascade" option to remove foreign
key constraints.  Do note that in Oracle this will drop
additional tables - not just constraints.  Take care with
"cascade".


```
DROP TABLE if exists us_state cascade;

```


Let''s re-create our tables at this point so we have fresh
data for future homework problems.

Run the file to re-create : hw13_4.sql

drop table if exists us_state cascade;



#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw13_4.sql
#### FilesToRun: hw25_2.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', 'Interactive - 26 - 1 to 1 relationship  				(pk to pk)', '
This exercise creates a bunch of tables, triggers indexes.  Run each of the files.

The application uses a small set of user authorization tables from a wrapper application.
We have to create the tables and the tables that match with in the application.


Our 1 to 1 relationship is between `"t_ymux_user"` and our application table
`ct_login`.    ct_login privies extra application specific columns that every user has
to have.

We are just going to create all 6 tables - then explore the relationships.





3 Tables From The Security Application
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The Tables are "t_ymux_user" , "ct_homework_ans"  and  "t_ymux_user_log" .


Run the file `hw26_01.sql`

```
CREATE EXTENSION if not exists "uuid-ossp";
CREATE EXTENSION if not exists pgcrypto;

DROP TABLE if exists "t_ymux_user" cascade ;

CREATE TABLE "t_ymux_user" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "username" 			text
	, "password" 			text
	, "realm" 				text
	, "real_name" 			text
	, "salt" 				text
	, "email" 				text
	, "email_confirmed" 	char varying (1) default ''n'' not null
	, "setup_2fa_complete" 	char varying (1) default ''n'' not null
	, "rfc_6238_secret"		text
	, "recovery_token" 		text
	, "recovery_expire" 	timestamp
	, "parent_user_id"		uuid
	, "org_user_id"			uuid
	, "auth_token"			text
	, "acct_expire" 		timestamp
	, "updated" 			timestamp
	, "created" 			timestamp default current_timestamp not null
);


create unique index "t_ymux_user_u1" on "t_ymux_user" ( "username" );
create index "t_ymux_user_p1" on "t_ymux_user" ( "email" );
create unique index "t_ymux_user_u3" on "t_ymux_user" ( "recovery_token" );
create index "t_ymux_user_p2" on "t_ymux_user" ( "created", "setup_2fa_complete" );
create index "t_ymux_user_p3" on "t_ymux_user" ( "created", "email_confirmed" );




CREATE OR REPLACE function t_ymux_user_upd()
RETURNS trigger AS $$
BEGIN
	NEW.updated := current_timestamp;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


CREATE TRIGGER t_ymux_user_trig
	BEFORE update ON "t_ymux_user"
	FOR EACH ROW
	EXECUTE PROCEDURE t_ymux_user_upd();

```

Run the file `hw26_02.sql`

```

-- -------------------------------------------------------- -- --------------------------------------------------------
-- Note the "auth_token" is the "ID" for this row. (Primnary Key)
-- -------------------------------------------------------- -- --------------------------------------------------------

drop TABLE if exists "t_ymux_auth_token" cascade ;

CREATE TABLE "t_ymux_auth_token" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "user_id"				uuid not null
	, "updated" 			timestamp
	, "created" 			timestamp default current_timestamp not null
);

create index "t_ymux_auth_token_p1" on "t_ymux_auth_token" ( "user_id" );
create index "t_ymux_auth_token_p2" on "t_ymux_auth_token" ( "created" );


ALTER TABLE "t_ymux_auth_token"
	ADD CONSTRAINT "t_ymux_auth_token_user_id_fk1"
	FOREIGN KEY ("user_id")
	REFERENCES "t_ymux_user" ("id")
;

CREATE OR REPLACE function t_ymux_auth_token_upd()
RETURNS trigger AS $$
BEGIN
	NEW.updated := current_timestamp;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


CREATE TRIGGER t_ymux_auth_token_trig
	BEFORE update ON "t_ymux_auth_token"
	FOR EACH ROW
	EXECUTE PROCEDURE t_ymux_auth_token_upd();

```

Run the file `hw26_03.sql`

```
CREATE SEQUENCE t_log_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

DROP TABLE if exists "t_ymux_user_log" cascade ;

CREATE TABLE "t_ymux_user_log" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "user_id"				uuid
	, "seq"	 				bigint DEFAULT nextval(''t_log_seq''::regclass) NOT NULL
	, "activity_name"		text
	, "updated" 			timestamp
	, "created" 			timestamp default current_timestamp not null
);

create index "t_ymux_user_log_p1" on "t_ymux_user_log" ( "user_id", "seq" );
create index "t_ymux_user_log_p2" on "t_ymux_user_log" ( "user_id", "created" );

ALTER TABLE "t_ymux_user_log"
	ADD CONSTRAINT "t_ymux_user_log_user_id_fk1"
	FOREIGN KEY ("user_id")
	REFERENCES "t_ymux_user" ("id")
;

CREATE OR REPLACE function t_ymux_user_log_upd()
RETURNS trigger AS $$
BEGIN
	NEW.updated := current_timestamp;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


CREATE TRIGGER t_ymux_user_log_trig
	BEFORE update ON "t_ymux_user_log"
	FOR EACH ROW
	EXECUTE PROCEDURE t_ymux_user_log_upd();

```




## Applications Tables

"t_ymux_user" joins to ct_login on a 1 to 1 basis.  Each time a user is inserted
tinto ct_login a set of rows is populated for all the homework that exits into
ct_homework_ans.


ct_login
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the file `hw26_04.sql`

```
DROP TABLE if exists ct_login cascade ;

CREATE TABLE ct_login (
	  user_id					uuid not null primary key -- 1 to 1 to "t_ymux_user"."id"
	, pg_acct					char varying (20) not null
	, class_no					text default ''4010-BC'' not null	-- 4820 or 4010-BC - one of 2 classes
	, lang_to_use				text default ''Go'' not null		-- Go or PostgreSQL
	, misc						JSONb default ''{}'' not null		-- Whatever I forgot
);

create unique index ct_login_u1 on ct_login ( pg_acct );
create index ct_login_p1 on ct_login using gin ( misc );

ALTER TABLE ct_login
	ADD CONSTRAINT ct_login_user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES "t_ymux_user" ("id")
;

```


ct_homeowrk
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the file `hw26_05.sql`

```
DROP TABLE if exists ct_homework cascade;

CREATE TABLE ct_homework (
	  homework_id				uuid DEFAULT uuid_generate_v4() not null primary key
	, homework_title			text not null
	, homework_no					text not null
	, points_avail				int not null default 10
	, video_url					text not null
	, video_img					text not null
	, lesson_body 				JSONb not null 	-- body, html, text etc.
);

CREATE INDEX ct_homework_p1 on ct_homework ( homework_no );

```

ct_homeowrk_ans
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the file `hw26_06.sql`

```
DROP TABLE if exists ct_homework_ans cascade ;

CREATE TABLE ct_homework_ans (
	  homework_ans_id			uuid DEFAULT uuid_generate_v4() not null primary key
	, homework_id				uuid not null
	, user_id					uuid not null
	, points					int not null default 0
	, completed					char(1) default ''n'' not null
	, updated		 			timestamp
	, created 					timestamp default current_timestamp not null
);


create unique index ct_homework_ans_u1 on ct_homework_ans ( homework_id, user_id );
create unique index ct_homework_ans_u2 on ct_homework_ans ( user_id, homework_id );


-- homework_id is fk to ct_homework
ALTER TABLE ct_homework_ans
	ADD CONSTRAINT homework_id_fk
	FOREIGN KEY (homework_id)
	REFERENCES ct_homework (homework_id)
;

-- user_id is fk to ct_login
ALTER TABLE ct_homework_ans
	ADD CONSTRAINT user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES ct_login (user_id)
;


CREATE OR REPLACE function ct_homework_ans_upd()
RETURNS trigger AS $$
BEGIN
	NEW.updated := current_timestamp;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


CREATE TRIGGER ct_homework_ans_trig
	BEFORE update ON ct_homework_ans
	FOR EACH ROW
	EXECUTE PROCEDURE ct_homework_ans_upd();


```

Triggers that depend on multiple tables
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the file `hw26_07.sql`

```
CREATE OR REPLACE function ct_homework_ins()
RETURNS trigger AS $$
BEGIN
	insert into ct_homework_ans (
		user_id,
		homework_id
	) select
		t1.user_id,
		NEW.homework_id
	from ct_login as t1
	where not exists (
			select 1 as "found"
			from ct_homework_ans t2
			where t2.user_id = t1.user_id
			  and t2.homework_id = NEW.homework_id
		)
	;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


DROP TRIGGER if exists ct_homework_trig_ins_upd on ct_homework;

CREATE TRIGGER ct_homework_trig_ins_upd
	AFTER insert or update ON ct_homework
	FOR EACH ROW
	EXECUTE PROCEDURE ct_homework_ins();






CREATE OR REPLACE function ct_homework_del()
RETURNS trigger AS $$
BEGIN
	update ct_homework_ans t3
		set completed = ''x''
		where t3.homework_id = NEW.homework_id
		  and t3.completed = ''n''
	;
	RETURN OLD;
END
$$ LANGUAGE ''plpgsql'';


DROP TRIGGER if exists ct_homework_trig_del on ct_homework;

CREATE TRIGGER ct_homework_trig_del
	BEFORE delete ON ct_homework
	FOR EACH ROW
	EXECUTE PROCEDURE ct_homework_del();








CREATE OR REPLACE function ct_login_ins()
RETURNS trigger AS $$
BEGIN
	insert into ct_homework_ans (
		user_id,
		homework_id
	) select
		NEW.user_id,
		t1.homework_id
	from ct_homework as t1
	where not exists (
			select 1 as "found"
			from ct_homework_ans t2
			where t2.user_id = NEW.user_id
			  and t2.homework_id = t1.homework_id
		)
	;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


drop TRIGGER if exists ct_login_trig on ct_login;

CREATE TRIGGER ct_login_trig
	AFTER insert ON ct_login
	FOR EACH ROW
	EXECUTE PROCEDURE ct_login_ins();

```


Homework tags
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the file `hw26_09.sql` and `hw26_10.sql`

```

DROP TABLE IF EXISTS ct_tag cascade ;

CREATE TABLE ct_tag (
	tag_id uuid DEFAULT uuid_generate_v4() not null primary key,
	tag_word text not null
);

CREATE UNIQUE INDEX ct_tag_p1 on ct_tag ( tag_word );



DROP TABLE IF EXISTS ct_tag_homework cascade ;

CREATE TABLE ct_tag_homework (
	tag_id 		uuid not null,
	homework_id uuid not null,
	primary key ( homework_id, tag_id )
);

CREATE UNIQUE INDEX ct_tag_homework_u1 on ct_tag_homework ( tag_id, homework_id );


```

Setup default data
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Run the file `hw26_11.sql` to setup data for these tables.


```
select setup_data_26();

```




#### Validate: SQL-Select,"select setup_data_26()"

#### FilesToRun: hw26_01.sql
#### FilesToRun: hw26_02.sql
#### FilesToRun: hw26_03.sql
#### FilesToRun: hw26_04.sql
#### FilesToRun: hw26_05.sql
#### FilesToRun: hw26_06.sql
#### FilesToRun: hw26_07.sql
#### FilesToRun: hw26_08.sql
#### FilesToRun: hw26_09.sql
#### FilesToRun: hw26_10.sql
#### FilesToRun: hw26_11.sql
#### FilesToRun: hw26_14.sql


' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'ec699882-15b9-4837-9177-d84622d86703', 'Interactive - 27 - 1 to 0 or 1 relationship 			(fk, unique)', '
Now that we have our tables let''s look at the relationship between
`"t_ymux_user"` and `ct_login`.   This is our 1 to 0 or 1 relationship.

It is provided by the primary key on ct_login being required but not
having a default value where a key is generated.   This is combined
with the foreign key constraint to `"t_ymux_user"`.

Try an insert to see if you can fake it out (the insert will fail).

```
insert into ct_login ( user_id, pg_acct ) values ( uuid_generate_v4(), ''x'' );

```

You should get an error.   The error indicates that you violated a foreign key and will look similar to:

If you ran it in psql or pgAmdmin your error would look like:

```
ERROR:  insert or update on table "ct_homework_ans" violates foreign key constraint "user_id_fk"
DETAIL:  Key (user_id)=(ce1d8fdd-aa04-4bb4-9ef7-72655ff63b95) is not present in table "ct_login".
CONTEXT:  SQL statement "insert into ct_homework_ans (
		user_id,
		homework_id
	) select
		NEW.user_id,
		t1.homework_id
	from ct_homework as t1
	where not exists (
			select 1 as "found"
			from ct_homework_ans t2
			where t2.user_id = NEW.user_id
			  and t2.homework_id = t1.homework_id
		)"
PL/pgSQL function ct_login_ins() line 3 at SQL statement
```

In this tool you get back:

```
{
    "Status": "error",
    "MsgSet": [
        {
            "Msg": "pq: insert or update on table \"ct_homework_ans\" violates foreign key constraint \"user_id_fk\"",
            "Stmt": "insert into ct_login ( user_id, pg_acct ) values ( uuid_generate_v4(), ''x'' )"
        }
    ]
}
```


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '10111b8b-27fc-449b-b8bd-b1bfd7ff466e', 'Interactive - 28 - 1 to n relationship				(fk)', '
The simple to understand relationship is a 1 to 0..n relationship.
This is where a parent key is a primary key and a foreign key
is in a 2nd table.  We have this relationship between
`"t_ymux_user"."id"` and the `"t_ymux_auth_token"`.

The table `"t_ymux_auth_token"` has "user_id" as a column in it.
A foreign key relationship exists between the 2 tables.  This means
that you can have more than 1 auth token for each user.   Basically
a user can login from more than one computer at a time.

```
SELECT setup_data_26();

SELECT t1.email, t2.id as "auth_token"
	FROM "t_ymux_user" as t1
		join "t_ymux_auth_token" as t2 on ( t1."id" = t2."user_id" )
;

```

You should get back 3 rows.


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '75e50b4e-6e08-4b4f-a0c7-c887ce865874', 'Interactive - 29 - m to n relationship				(fk to join table to fk)', '
Our model has a m to n (m:n) relationship in it.  This is between ct_homeowrk
and ct_tags.

This relationship requires an intermediate table.  Each side has a relationship
to the intermediate table.


ct_tag associates a tag_word with a tag_id  (Shown below - the table was created
in the script in homework 26 - you don''t need to run it.)

```
CREATE TABLE ct_tag (
	tag_id uuid DEFAULT uuid_generate_v4() not null primary key,
	tag_word text not null
);

CREATE UNIQUE INDEX ct_tag_p1 on ct_tag ( tag_word );
```

To get  a list of the words do a select from this table.

```
SELECT tag_word from ct_tag order by tag_word;

```

Note that tag_word has a unique index on it.  This prevents any duplicate tags.

The join table has just IDs in it.   To make it efficient it has indexes that
go in both directions - this allows searching from ct_tags back to ct_homework
and from ct_homework to ct_tags.    One of the unique indexes is the multi-field
primary key with homework_id, tag_id in it..   This is listed at the bottom
of the create table.  The second one is a unique index.

(shown below - do not run, just for reference)

```
CREATE TABLE ct_tag_homework (
	tag_id 		uuid not null,
	homework_id uuid not null,
	primary key ( homework_id, tag_id )
);

CREATE UNIQUE INDEX ct_tag_homework_u1 on ct_tag_homework ( tag_id, homework_id );
```

The ct_homework table (show for reference) is:


```

CREATE TABLE ct_homework (
	  homework_id				uuid DEFAULT uuid_generate_v4() not null primary key
	, homework_no				text not null
	, points_avail				int not null default 10
	, video_url					text not null
	, video_img					text not null
	, lesson_body 				JSONb not null 	-- body, html, text etc.
);

CREATE INDEX ct_homework_p1 on ct_homework ( homework_no );
```


Now do a select from the join table.


```
SELECT * from ct_tag_homework order by 1, 2;

```

## Creative Homework - Assignment 02 - program on your computer.

This Interactive assignment has the tables in it for your Assignment 02.
The assignments to be written in Python and generate SQL as output.

For this Interactive you get to write the query that will join the
tables together.  Some data has already been loaded to the tables.

Construct a select that joins all 3 tables together.  The select should have
`homework_title` and `points_avail` from the ct_homework table in it.
It should also have the `tag_word`  from ct_tag and it should join from
ct_homework to ct_tag_homework to ct_tag.   The output should be an ordered
list of homework and all the tags that are associated with each homework.
For example in homework 29 you should have 3 tags, "m to n", "m:n" and
"m:n relationship" as the tags.    Also have the tags sorted alphabetically.
This means that "m to n" will be the last of the 3 tags for homework 29.

Hints:  You need to sort by a column that you do not need to return.
This is the homework_no.   So you need to have a sub-select with
the order by on the inside select.
The example of a join is in homework 19 where we use a sub-select and
the order by on the inside select.

In homework 11 we have an example of jointing to multiple tables at
once.

The homework on inner joins is 18.

It''s important that the sort order by homework_no be done as an
integer, not as text.  You will need to use a `::int` to convert
the text field to an integer field.

The correct output data should look similar to:

```
                                      homework_title                                      |      tag_word
------------------------------------------------------------------------------------------+--------------------
  Interactive - 01 - Create Table                                                         | create table
  Interactive - 01 - Create Table                                                         | hw01
  Interactive - 01 - Create Table                                                         | type int
  Interactive - 01 - Create Table                                                         | type text
  Interactive - 01 - Create Table                                                         | type varchar
  Interactive - 02 - Insert data into "name_list"                                         | hw02
  Interactive - 02 - Insert data into "name_list"                                         | insert
...
...
...
  Interactive - 08 - create unique id and a primary key                                   | UUID
  Interactive - 09 - add a table with state codes                                         | add constraint
  Interactive - 09 - add a table with state codes                                         | alter table
  Interactive - 09 - add a table with state codes                                         | foreign key
  Interactive - 10 - add a index on the name table                                        | create index
  Interactive - 11 - add a index on the name table that is case insensitive.              | create index
...
...
...

```











#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'd4c5cf4d-0347-44d7-8281-71c8ccbe41a2', 'Interactive - 30 - 1 to ordered list relationship		(fk to uk with sequence)', '

The model has a 1 to a list of rows.  This is a more unusual relationship
because the list can be ordered by time.  Usually relationships in a SQL
database are not inherently ordered.  In  this case we use a sequence
generated number to make the set of rows in a specific order.


Taken from hw26_3.sql that you have already run.
You don''t have to run it again.
The first step is to create a sequence.   This one is `t_log_seq`.
Each time a value is used from the sequenced it increments.


```
CREATE SEQUENCE t_log_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

```

For the field "seq'' in the table we use the sequence.  This is
the `nextval(''t_log_seq''::regclass)` default value.  When we insert
we allow the default value to fill `seq`.   Our join is a 1:n join
based on user_id to the user.  Each time a security event happens
we insert the type of event to this table.   In a complete
security system this kind of a "log" has a trigger on it and
for certain events it would generate an email to the user.  An
example is the creation of a device/application account or the
change of the account password.   Some events would just be logged
for later statistical usage - like a login or logout event.

Also taken from hw26_3.sql that you have already run.
You don''t have to run it again.

```
CREATE TABLE "t_ymux_user_log" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "user_id"				uuid 	-- if null then a failed event
	, "seq"	 				bigint DEFAULT nextval(''t_log_seq''::regclass) NOT NULL
	, "activity_name"		text
	, "updated" 			timestamp
	, "created" 			timestamp default current_timestamp not null
);

create index "t_ymux_user_log_p1" on "t_ymux_user_log" ( "user_id", "seq" );
create index "t_ymux_user_log_p2" on "t_ymux_user_log" ( "user_id", "created" );
```

Run a simple select on t_ymux_user_log.  You should have at least 2 rows in
it.

```
select * from t_ymux_user_log;
```


## Assignment 03 - Create 2 tables.

50 points.

Create a table a "issue" table that has a text body column called "body".
The table needs to have a UUID primary key that is automatically generated.
Then create a child table, "issue_note" that has a list of comments with dates associated
with the "issue" table.   This list of comments needs to be ordered using
a "seq" column.   Create a sequence to support this column.  Call the sequence "t_issue_note_seq".
Both tables need to have created/updated columns that are date stamps.

Turn in the source code for creating the tables with some inserts that put
data into the tables and a select that verifies an issue and a set of
issue notes.

Don''t loose your source code for these tables.
We will use these tables in the assignment on key word search later in the class.




#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'f93250da-d45c-42da-9502-704d06299859', 'Interactive - 31 - only one row of data				(uk with no sequence)', '
With system configuration tables it is often useful to only have 1 row of data.
Each configuration item is a distinct column in the table.

This can be done with a primary key and a constraint.     The constraint limits the values
on the primary key and results in an error if a attempt to insert a 2nd row occurs.

In this example we just have `applicaiton_name` as the single configuration item.

```
DROP TABLE if exists ct_config ;

CREATE TABLE ct_config (
	config_id serial primary key check ( config_id = 1 ),
	application_name text
);

```

The first insert will work.  Then 2nd will not.

```
INSERT INTO ct_config ( application_name ) values ( ''4820 class'' );


```

and 2nd insert

```
insert into ct_config ( application_name ) values ( ''4010 blockchain class'' );

```

on the 2nd insert you should get an error similar to:

```
psql:hw31_3.sql:3: ERROR:  new row for relation "ct_config" violates check constraint "ct_config_config_id_check"
DETAIL:  Failing row contains (2, 4010 blockchain class).
```

We can prevent delete of the row with a trigger.


```
CREATE OR REPLACE FUNCTION ct_config_prevent_delete()
RETURNS trigger AS $$
BEGIN
	IF OLD.config_id = 1 THEN
		RAISE EXCEPTION ''cannot delete configuration row'';
	END IF;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ct_config_prevent_delete
	BEFORE DELETE ON ct_config
	FOR EACH ROW EXECUTE PROCEDURE ct_config_prevent_delete();


```

When you try to delete:

```
delete from ct_config;
```

You should get an error similar to:

```
ERROR:  cannot delete configuration row
CONTEXT:  PL/pgSQL function ct_config_prevent_delete() line 4 at RAISE

```



#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'a0cf0443-7164-4ee6-a7ec-dda0bb790fe5', 'Interactive - 32 - only one a fixed set of rows.		(pre-populate with key, pk, check-constraint on key)', '
There is a different way to implement a set of configuration items.  In this case the items
are stored one in each row in a set of fixed rows.


```
DROP  TABLE if exists ct_config_row ;

CREATE TABLE ct_config_row (
	  id				serial not null primary key
	, name 				text not null check ( name in (
							''security_method'',
							''encryption''
						) )
	, ty 				text not null default ''str''
	, value 			text
	, i_value 			bigint
	, b_value 			boolean
);

CREATE UNIQUE INDEX ct_config_row_p1 on ct_config_row ( name );

```

With a table like this we can insert some values:

```
INSERT INTO ct_config_row ( name, value ) values
	( ''security_method'', ''jwt'' ),
	( ''encryption'', ''es'' )
;

```

The fixed set of configuration items is checked with the check constraint
and the unique key on name.

A trigger can be used to prevent deletion of items.

```
CREATE OR REPLACE FUNCTION ct_config_row_prevent_delete()
RETURNS trigger AS $$
BEGIN
	IF OLD.config_id = 1 THEN
		RAISE EXCEPTION ''cannot delete configuration row'';
	END IF;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ct_config_row_prevent_delete
	BEFORE DELETE ON ct_config_row
	FOR EACH ROW EXECUTE PROCEDURE ct_config_row_prevent_delete();

```


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '8a6b1703-8b5d-4c29-b0c9-564f7e8b99fa', 'Interactive - 33 - types of indexes (hash, gin)', '
The default type of index in most SQL databases is a B-Tree.  This is a wide tree
that can produce sorted data based on the data type and ordering of that data.

This is not the only kind of index.

In some cases ordering of data is meaningless.  For example UUIDs do not have
any order.  We will still need to have an index to look up a value but
sorting on UUID rarely makes any sense.  A faster index for data that has
no order is a "hash" index.

An example of a hash index is:

```
CREATE INDEX ct_config_row_p2 on ct_config_row USING hash ( value );

```

Hash indexes in PostreSQL do not support unique index constraints.  In versions
before 13 of PosgreSQL there are other limitations on how indexes are replicated
and restored from a backup.

Another type of index is a Generalized Inverse Index or GIN index. This is often
used in conjunction with JSONb data types.

In interactive homework 26 part 5 we created a column lesson_body with a data
type of JSONb.  We can create a GIN index on this that will allow for fast
searches of the JSON data.

```
CREATE INDEX ct_homework_p2 on ct_homework USING gin ( lesson_body );
```




#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '271d14bf-0adb-486e-b2fe-710c7b9728fd', 'Interactive - 34 - explain', '
First you have to understand that different queries will work and perform in different
ways.  The biggest thing is the query hitting an index.  That is not the only thing.

```
select
          t1.homework_id
        , t1.homework_no
        , case
            when t3.pts = 0 then ''n''
            when t3.pts is null then ''n''
            else ''y''
          end as "has_been_seen"
        , t1.homework_no::int as i_homework_no
        , coalesce(t3.tries,NULL,0,t3.tries) as tries
    from ct_homework as t1
        left outer join ct_homework_seen as t2 on ( t1.homework_id = t2.homework_id )
        left outer join ct_homework_grade as t3 on ( t1.homework_id = t3.homework_id )
    where exists (
            select 1 as "found"
            from ct_login as t3
            where t3.user_id = ''7a955820-050a-405c-7e30-310da8152b6d''
        )
     and ( t3.user_id = ''7a955820-050a-405c-7e30-310da8152b6d''
        or t3.user_id is null )
    order by 12 asc
;

```

v.s.

```
select
          t1.homework_id
        , t1.homework_no
        , case
            when t3.pts = 0 then ''n''
            when t3.pts is null then ''n''
            else ''y''
          end as "has_been_seen"
        , t1.homework_no::int as i_homework_no
        , coalesce(t3.tries,NULL,0,t3.tries) as tries
    from ct_homework as t1
        left outer join ct_homework_seen as t2 on ( t1.homework_id = t2.homework_id )
        left outer join ct_homework_grade as t3 on ( t1.homework_id = t3.homework_id
            and t3.user_id = ''7a955820-050a-405c-7e30-310da8152b6d'' )
    where exists (
            select 1 as "found"
            from ct_login as t3
            where t3.user_id = ''7a955820-050a-405c-7e30-310da8152b6d''
        )
     order by 4 asc
;

```

both produce the same results.  The first one will construct the set of data from the
join and then filter it for the user.  An index will not be used because of the `or` and
the `null`.

The 2nd one pre-filters the table `ct_homework_graded` for just the single user.  Since this is
an equal condition an index will be used and this smaller set of data then is then
used in the join.

First setup the tables and data for this  by running `hw34_5.sql`.

A better implementation of the 2nd form is (run file `hw34_3.sql`):

```
explain analyze with per_user_ct_homework_grade as (
		select *
		from ct_homework_grade as t4
		where t4.user_id =''7a955820-050a-405c-7e30-310da8152b6d''
	)
select
          t1.homework_id
        , t1.homework_no
        , case
            when t3.pts = 0 then ''n''
            when t3.pts is null then ''n''
            else ''y''
          end as "has_been_seen"
        , t1.homework_no::int as i_homework_no
        , coalesce(t3.tries,NULL,0,t3.tries) as tries
    from ct_homework as t1
        left outer join ct_homework_seen as t2 on ( t1.homework_id = t2.homework_id )
        left outer join per_user_ct_homework_grade as t3 on ( t1.homework_id = t3.homework_id )
     order by 4 asc
;

```

This removes the now unnecessary query to check that it is a valid user id (on ct_login)
and uses a `with` to set up the per-user set of data.

The question is now how to figure out what the query planner is doing and what queries
need to be optimized.

#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw34_5.sql
#### FilesToRun: hw34_3.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '9307402a-d420-465a-8581-853c02a3a3bd', 'Interactive - 35 - views', '
The database can create a pre-defined select called a view.
A view is a query that you set up that looks like a table when selected from but
can be a join or other set of operations.  It is kind of like a query-macro.

For example we can create a view that let''s us list the unused indexes.

This is the file hw35_1.sql.

```
CREATE OR REPLACE VIEW unused_index as
SELECT
    idstat.relname AS TABLE_NAME,
    indexrelname AS INDEX_NAME,
    idstat.idx_scan AS index_scans_count,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size,
    tabstat.idx_scan AS table_reads_index_count,
    tabstat.seq_scan AS table_reads_seq_count,
    tabstat.seq_scan + tabstat.idx_scan AS table_reads_count,
    n_tup_upd + n_tup_ins + n_tup_del AS table_writes_count,
    pg_size_pretty(pg_relation_size(idstat.relid)) AS table_size
FROM pg_stat_user_indexes AS idstat
	JOIN pg_indexes ON indexrelname = indexname
			AND idstat.schemaname = pg_indexes.schemaname
	JOIN pg_stat_user_tables AS tabstat ON idstat.relid = tabstat.relid
WHERE indexdef !~* ''unique''
ORDER BY
    idstat.idx_scan DESC,
    pg_relation_size(indexrelid) DESC
;

```

Then when we want the list of unused indexes we just select from the view.


```
SELECT * from unused_index;

```



#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw35_1.sql
#### FilesToRun: hw35_2.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '06a43509-cc12-4b15-8db5-064c7269f12d', 'Interactive - 36 - stored procedures', '
We have been using store procedures for a number of examples so far.    Triggers in
PostgreSQL call stored procedures.   In PostgreSQL all stored procedures are called "functions".

PostgreSQL allows for stored procedures in multiple languages.   The default language is PL/pgSQL
and this us defined using the `LANGUAGE` specifier.  I usually put this at the end but it can
be done at the top also.

The section from $$ to $$ is the body that is saved and run when the function is called.

There are a slew of options on how a function is run.

```
CREATE or REPLACE FUNCTION function_name ( parameter_list varchar )
RETURNS varchar
AS $$
DECLARE
	data text;
BEGIN

	-- do something

	RETURN data;
END;
$$ LANGUAGE plpgsql;
```

The easy way to call a function is with a "select".
For example:


```
select function_name ( ''a'' );
```

Stored procedures have some advantages.  The code is run inside or near to the database.  This makes
the cost of moving data back and forth very low.    Stored procedures are a well developed and optimized
technology and tend to be fast.

With PL/pgSQL as the language the data types exactly match with the database and the handling of values
like NULL is clear and easy.

We can check to see if a select fails to return data and for nulls in a fashion that is built into the
language.


```
CREATE or REPLACE FUNCTION function_name ( parameter_list varchar )
RETURNS varchar
AS $$
DECLARE
	data text;
BEGIN

	SELECT ''PASS''
		INTO data
		FROM ct_config
		WHERE config_id = 1;
	IF not found THEN
		data = ''FAIL'';
	END IF;

	RETURN data;
END;
$$ LANGUAGE plpgsql;

```


In PostgreSQL a stored procedure creates a transaction at the "BEGIN" and ends it at the
"END".  This means that if you "RAISE" an error in the middle it will result in rolling back
the entire transaction.

Stored procedures can return rows of data.  Note the fact that the loop returns a single
row and then restart''s for each additional row.

For example:

```
-- using table from hw13_4.sql us_state

CREATE OR REPLACE FUNCTION getStateFipsCode()
RETURNS SETOF us_state
AS $$
DECLARE
    r us_state%rowtype;
BEGIN
    FOR r IN
		SELECT * FROM us_state
		WHERE gdp_growth > 1.0
    LOOP

        -- can do some processing here

        RETURN NEXT r; -- return current row of SELECT
    END LOOP;
    RETURN;
END
$$
LANGUAGE ''plpgsql'' ;

SELECT *
	FROM getStateFipsCode()
;

```


#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'e4d7da0b-2361-45fb-93b9-1fb3c41f31da', 'Interactive - 37 - encrypted/hashed passwords storage', '
It is a good idea to store passwords in a way that if the entire database is lost
you do not loos anybody''s password.  You need to hash them or encrypt them
in the table.

There are hash functions that are designed for this.  Of of these is
the blowfish algorithm.  It is denoted to in the encryption parameters as ''bf''.


First, we need to enable pgcrypto:

```
CREATE EXTENSION if not exists pgcrypto;

```


Then, we can create a table for storing user credentials:

```

DROP TABLE IF EXISTS example_users ;

CREATE TABLE example_users (
	id SERIAL PRIMARY KEY,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);


CREATE OR REPLACE function example_users_insert()
RETURNS trigger AS $$
DECLARE
	l_salt text;
	l_pw text;
BEGIN
	select gen_salt(''bf'')
		into l_salt;
	l_pw = NEW.password;
	NEW.password = crypt(l_pw, l_salt);
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


CREATE TRIGGER example_users_insert_trig
BEFORE insert or update ON example_users
FOR EACH ROW
EXECUTE PROCEDURE example_users_insert();


```

When we insert into the table we can then save the hash of the password instead of the
password itself.

```
INSERT INTO example_users (email, password) VALUES
	( ''pschlump@uwyo.edu'', ''my-very-bad-password'')
;

```

When we want to validate that a password that has been passed in is correct
we compare to the hashed value with:


```
SELECT id
	FROM example_users as t1
	WHERE t1.email = ''pschlump@uwyo.edu''
	  AND t1.password = crypt(''my-very-bad-password'', t1.password)
;

```

This would be a good candidate to encapsulate into a stored procedure.

```
CREATE or REPLACE FUNCTION login_correct ( un varchar, pw varchar )
RETURNS varchar
AS $$
DECLARE
	data text;
BEGIN

	BEGIN
		SELECT ''VALID-USER''
			INTO data
			FROM example_users as t1
			WHERE t1.email = un
			  AND t1.password = crypt(pw, t1.password)
			;
		IF not found THEN
			data = ''Incorrect username or password.'';
		END IF;
	EXCEPTION
		WHEN no_data_found THEN
			data = ''Incorrect username or password.'';
		WHEN too_many_rows THEN
			data = ''Incorrect username or password.'';
		WHEN others THEN
			data = ''Incorrect username or password.'';
	END;

	RETURN data;
END;
$$ LANGUAGE plpgsql;

select login_correct ( ''pschlump@uwyo.edu'', ''my-very-bad-password'' );

select login_correct ( ''pschlump@uwyo.edu'', ''my-VERY-bad-password'' );



```


#### Validate: SQL-Select,"select ''PASS'' as x"
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '3d2029dc-d986-45ad-a382-ade88f148fe6', 'Interactive - 38 - key word lookup', '
(Note this set of information is the basis for Assignment 03 on keywords)

PostgreSQL includes an extensive set of tools for key word lookup.   The word lookup is efficient and takes account of items like language and root words.

With regular SQL you have a pattern matching operator, `LIKE`.

```
SELECT real_name
	FROM name_list
	WHERE real_name  LIKE ''%ilip%''
;

```

The `%` is wild card.  Because of the use of a wild car this kind of a query will usually result in a full table scan.  In some cases it is possible to use
a GIST index on the field and that will make the search faster.

PostgreSQL has an extended set of patterns that allows matching a wider set of values.  This is with the `SIMILAR TO` operator.

```
SELECT real_name
	FROM name_list
	WHERE real_name SIMILAR TO ''(p|P)hilip%''
;

```

PostgreSQL also includes the ability to use regular expressions on text fields.  This uses POSIX regular expressions.  The Operator is the tilde `~` operator.

```
SELECT real_name
	FROM name_list
	WHERE real_name ~ ''[pP]hilip.*''
;

```

None of these takes account of things like "San Francisco"  is a single "term" in the English language.   Also things like "the" are not words that need to
be indexed.  Other languages like French have similar constructs.  PostgreSQL has an extensive set of capabilities for efficiently searching and indexing
text data.

Comparable tools are Lucine and Elastisearch.  Google also provides dedicated hardware for this kind of search.  All of these alternatives are very
expensive.  Many tolls can benefit from a search like this and at a cost of close to 0 (PostgreSQL is open source) this makes for a very interning
alternative.


## tsvector

The database uses a pair of values and an index.  The first of these is a `tsvector`.  This converts text into a set of words and locations.

```
SELECT to_tsvector(''The quick brown fox jumped over the lazy dog.'');
```

Will result in

```
                      to_tsvector
-------------------------------------------------------
 ''brown'':3 ''dog'':9 ''fox'':4 ''jump'':5 ''lazi'':8 ''quick'':2
(1 row)
```

This set of data has "The" eliminated the "word" location for each word.  The words are converted into the root words.  "lazy" is
confuted to "lazi" the root word.



## tsquery

`tsquery` is the query side of this along with the `@@` operator.

```
SELECT to_tsvector(''The quick brown fox jumped over the lazy dog'')
    @@ to_tsquery(''fox'')
;

```

Will return ''t'' for true.


```
SELECT to_tsvector(''The quick brown fox jumped over the lazy dog'')
    @@ to_tsquery(''bob'')
;

```

Will return ''f'' for false.


The query processing also allows for operators in a query.

```
SELECT to_tsvector(''The quick brown fox jumped over the lazy dog'')
    @@ to_tsquery(''fox | duck'')
;

```

Will return ''t'' for true.

There are and, `&`, or, `|` and  not, `!` operators.


## As a table

Let''s put the tsvector data type into a table and add some data.

Run the file `hw38_07.sql`.

```
DROP TABLE if exists indexed_docs ;

CREATE TABLE indexed_docs (
	doc_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
    document_title TEXT NOT NULL,
    document_body TEXT NOT NULL,
    document_tokens TSVECTOR
);

INSERT INTO indexed_docs ( document_title, document_body ) values
	( ''On Tyrany'', ''A book about how to stop tyrants and how to deal with the devaluation of democracy.'' ),
	( ''How Democracies Die'', ''A look at how other democracies around the world have failed.'' )
;

```

Note the use of the `TSVECTOR` data type.

The insert will leave the `document_tokens` as a null field.  We will have to update the table to set
the tokens.  Also note that this ignores the "document_body" field.  We will get to that in a little bit.

```
UPDATE indexed_docs d1
	SET document_tokens = to_tsvector(d1.document_title)
	FROM indexed_docs d2
;

```

Let''s query for a pair of words.


```
SELECT doc_id, document_title
	FROM indexed_docs
	WHERE document_tokens @@ to_tsquery(''die & democracy'')
;

```

Having to update the table after it is changed is far from ideal.   Let''s replace this with
a trigger so that the tokens are always updated.    Also we will add a ranking and  the `document_body`.

Run the file `hw38_10.sql`:

```
CREATE OR REPLACE function indexed_docs_ins_upd()
RETURNS trigger AS $$
DECLARE
	l_lang text;
BEGIN
	l_lang = ''english'';
	NEW.document_tokens =
		setweight ( to_tsvector ( l_lang::regconfig, coalesce(NEW.document_title,'''')), ''A'' ) ||
		setweight ( to_tsvector ( l_lang::regconfig, coalesce(NEW.document_body,'''')), ''B'' )
	;
	RETURN NEW;
END
$$ LANGUAGE ''plpgsql'';


DROP TRIGGER if exists  indexd_docs_trig_1 on indexed_docs;

CREATE TRIGGER indexd_docs_trig_1
	BEFORE insert or update ON indexed_docs
	FOR EACH ROW
	EXECUTE PROCEDURE indexed_docs_ins_upd()
;

```

and we will add some data to verify that the trigger works.

Run the file `hw38_11.sql`:

```
INSERT INTO indexed_docs ( document_title, document_body ) values
	( ''Kleptopia: How Dirty Money Is Conquering the World'', ''How the flow of dirty money is chaing world politics''),
	( ''The End of Democracies'', ''How democracies aroudn the world are failing.'' )
;

```

A select on the indexed_documents will show that all 4 rows have the `document_tokens` field
filled in.


Now add an index to the field so that searches will be fast.

Run the file `hw38_12.sql`:

```
CREATE INDEX if not exists indexed_docs_tsv_1 ON indexed_docs USING GIN (document_tokens);

```








#### Validate: SQL-Select,"select ''PASS'' as x from ( select count(1) as x from indexed_documents where document_token is not null ) as t1 where t1.x = 4 "

#### FilesToRun: hw38_07.sql
#### FilesToRun: hw38_10.sql
#### FilesToRun: hw38_11.sql
#### FilesToRun: hw38_12.sql

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'd73c126f-479c-4e17-883b-fd324eb824b8', 'Interactive - 39 - materialized views', '
One of the ways that you can improve performance in PostgreSQL and other SQL databases is a materialized view.
A regular view is a kind of "macro" that replaces the query''s from with the body of the view.

In a materialized view the data itself is copied into the "view" and you can add indexes and other things
that optimize queries on this set of data.

The downsize to materialized views is that the data can get out of sync with the original data.

Materialized views are very useful when the source of the data is a foreign data wrapper.  Especially
when the foreign data is slow or only periodically changes.

Let''s use our table with some names in it. (From Interactive Homework 08)

Run File `hw39_0.sql`:

```
CREATE EXTENSION if not exists "uuid-ossp";
CREATE EXTENSION if not exists pgcrypto;

DROP TABLE if exists name_list ;

CREATE TABLE name_list (
	name_list_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	real_name text check ( length(real_name) >= 1 ) not null,
	age int check ( age > 0 and age < 154 ) not  null,
	state char varying (2) not null,
	pay numeric(10,2)
);

CREATE INDEX name_list_idx1 on name_list ( real_name );
CREATE INDEX user_real_name_ci_idx1 ON name_list ((lower(real_name)));

```

First let''s refresh the data in name_list so that we know what is in it.

Run File `hw39_2.sql`:

```
DELETE FROM name_list ;

INSERT INTO name_list ( real_name, age, state, pay ) values
	( ''Bob True'',            22, ''WY'', 31000 ),
	( ''Jane True'',           20, ''WY'', 28000 ),
	( ''Tom Ace'',             31, ''NJ'', 82500 ),
	( ''Steve Pen'',           33, ''NJ'', 89400 ),
	( ''Laura Jean Alkinoos'', 34, ''PA'', 120000 ),
	( ''Philip Schlump'',      62, ''WY'', 101200 ),
	( ''Liz Trubune'',         30, ''WY'', 48000 ),
	( ''Lary Smith'',          58, ''NJ'', 48000 ),
	( ''Dave Dave'',           21, ''NJ'', 48000 ),
	( ''Laura Ann Alkinoos'',  34, ''PA'', 48000 )
;

```


Now a materialize view that rolls up the count of the number of names in each state.

```
DROP materialized view count_by_state_of_names ;

CREATE materialized view count_by_state_of_names as
	SELECT count(1) as count_by_state,
		state
	FROM name_list
	GROUP BY state
;
CREATE INDEX count_by_state_of_names_p1 on count_by_state_of_names ( count_by_state );
CREATE INDEX count_by_state_of_names_p2 on count_by_state_of_names ( state );

```

To refresh a materialized view you use (you need to do a refresh to populate the view for the first time also):

```
REFRESH MATERIALIZED VIEW count_by_state_of_names;

```

Now let''s select the data:

```

SELECT * from count_by_state_of_names ;

```

You should get back 3 rows.



#### Validate: "CountRows","{%22Nr%22%3A[3]}"

#### FilesToRun: hw39_0.sql
#### FilesToRun: hw39_2.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '03bac29f-7924-412a-97c9-fe17ac3e4f8a', 'Interactive - 40 - refresh materialized view', '
Last time we created a materialized view, `count_by_state_of_names`.

This time let''s refresh it with new data.

```
REFRESH MATERIALIZED VIEW count_by_state_of_names;

```

Materialized views don''t change when the underlying data changes.
You have to refresh them.



#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '92235852-ea73-4f08-906d-fb33e4a4be0b', 'Interactive - 41 - case/when - if in projected columns', '
You can change the return values in the projected columns.

For example if you want to map certain values to new values in a query.
An example with the name_list table is to create a new column that is
an in-Wyoming column.


```
SELECT
		  t1.real_name
		, t1.state
		, case
			when t1.state = ''WY'' then ''y''
			when t1.state is null then ''n''
			else ''n''
		  end as "in_wyoming"
	FROM name_list as t1
;

```



#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'e96b5381-43e5-4f54-9e26-b3682be20663', 'Interactive - 42 - foreign data wrapper', '
PostgreSQL can access data outside of the database.  This is called a foreign data wrapper (FDW).   There are all sorts of foreign data
wrappers.  You can access data in other databases like Oracle or MySQL.  You can access
data in NoSQL databases like MongoDB.     For a full list (of over 30 different kinds of data you can access)
[https://wiki.postgresql.org/wiki/Foreign_data_wrappers](https://wiki.postgresql.org/wiki/Foreign_data_wrappers) .

Also you can use files like comma separated value (CSV) files through the FDW.  There is a file_fdw data wrapper!

To set this up you need to create the extension in PostgreSQL.

```
CREATE EXTENSION if not exists file_fdw;
CREATE SERVER import FOREIGN DATA WRAPPER file_fdw;

```

Then we can use data on the PostgreSQL server and access it.   There is a file with data on our server at `/home/uw4820/hw42_data.csv`.


The data in the file is:
```
abc,def
ghi,jkl
abc,jkl

```

We can create a table that matches with this and imports the data.

```
DROP FOREIGN TABLE if exits table1_import ;

CREATE FOREIGN TABLE table1_import (
	col1 text,
	col2 text
) SERVER import OPTIONS ( filename ''/home/uw4820/hw42_03.csv'', format ''csv'' );

```

Now we can use standard selects to access the data.

```

SELECT * from table1_import;

SELECT * from table1_import where col1 = ''abc'';


```

The limitation on the selects and the table is that it will do a full table scan (slow)
each time you access the data.  If you want to create indexes on it you need to use
a materialized view or create a new table with the data in it.  Then create indexes
and other data objects based on that table.

You can use FDW to access other PostgreSQL databases and other databases in different
machines.

Another way to access a different database is to use `dblink` in a query.  This is
more efficient, but can only be used to access database in the same running instance
of PotreSQL.

This is an example of using `dblink` - you don''t need to run it.  It is just an example.

```
SELECT *
FROM   table1 as t1
LEFT   JOIN (
   SELECT *
   FROM dblink(''dbname=database2'',''SELECT t3.id, t3.code FROM table2 as t3'') AS t2(id int, code text)
) AS t4 ON t4.column = t1.column
;
```














#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '7e4b9b48-526e-49c3-b5f5-a1a375a07d1b', 'Interactive - 43 - indexes on functions - soundex', '
You can create indexes on the output of functions then use this
to quickly lookup a row that matches.  An example of this is
soundex - a fuzzy match for a name that is based on a phonetic
lookup.

Note: If you need to have an effective name lookup there are
better functions for this - search for `fuzzy-match  postgresql`
and there is a built in library - but the other fuzzy match
functions are much more complex.

Another example would be an upper or lower case function
applied to a text field.

This example is the how-to build an index using a function.
So...

The function is...


```
CREATE OR REPLACE FUNCTION soundex(input text) RETURNS text
IMMUTABLE STRICT COST 500 LANGUAGE plpgsql
AS $$
DECLARE
	soundex text = '''';
	char text;
	symbol text;
	last_symbol text = '''';
	pos int = 1;
BEGIN
	WHILE length(soundex) < 4 LOOP
		char = upper(substr(input, pos, 1));
		pos = pos + 1;
		CASE char
		WHEN '''' THEN
			-- End of input string
			IF soundex = '''' THEN
				RETURN '''';
			ELSE
				RETURN rpad(soundex, 4, ''0'');
			END IF;
		WHEN ''B'', ''F'', ''P'', ''V'' THEN
			symbol = ''1'';
		WHEN ''C'', ''G'', ''J'', ''K'', ''Q'', ''S'', ''X'', ''Z'' THEN
			symbol = ''2'';
		WHEN ''D'', ''T'' THEN
			symbol = ''3'';
		WHEN ''L'' THEN
			symbol = ''4'';
		WHEN ''M'', ''N'' THEN
			symbol = ''5'';
		WHEN ''R'' THEN
			symbol = ''6'';
		ELSE
			-- Not a consonant; no output, but next similar consonant will be re-recorded
			symbol = '''';
		END CASE;

		IF soundex = '''' THEN
			-- First character; only accept strictly English ASCII characters
			IF char ~>=~ ''A'' AND char ~<=~ ''Z'' THEN
				soundex = char;
				last_symbol = symbol;
			END IF;
		ELSIF last_symbol != symbol THEN
			soundex = soundex || symbol;
			last_symbol = symbol;
		END IF;
	END LOOP;

	RETURN soundex;
END;
$$;
```

You should already have the function loaded.  This function should be setup as part of your account
so you should not need to run it.  The file if it is not there is hw43_1.sql.

To create the index:

```
CREATE INDEX name_list_func_soundex ON name_list (soundex(real_name));

```

Then to query on this field:


```
SELECT *
	FROM name_list
	WHERE soundex(real_name) = soundex(''philip schlump'')
;

```

This will use the output from the function to do the query.  This makes for a fast lookup.



#### FilesToRun: hw43_1.sql

#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'c507773f-c6b6-40c7-8333-6d474edca192', 'Interactive - 44 - alter table to add columns, remove columns', '
You can alter tables to add or remove columns or to rename columns.

```
DROP TABLE if exists name_list2 ;
CREATE TABLE name_list2 (
	name_list_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	real_name text check ( length(real_name) >= 1 ) not null,
	age int check ( age > 0 and age < 154 ) not  null,
	state char varying (2) not null,
	pay numeric(10,2)
);

```

Suppose that you decide that you really need the state name and a state_2letter_code as the columns.

```
ALTER TABLE name_list2 rename column state to state_2letter_code;
ALTER TABLE name_list2 add column state varchar(50);

```




#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '4887855c-ae9b-4c5b-95e6-bba07644cf0d', 'Interactive - 45 - alter table to add columns, remove columns', '
Using the same table, name_list2 lets add a constraint to the us_state table.


```
ALTER TABLE name_list2
	ADD column state_nick_name text
;

```





#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '50661c36-6c57-4ffd-ab5d-d326efa9bc9e', 'Interactive - 46 -  NULL - differences between databases', '
By now you have noticed that if a column allows you can have NULL values in it.
This is a non-data value.

The handling of NULL differers just enough between different databases to make
code non-portable from database to database (At least it requires a lot of
effort to port).

First thing to no about NULL is that NULL data is not indexed.  So if you go
looking for NULL it will result in a full table scan.

Also NULL is not equal to anything.  There is a special pair of operators, `IS NULL` and `IS NOT NULL`
for checking if a column or value is null.

```
SELECT ''found'' where NULL = NULL;

```

will return 0 rows because NULL is not equal to anything, even itself.

```
SELECT ''found'' where NULL is NULL;

```

PostgreSQL provides 2 functions for dealing with nulls.  The first is `nullif`.

If the 2 arguments are equal then NULL is returned.

```
SELECT nullif(1,1);

SELECT nullif(1,2);

```

If the 2 arguments are NOT equal then the first argument is returned.


```
SELECT nullif(1,2);

```

The second function is `coalesce`.
This function substitutes a default value when the first argument is NULL.

```
SELECT coalesce(NULL,2);

```

If the first argument is NULL then the defalut, in this case 2, is returned.

If the first argument is not NULL then the non-null first argument is returned.


```
SELECT coalesce(5,2);

```



Note: In the Oracle database you use the ''nvl'' function and a special table with 1 row in it called ''dual'';




#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( 'faa8df83-bfdc-4916-a7b4-7b637a5fae5e', 'Interactive - 47 - NoSQL databases ( mongoDB ) v.s. JSONb in PostreSQL', '
One of the most common alternatives to a SQL database is MongoDB.
Front end developers like MongoDB because everting is in JSON.

There are two reasons why I don''t use MongoDB.

1. Concurrency control is incredibly important.  Google reviewed
its code base and counted the number of defects related to bad
implementations of custom concurrency control.   The problems
were bad enough that Google banned the use of MongoDB.
2. Everything that can be done in MogoDB can be done just as
fast using JSONb data in PostgreSQL.  Also with PostgreSQL
you get a complete relational database with tables and
indexes and spacial data and...   That other stuff just
get thrown in.

So... Let''s look at how to use JSONb in PostgreSQL.

First let''s create a table.  This is the same as creating a "collection"
in MongoDB.  The table will use a GIN index to index all of the
data in the JSON data.  (Run file `hw47_1.sql`)

```
drop TABLE if exists test_collection ;

CREATE TABLE test_collection (
	id serial primary key not null,
	data JSONB
);

CREATE INDEX test_collection_gin_1 ON test_collection USING gin (data);

INSERT INTO test_collection ( data ) values
	( ''{"name":"bob"}'' )
;

```

PostgreSQL has a slew of operators.



| Operator | Right Operand Type | Description                                                                                        | Example                                             | Example Result  |
|:--------:|--------------------|----------------------------------------------------------------------------------------------------|-----------------------------------------------------|-----------------|
| `->`     | int                | Get JSON array element (indexed from zero, negative integers count from the end)                   | `''[{"a":"foo"},{"b":"bar"},{"c":"baz"}]''::json->2`  | `{"c":"baz"}`   |
| `->`     | text               | Get JSON object field by key                                                                       | `''{"a": {"b":"foo"}}''::json->''a''`                   | `{"b":"foo"}`   |
| `->>`    | int                | Get JSON array element as text                                                                     | `''[1,2,3]''::json->>2`                               | `3`             |
| `->>`    | text               | Get JSON object field as text                                                                      | `''{"a":1,"b":2}''::json->>''b''`                       | `2`             |
| `#>`     | text[]             | Get JSON object at specified path                                                                  | `''{"a": {"b":{"c": "foo"}}}''::json#>''{a,b}''`        | `{"c": "foo"}`  |
| `#>>`    | text[]             | Get JSON object at specified path as text                                                          | `''{"a":[1,2,3],"b":[4,5,6]}''::json#>>''{a,2}''`       | `3`             |
| `@>`     | JSONb              | Does the left JSON value contain the right JSON path/value entries at the top level?               | `''{"a":1, "b":2}''::JSONb @> ''{"b":2}''::JSONb`       |                 |
| `<@`     | JSONb              | Are the left JSON path/value entries contained at the top level within the right JSON value?       | `''{"b":2}''::JSONb <@ ''{"a":1, "b":2}''::JSONb`       |                 |
| `?`      | text               | Does the string exist as a top-level key within the JSON value?                                    | `''{"a":1, "b":2}''::JSONb ? ''b''`                     |                 |
| `?xxVb()``     | text[]             | Do any of these array strings exist as top-level keys?                                             | `''{"a":1, "b":2, "c":3}''::JSONb ?xxVb() array[''b'', ''c'']` |                 |
| `?&`     | text[]             | Do all of these array strings exist as top-level keys?                                             | `''["a", "b"]''::JSONb ?& array[''a'', ''b'']`            |                 |
| `xxVb()xxVb()`     | JSONb              | Concatenate two JSONb values into a new JSONb value                                                | `''["a", "b"]''::JSONb xxVb()xxVb() ''["c", "d"]''::JSONb`        |                 |
| `-`      | text               | Delete key/value pair or string element from left operand. Key/value pairs are matched based on their key value. | `''{"a": "b"}''::JSONb - ''a''`           |                 |
| `-`      | integer            | Delete the array element with specified index (Negative integers count from the end). Throws an error if top level container is not an array. | `''["a", "b"]''::JSONb - 1` |    |
| `#-`     | text[]             | Delete the field or element with specified path (for JSON arrays, negative integers count from the end) | `''["a", {"b":1}]''::JSONb #- ''{1,b}''`           |                 |


For example:

```
SELECT *
	FROM test_collection
	WHERE data->>''name'' = ''bob''
;

```

Should return 1 row the name equal to `bob`.



#### Validate: SQL-Select,"select ''PASS'' as x"

#### FilesToRun: hw47_1.sql
' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '4cb70d87-dfcc-4b8d-a5cc-53dd7e840c42', 'Interactive - 48 - window functions', '
Window functions allow operations of a set of data.  First let''s setup an example.


```

DROP TABLE if exists emp_sal;

CREATE TABLE emp_sal (
	emp_id serial primary key not null,
	dept text not null,
	salary numeric
);

INSERT INTO emp_sal ( dept, emp_id, salary ) values
	( ''Dev''   	,    11 ,   5200 ),
	( ''Dev''   	,     7 ,   4200 ),
	( ''Dev''   	,     9 ,   4500 ),
	( ''Dev''   	,     8 ,   6000 ),
	( ''Dev''   	,    10 ,   5200 ),
	( ''H.R.'' 	,     5 ,   3500 ),
	( ''H.R.'' 	,     2 ,   3900 ),
	( ''sales''   ,     3 ,   4800 ),
	( ''sales''   ,     1 ,   5000 ),
	( ''sales''   ,     4 ,   4800 )
;


```

A window function can be used to calculate the sum of salary across each department.
This start with the `OVER` operator and a expression of how the data is to be grouped.


```
SELECT
		dept,
		emp_id,
		salary,
		sum(salary) OVER (PARTITION BY dept)  as  dept_total
	FROM emp_sal
;


```




#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '578e2524-38ba-49c3-a464-9999528778d5', 'Interactive - 49 - PostgreSQL database maintenance', '
When a table has a substantial change in size the set of statistics
that are used to create and optimize queries needs to be updated.
This is done with the `vacuum` command.

Also when deletes occur the data is marked as deleted but the space
is not reclaimed.   To reclaim the space you need to run a `vacuum`
on the table or on all tables.   Because this can be a very time
consuming process this is often set up to run at an off-peek time.

```
vacuum full;
vacuum analyze name_list;

```




#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_title ( id, title, body ) VALUES ( '0675c5cb-11d4-433d-a5a3-30be9de8b60d', 'Interactive - 50 - Geometric Data / PostGIS', '
PostgreSQL also has a substantial set of constructs that allow both indexing and data storage of points.
Collectively these base capabilities are built into a very good Geographic Information System, PostGIS.

PostGIS adds all sorts of fun stuff like projections and data for all the counties in the US.

Before using PostGIS you need to understand the basics - like points and lines and that PostgreSQL
can store and search spacial data.


```

xyzzy


```




#### Validate: SQL-Select,"select ''PASS'' as x"

' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'fedd98aa-88e0-4e57-8606-a3c4872f1178', 'create table' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', 'fedd98aa-88e0-4e57-8606-a3c4872f1178' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'ade7ac1b-f32c-4653-b966-eeb5b68e316b', 'type text' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', 'ade7ac1b-f32c-4653-b966-eeb5b68e316b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'dec2a4de-8deb-4271-ac27-4edddbad50fe', 'type int' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', 'dec2a4de-8deb-4271-ac27-4edddbad50fe' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2095e0a7-2ab0-4219-a17a-c09ffdd7bb51', 'type varchar' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', '2095e0a7-2ab0-4219-a17a-c09ffdd7bb51' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9f4a6012-5fb8-47d9-b4a5-265f569515a5', 'hw01' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'cb5b3542-6b43-40d3-b1ca-fbd324c332e2', '9f4a6012-5fb8-47d9-b4a5-265f569515a5' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '045c07a9-02e7-4188-b5d5-c11e7e742a29', 'hw02' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '12f4a214-bf5c-4a75-9b96-6d1723d5d66c', '045c07a9-02e7-4188-b5d5-c11e7e742a29' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'daee9ef8-afba-4a99-9468-173784bae5f2', 'insert' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '12f4a214-bf5c-4a75-9b96-6d1723d5d66c', 'daee9ef8-afba-4a99-9468-173784bae5f2' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', 'daee9ef8-afba-4a99-9468-173784bae5f2' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '8ac8edda-a6dc-43c0-92d3-49fb248c2694', 'elec' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '37fdc806-a5f4-4e25-991d-b64bcc6e4677', '8ac8edda-a6dc-43c0-92d3-49fb248c2694' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e467b4da-e05b-4b0f-b97c-93e0726f03cf', '8ac8edda-a6dc-43c0-92d3-49fb248c2694' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '3b994168-7d7b-4a39-8e85-801706490c65', 'her' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '37fdc806-a5f4-4e25-991d-b64bcc6e4677', '3b994168-7d7b-4a39-8e85-801706490c65' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '6d9a68d5-1785-42bd-8d6b-aab690d33953', '3b994168-7d7b-4a39-8e85-801706490c65' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '59cea73d-8e45-4914-ad92-4ca32410ede1', 'pdat' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '6d9a68d5-1785-42bd-8d6b-aab690d33953', '59cea73d-8e45-4914-ad92-4ca32410ede1' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'a26c1257-08d5-4966-bfa7-2869c99ae327', 'nser' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e467b4da-e05b-4b0f-b97c-93e0726f03cf', 'a26c1257-08d5-4966-bfa7-2869c99ae327' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '44fad70a-07fc-4916-a40d-169b5717609c', 'istinc' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e467b4da-e05b-4b0f-b97c-93e0726f03cf', '44fad70a-07fc-4916-a40d-169b5717609c' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0a9536f7-c4e7-4c3e-9b9d-60acb1ad5307', '44fad70a-07fc-4916-a40d-169b5717609c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'd9b471de-09fa-4e54-9709-5fa8c94c19a7', 'elect distinc' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e467b4da-e05b-4b0f-b97c-93e0726f03cf', 'd9b471de-09fa-4e54-9709-5fa8c94c19a7' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '8f64aab2-09b5-4a79-842a-3ec9b0f7717b', 'oun' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0a9536f7-c4e7-4c3e-9b9d-60acb1ad5307', '8f64aab2-09b5-4a79-842a-3ec9b0f7717b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'eaf3fa77-1aa9-4e0e-8210-9d4457133c42', 'count distinct' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0a9536f7-c4e7-4c3e-9b9d-60acb1ad5307', 'eaf3fa77-1aa9-4e0e-8210-9d4457133c42' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '7ad5860e-f126-4f2d-a0a9-5715b06e628c', 'alter table rename' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', '7ad5860e-f126-4f2d-a0a9-5715b06e628c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'eb85d1e7-f4ea-4c9b-ad9b-e2fba58e8df3', 'rename' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', 'eb85d1e7-f4ea-4c9b-ad9b-e2fba58e8df3' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2e0cd343-ba8a-484e-9cb8-6b09ab877bb7', 'drop table' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', '2e0cd343-ba8a-484e-9cb8-6b09ab877bb7' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'b5f6a9a8-4cab-4ba5-a84c-9dede947d6bc', 'insert select' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9df546e9-7d7e-4b9f-9acc-b85ff6b14504', 'b5f6a9a8-4cab-4ba5-a84c-9dede947d6bc' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '8fe72378-7351-4ebf-87a5-bb89874d7011', 'primary key' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4aa22fc3-cae8-459c-86cb-b231a6ebe970', '8fe72378-7351-4ebf-87a5-bb89874d7011' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'cf203d15-ce89-422e-9910-d231d22fe193', 'uuid' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4aa22fc3-cae8-459c-86cb-b231a6ebe970', 'cf203d15-ce89-422e-9910-d231d22fe193' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'b8678b23-8c55-4dd8-a070-6eec068a1aa1', 'unique id' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4aa22fc3-cae8-459c-86cb-b231a6ebe970', 'b8678b23-8c55-4dd8-a070-6eec068a1aa1' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '686011e6-6f03-4ba6-aced-d222444152ca', 'UUID' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4aa22fc3-cae8-459c-86cb-b231a6ebe970', '686011e6-6f03-4ba6-aced-d222444152ca' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '06052755-c39d-4268-84cc-4f2464d97203', 'foreign key' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f71c4c71-46f7-47b7-99a8-65d1231991e3', '06052755-c39d-4268-84cc-4f2464d97203' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'ec879802-531c-4c07-8197-b05d4b206d7b', 'alter table' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f71c4c71-46f7-47b7-99a8-65d1231991e3', 'ec879802-531c-4c07-8197-b05d4b206d7b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1441c018-697d-40e8-8a1a-7c094b05cf91', 'add constraint' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f71c4c71-46f7-47b7-99a8-65d1231991e3', '1441c018-697d-40e8-8a1a-7c094b05cf91' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9104e53b-5de7-4aa9-b450-c9d329000e6f', 'create index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '24673f02-5e9f-4853-85d2-75551caaacea', '9104e53b-5de7-4aa9-b450-c9d329000e6f' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'bdbb6bed-5e42-4a22-97bf-c72011889bb9', '9104e53b-5de7-4aa9-b450-c9d329000e6f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '5abbaf87-9bbc-4c1b-a924-d3900135b053', 'nde' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'bdbb6bed-5e42-4a22-97bf-c72011889bb9', '5abbaf87-9bbc-4c1b-a924-d3900135b053' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '3500756c-1884-45b3-847f-63e028fda202', 'lower' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'bdbb6bed-5e42-4a22-97bf-c72011889bb9', '3500756c-1884-45b3-847f-63e028fda202' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'b291bca0-7e46-4bc9-a207-e82a1cd467d6', 'duplicate data' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', 'b291bca0-7e46-4bc9-a207-e82a1cd467d6' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'cf8a2ec4-7918-4167-bc03-078525b43a24', 'delete' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', 'cf8a2ec4-7918-4167-bc03-078525b43a24' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '02832d81-b53c-4089-9a79-0e6191900024', 'type cast' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', '02832d81-b53c-4089-9a79-0e6191900024' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9ceeff4d-cde2-4b00-8d31-5f82f4d6e45a', 'min' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', '9ceeff4d-cde2-4b00-8d31-5f82f4d6e45a' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', '9ceeff4d-cde2-4b00-8d31-5f82f4d6e45a' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '666ececa-7889-4c16-ac3a-dac02ed65737', 'not in' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a002c898-a82f-4b05-aec4-68b8732c9391', '666ececa-7889-4c16-ac3a-dac02ed65737' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c26a631a-ff5e-4237-b707-9cca58872790', 'reload data' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3a980a42-6c6b-491c-b5ab-6f0badf61426', 'c26a631a-ff5e-4237-b707-9cca58872790' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '6f229e70-485e-4ad4-9a78-bf58a2a6f0f5', 'drop cascade' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3a980a42-6c6b-491c-b5ab-6f0badf61426', '6f229e70-485e-4ad4-9a78-bf58a2a6f0f5' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3b175dee-87b0-4e1f-8300-8d679ca37927', '6f229e70-485e-4ad4-9a78-bf58a2a6f0f5' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'd31f237d-b445-4a35-9dae-983152aa184c', 'data types' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'add40e12-c881-434e-a172-e2675b08572c', 'd31f237d-b445-4a35-9dae-983152aa184c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c3e75f3f-7fe9-43f0-b302-0e4000e2cc18', 'max' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', 'c3e75f3f-7fe9-43f0-b302-0e4000e2cc18' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '68469367-e1dc-40f4-8b40-726f7fc116c4', 'avg' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', '68469367-e1dc-40f4-8b40-726f7fc116c4' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '16e9bfe6-8740-477e-94aa-46065b2dba90', '68469367-e1dc-40f4-8b40-726f7fc116c4' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'd4e76e15-f398-41af-8e6e-1f6ec0598e36', 'group by' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', 'd4e76e15-f398-41af-8e6e-1f6ec0598e36' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '16e9bfe6-8740-477e-94aa-46065b2dba90', 'd4e76e15-f398-41af-8e6e-1f6ec0598e36' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'cf72b315-a39d-4c8c-8e44-0d9333a44024', 'order by' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', 'cf72b315-a39d-4c8c-8e44-0d9333a44024' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '16e9bfe6-8740-477e-94aa-46065b2dba90', 'cf72b315-a39d-4c8c-8e44-0d9333a44024' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'a21b28c9-b506-43d2-a942-163913666de7', 'nested query' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', 'a21b28c9-b506-43d2-a942-163913666de7' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '400b87c0-65df-4c77-b735-9e80fd01ae87', 'sub query' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0ed40bf2-c571-4fde-a21b-b0c9cd5dae94', '400b87c0-65df-4c77-b735-9e80fd01ae87' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '013c4601-2845-4328-a90f-5c16b0982bac', 'inner join' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4bb34a81-fce8-4efe-a97d-54367730be6f', '013c4601-2845-4328-a90f-5c16b0982bac' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c0f364c2-8999-4a78-88d0-4d0fd1fabbfc', 'outer join' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4bb34a81-fce8-4efe-a97d-54367730be6f', 'c0f364c2-8999-4a78-88d0-4d0fd1fabbfc' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1ca06ed4-77a2-416b-bdd2-1d0304983cf1', 'left outer join' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4bb34a81-fce8-4efe-a97d-54367730be6f', '1ca06ed4-77a2-416b-bdd2-1d0304983cf1' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1f7579a0-56ab-45c8-ba5a-19aa90ffe920', 'full join' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a7c7e427-149d-49d9-bbbe-08a485775659', '1f7579a0-56ab-45c8-ba5a-19aa90ffe920' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'cfee0f05-3d72-4ab1-941b-9d9b5a2ba902', 'full outer join' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a7c7e427-149d-49d9-bbbe-08a485775659', 'cfee0f05-3d72-4ab1-941b-9d9b5a2ba902' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '38e0ccfe-7565-49aa-a956-0e649f6c30a0', 'select exists' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'c8d2f555-dd5e-4c46-802e-c7f9015f92f2', '38e0ccfe-7565-49aa-a956-0e649f6c30a0' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '76c51d6a-ff32-4fb6-b43c-96109753f1dd', 'sub-query' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'c8d2f555-dd5e-4c46-802e-c7f9015f92f2', '76c51d6a-ff32-4fb6-b43c-96109753f1dd' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'fe780a7c-ccce-4b6b-8dd6-45ba8eeb4988', '76c51d6a-ff32-4fb6-b43c-96109753f1dd' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '29dbf75b-996f-46d8-ba2d-fd463ae65b6f', 'delete exists' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'fe780a7c-ccce-4b6b-8dd6-45ba8eeb4988', '29dbf75b-996f-46d8-ba2d-fd463ae65b6f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '583d2fd2-46df-4005-8a3e-482154feb9a8', 'union' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '135d22db-31f2-415f-81be-fb35ed656492', '583d2fd2-46df-4005-8a3e-482154feb9a8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '008afb25-03cf-4e44-9201-bbe310d3120d', 'recursive select' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '7ca6decd-a2d5-4fb4-b877-d027118b9579', '008afb25-03cf-4e44-9201-bbe310d3120d' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '3e44b213-2cad-4548-ba0f-dfef7d6ef867', 'ecursiv' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '7ca6decd-a2d5-4fb4-b877-d027118b9579', '3e44b213-2cad-4548-ba0f-dfef7d6ef867' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'abebdaa3-e01b-4e9c-a20f-2df71a4239a5', 'with' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '2d6284fc-96ff-4b30-b976-e9b91ded9bb5', 'abebdaa3-e01b-4e9c-a20f-2df71a4239a5' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'ef22508c-0bb6-44d2-a9ab-92878ac79117', 'with select' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '2d6284fc-96ff-4b30-b976-e9b91ded9bb5', 'ef22508c-0bb6-44d2-a9ab-92878ac79117' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '7f193c5e-3d6d-4ddb-991d-f2521239c8e6', 'truncate' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '18487b2d-3c71-4549-ba44-c2c905d0f8ca', '7f193c5e-3d6d-4ddb-991d-f2521239c8e6' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2e3c25ac-b456-4a63-a76d-b713c62140a8', 'fast delete' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '18487b2d-3c71-4549-ba44-c2c905d0f8ca', '2e3c25ac-b456-4a63-a76d-b713c62140a8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '21336ede-d892-40a7-8032-6e45b5c53e64', 'delete all rows' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '18487b2d-3c71-4549-ba44-c2c905d0f8ca', '21336ede-d892-40a7-8032-6e45b5c53e64' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '06a8f1be-e53c-400a-b3b3-d6dd51363426', 'drop' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3b175dee-87b0-4e1f-8300-8d679ca37927', '06a8f1be-e53c-400a-b3b3-d6dd51363426' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'a7c43c53-c3c3-44c0-b58e-d2b96785c5b4', 'setup' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', 'a7c43c53-c3c3-44c0-b58e-d2b96785c5b4' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'faac137a-2e4c-46ca-8fc9-4a45c0e5506b', 'ct_homework' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', 'faac137a-2e4c-46ca-8fc9-4a45c0e5506b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '658467fc-dfbb-48eb-adfc-6c3e91623505', 'ct_homework_ans' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', '658467fc-dfbb-48eb-adfc-6c3e91623505' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2a9bf8f2-fe79-4621-b347-7060fbe1c8ef', 'ct_tag' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', '2a9bf8f2-fe79-4621-b347-7060fbe1c8ef' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9989240b-1b54-46eb-b72b-f728fc034067', 'ct_tag_homework' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', '9989240b-1b54-46eb-b72b-f728fc034067' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c5b5a3d5-82d6-4099-9523-27c2cdf693b0', 't_ymux_user' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', 'c5b5a3d5-82d6-4099-9523-27c2cdf693b0' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9fa2a63d-5988-46f5-b401-6b0151174b61', 't_ymux_user_log' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', '9fa2a63d-5988-46f5-b401-6b0151174b61' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '03c4d746-673e-4fb2-87e2-d5184dce9062', 't_ymux_auth_token' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'abbfea87-825f-489d-818f-af19723e53cd', '03c4d746-673e-4fb2-87e2-d5184dce9062' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '951d67f2-fc47-4544-9294-0d0ea081678b', ':' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'ec699882-15b9-4837-9177-d84622d86703', '951d67f2-fc47-4544-9294-0d0ea081678b' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '10111b8b-27fc-449b-b8bd-b1bfd7ff466e', '951d67f2-fc47-4544-9294-0d0ea081678b' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '75e50b4e-6e08-4b4f-a0c7-c887ce865874', '951d67f2-fc47-4544-9294-0d0ea081678b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '68689186-aa0b-4da4-bcea-7132c32b303c', '1 to 0' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'ec699882-15b9-4837-9177-d84622d86703', '68689186-aa0b-4da4-bcea-7132c32b303c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '29fdf534-4d3d-4473-b25c-50d88ac81b24', '1:0 relationship' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'ec699882-15b9-4837-9177-d84622d86703', '29fdf534-4d3d-4473-b25c-50d88ac81b24' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'df6121de-5394-4808-b3c6-fb832912d885', '1:1' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'ec699882-15b9-4837-9177-d84622d86703', 'df6121de-5394-4808-b3c6-fb832912d885' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'f54f844d-9c8b-46fb-9cf7-e9e1eb491358', '1:n relationship' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '10111b8b-27fc-449b-b8bd-b1bfd7ff466e', 'f54f844d-9c8b-46fb-9cf7-e9e1eb491358' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'f90b1d43-ed52-49d9-bd64-b7e796d78a4c', 'm to n' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '75e50b4e-6e08-4b4f-a0c7-c887ce865874', 'f90b1d43-ed52-49d9-bd64-b7e796d78a4c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'dcc16462-87fb-4ee4-9f93-1b91c26dae2c', 'm:n' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '75e50b4e-6e08-4b4f-a0c7-c887ce865874', 'dcc16462-87fb-4ee4-9f93-1b91c26dae2c' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1b744ebd-8b90-4f4a-a9c8-7b3028747933', 'm:n relationship' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '75e50b4e-6e08-4b4f-a0c7-c887ce865874', '1b744ebd-8b90-4f4a-a9c8-7b3028747933' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '749f2f19-c7e7-4113-8af8-a2d934215b97', '1 to list' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'd4c5cf4d-0347-44d7-8281-71c8ccbe41a2', '749f2f19-c7e7-4113-8af8-a2d934215b97' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '5f4438f3-dbcf-4e7d-b8d2-ae46764c3947', 'list of rows' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'd4c5cf4d-0347-44d7-8281-71c8ccbe41a2', '5f4438f3-dbcf-4e7d-b8d2-ae46764c3947' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1fcb25b3-2e41-4ee5-b424-d541e9aa88b6', 'single row' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f93250da-d45c-42da-9502-704d06299859', '1fcb25b3-2e41-4ee5-b424-d541e9aa88b6' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1dffa046-cbad-4308-9964-598bb4a6ec5d', 'raise exception' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f93250da-d45c-42da-9502-704d06299859', '1dffa046-cbad-4308-9964-598bb4a6ec5d' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '0e48f662-a1a3-4ac9-87de-815466ec1401', 'trigger' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f93250da-d45c-42da-9502-704d06299859', '0e48f662-a1a3-4ac9-87de-815466ec1401' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a0cf0443-7164-4ee6-a7ec-dda0bb790fe5', '0e48f662-a1a3-4ac9-87de-815466ec1401' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '76fdee1b-3fd5-4ba1-9adb-cf9f884933f8', 'delete trigger' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'f93250da-d45c-42da-9502-704d06299859', '76fdee1b-3fd5-4ba1-9adb-cf9f884933f8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '58a52f05-5394-4d84-9fa6-3bc1783fd62e', 'fixed set rows' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a0cf0443-7164-4ee6-a7ec-dda0bb790fe5', '58a52f05-5394-4d84-9fa6-3bc1783fd62e' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'e85d349a-6597-45bb-a3c4-d311cc3ddcc0', 'check constraint' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'a0cf0443-7164-4ee6-a7ec-dda0bb790fe5', 'e85d349a-6597-45bb-a3c4-d311cc3ddcc0' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '7d3cce02-f9df-4168-960f-c8da10d3d80b', 'index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '8a6b1703-8b5d-4c29-b0c9-564f7e8b99fa', '7d3cce02-f9df-4168-960f-c8da10d3d80b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'b4406c5d-4d2f-408f-abbf-1309ff44ebcf', 'gin index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '8a6b1703-8b5d-4c29-b0c9-564f7e8b99fa', 'b4406c5d-4d2f-408f-abbf-1309ff44ebcf' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '08195b5d-57b2-454d-b29c-5b80797c7ac8', 'hash index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '8a6b1703-8b5d-4c29-b0c9-564f7e8b99fa', '08195b5d-57b2-454d-b29c-5b80797c7ac8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'a374c251-39e6-4097-9f25-86d231867daa', 'ie' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9307402a-d420-465a-8581-853c02a3a3bd', 'a374c251-39e6-4097-9f25-86d231867daa' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '9b97a694-7159-474a-9b23-a1f13ad384c8', 'unused index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '9307402a-d420-465a-8581-853c02a3a3bd', '9b97a694-7159-474a-9b23-a1f13ad384c8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '86b16245-b561-4532-acd6-2d926cb60e58', 'function' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '06a43509-cc12-4b15-8db5-064c7269f12d', '86b16245-b561-4532-acd6-2d926cb60e58' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'af2315a6-ba66-42df-a25d-7b33eda8bb64', 'stored procedure' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '06a43509-cc12-4b15-8db5-064c7269f12d', 'af2315a6-ba66-42df-a25d-7b33eda8bb64' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2fe6eae9-4a04-4742-9730-21ce9d9c3a75', 'transaction' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '06a43509-cc12-4b15-8db5-064c7269f12d', '2fe6eae9-4a04-4742-9730-21ce9d9c3a75' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'df5c2700-2f32-4ba1-936e-e61c262ea28f', 'password' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e4d7da0b-2361-45fb-93b9-1fb3c41f31da', 'df5c2700-2f32-4ba1-936e-e61c262ea28f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '78e02697-31eb-4b3f-923e-43c0de8f0756', 'hash password' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e4d7da0b-2361-45fb-93b9-1fb3c41f31da', '78e02697-31eb-4b3f-923e-43c0de8f0756' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '5c5c9fd4-7b8d-44db-876a-3774caa9448d', 'encrypted' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e4d7da0b-2361-45fb-93b9-1fb3c41f31da', '5c5c9fd4-7b8d-44db-876a-3774caa9448d' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c986eeb9-8895-4c14-a292-99a432106770', 'reverse key index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3d2029dc-d986-45ad-a382-ade88f148fe6', 'c986eeb9-8895-4c14-a292-99a432106770' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '50ab11c6-56eb-4d60-8578-4010d9e76a85', 'like' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3d2029dc-d986-45ad-a382-ade88f148fe6', '50ab11c6-56eb-4d60-8578-4010d9e76a85' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1e384758-b7ef-4f2b-922b-09df8f222058', 'keyword' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '3d2029dc-d986-45ad-a382-ade88f148fe6', '1e384758-b7ef-4f2b-922b-09df8f222058' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '00597665-e880-4e39-911d-04f941b93d6f', 'materialized view' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'd73c126f-479c-4e17-883b-fd324eb824b8', '00597665-e880-4e39-911d-04f941b93d6f' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '03bac29f-7924-412a-97c9-fe17ac3e4f8a', '00597665-e880-4e39-911d-04f941b93d6f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '2ce45d01-fd1c-4857-aaa0-be0aba699aa3', 'when' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '92235852-ea73-4f08-906d-fb33e4a4be0b', '2ce45d01-fd1c-4857-aaa0-be0aba699aa3' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '0deaf2fe-c811-4318-9471-669031c6f519', 'projected data' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '92235852-ea73-4f08-906d-fb33e4a4be0b', '0deaf2fe-c811-4318-9471-669031c6f519' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '8217dff9-f258-4d72-829b-bba0c0527b2b', 'foreign data wrapper' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e96b5381-43e5-4f54-9e26-b3682be20663', '8217dff9-f258-4d72-829b-bba0c0527b2b' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '72896699-8129-4a2e-8050-4ed2a5d10a19', 'csv' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e96b5381-43e5-4f54-9e26-b3682be20663', '72896699-8129-4a2e-8050-4ed2a5d10a19' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '6d13b1db-9efb-44ac-996c-9886d68bdb92', 'fdw' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e96b5381-43e5-4f54-9e26-b3682be20663', '6d13b1db-9efb-44ac-996c-9886d68bdb92' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'c06f6c82-6fbc-4100-a66d-e1615ac5640f', 'import data' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'e96b5381-43e5-4f54-9e26-b3682be20663', 'c06f6c82-6fbc-4100-a66d-e1615ac5640f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '6b4e0032-a461-474b-8370-568c9da68760', 'fuzzy match' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '7e4b9b48-526e-49c3-b5f5-a1a375a07d1b', '6b4e0032-a461-474b-8370-568c9da68760' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '1866a2b3-bc1b-4a61-ad34-755c6fbf8dbf', 'soundex' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '7e4b9b48-526e-49c3-b5f5-a1a375a07d1b', '1866a2b3-bc1b-4a61-ad34-755c6fbf8dbf' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'e25ef363-9b82-4e65-a7a5-1654dbc16aa2', 'function based index' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '7e4b9b48-526e-49c3-b5f5-a1a375a07d1b', 'e25ef363-9b82-4e65-a7a5-1654dbc16aa2' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '44c67a51-bc99-4f03-b684-01502d48471f', 'alter' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'c507773f-c6b6-40c7-8333-6d474edca192', '44c67a51-bc99-4f03-b684-01502d48471f' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4887855c-ae9b-4c5b-95e6-bba07644cf0d', '44c67a51-bc99-4f03-b684-01502d48471f' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4cb70d87-dfcc-4b8d-a5cc-53dd7e840c42', '44c67a51-bc99-4f03-b684-01502d48471f' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '7ae59280-a344-4251-a368-a90325453bb8', 'add column' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'c507773f-c6b6-40c7-8333-6d474edca192', '7ae59280-a344-4251-a368-a90325453bb8' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4887855c-ae9b-4c5b-95e6-bba07644cf0d', '7ae59280-a344-4251-a368-a90325453bb8' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '4cb70d87-dfcc-4b8d-a5cc-53dd7e840c42', '7ae59280-a344-4251-a368-a90325453bb8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '759933d7-26c5-4ffa-b225-cf9cc4aa62c2', 'NULL' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '50661c36-6c57-4ffd-ab5d-d326efa9bc9e', '759933d7-26c5-4ffa-b225-cf9cc4aa62c2' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '21b71924-0b90-41b7-a780-76251386f7f8', 'JSONb' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'faa8df83-bfdc-4916-a7b4-7b637a5fae5e', '21b71924-0b90-41b7-a780-76251386f7f8' );
INSERT INTO a02_tags ( id, tag ) VALUES ( 'e3e58f3c-7f08-4b99-ad3c-5822b830efc4', 'MongoDB' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( 'faa8df83-bfdc-4916-a7b4-7b637a5fae5e', 'e3e58f3c-7f08-4b99-ad3c-5822b830efc4' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '868360f6-d435-4075-ab0f-e6620fd8be17', 'vacuum' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '578e2524-38ba-49c3-a464-9999528778d5', '868360f6-d435-4075-ab0f-e6620fd8be17' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0675c5cb-11d4-433d-a5a3-30be9de8b60d', '868360f6-d435-4075-ab0f-e6620fd8be17' );
INSERT INTO a02_tags ( id, tag ) VALUES ( '7f1fc210-7f24-4e24-8da1-d37aabcf24be', 'analyze' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '578e2524-38ba-49c3-a464-9999528778d5', '7f1fc210-7f24-4e24-8da1-d37aabcf24be' );
INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '0675c5cb-11d4-433d-a5a3-30be9de8b60d', '7f1fc210-7f24-4e24-8da1-d37aabcf24be' );
