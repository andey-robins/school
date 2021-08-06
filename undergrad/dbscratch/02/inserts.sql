INSERT INTO a02_title (id, title, body) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '# Interactive - 01 - Create Table
', '# Interactive - 01 - Create Table

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




');
INSERT INTO a02_tags (id, tag) VALUES ('490a6201-a858-45db-b301-d5133d70ca89', '"create table"');
INSERT INTO a02_tags (id, tag) VALUES ('5f30bd50-431f-473f-8cbc-b5dc99334ce9', '"type text"');
INSERT INTO a02_tags (id, tag) VALUES ('03b06e7f-8903-4146-8b06-e47ba1dbff83', '"type int"');
INSERT INTO a02_tags (id, tag) VALUES ('1a5c40d3-4161-4c04-8356-1f210eed8766', '"type varchar"');
INSERT INTO a02_tags (id, tag) VALUES ('5468e876-3ef8-49d3-a581-9a32a41f745d', '"hw01"');
INSERT INTO a02_title (id, title, body) VALUES ('c46570ef-4416-4e0a-ac8f-22b064faf53b', '# Interactive - 02 - Insert data into name_list
', '# Interactive - 02 - Insert data into name_list

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
	( "bob true",            22, "WY" ),
	( "Jane True",           20, "WY" ),
	( "Tom Ace",             31, "NJ" ),
	( "Steve Pen",           33, "NJ" ),
	( "Laura Jean Alkinoos", 34, "PA" )
;

```

and a single row (note that the column order
is chained).  It is better to list the columns
so that if the table is changed the data can
still be loaded.  It is possible to add new columns to a table
and break old code - so it is better to have:

```
insert into name_list ( real_name, age, state ) values
	( "bob true",            22, "WY" ),
...
...
...
...
	( "Laura Jean Alkinoos", 34, "PA" )
;
```

Also note that it is intentional at this point that `bob true` is all lower
case.  We will fix that in a little bit.

```

INSERT INTO name_list ( real_name, state, age )
	values	( "Philip Schlump", "WY", 62 );

```

Each set of data that we inset is separated with a comma, `,`.
When we insert text we use single quotes, `"` to mark that it is
text.  To insert a quote mark we put in 2 of them in a row.
So, To insert `that"s`  we would use in our insert statement,
`"that""s``.

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

');
INSERT INTO a02_tags (id, tag) VALUES ('99d58449-feb3-4e91-9572-c341a9f8e755', '"hw02"');
INSERT INTO a02_tags (id, tag) VALUES ('354ba27c-5077-485c-b9e3-e02b35bc4643', '"insert"');
INSERT INTO a02_title (id, title, body) VALUES ('b07ead6e-9cac-4c04-bedd-9cb6db532c3c', '# Interactive - 03 - Select data back from the table
', '# Interactive - 03 - Select data back from the table

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
	WHERE state = "WY"
;

```

Remember that if you want to match a text field you
have to use quotes.  Also it is case sensitive.

```
select real_name
from name_list
where state = "wy"
;
```

will not give you any rows.  Try it.

The query to run before to get your grade is:

```

SELECT real_name
	FROM name_list
	WHERE state = "WY"
;

```

It should return 3 rows.  This is what is checked for by the application.


Book: Chapter 2 - pages 11 to 22.

');
INSERT INTO a02_tags (id, tag) VALUES ('710ad063-59fb-413c-b2ba-3382ca9471c3', 'select');
INSERT INTO a02_tags (id, tag) VALUES ('90372fef-269c-497e-a432-593ad0500262', 'where');
INSERT INTO a02_title (id, title, body) VALUES ('f5d552d5-fd51-4fb4-aac3-cf5df95298d7', '# Interactive - 04 - update the table
', '# Interactive - 04 - update the table

Note that we have an error in our data.  `Bob true` should
be `Bob True`.   Let"s change some data.

```
update <tabe-name>
	set <list of columns to modify>
	where <boolean expresison>
;
```

so... let"s look at the data before the update

```
SELECT * from name_list;

```

Update it to fix it

```
UPDATE name_list
	SET real_name = "Bob True"
	WHERE real_name = "bob true"
;

```

Now let"s look at the data:

```
SELECT * from name_list;

```

Much better!  The query should return 6 rows.  The application checks that you are getting back 6 rows
of data for grading.

Book: page 139 talks about update.

');
INSERT INTO a02_tags (id, tag) VALUES ('baca31e3-6b14-413f-8f96-94f4d64c4a3b', 'update');
INSERT INTO a02_title (id, title, body) VALUES ('8759960a-5dc5-4664-ba7e-8ab936f80201', '# Interactive - 05 - insert more data / select unique data
', '# Interactive - 05 - insert more data / select unique data

Let"s put in some more data - that has some mistakes in it.


```
INSERT INTO name_list values
	( "Liz Trubune",         30, "WY" ),
	( "Jane True",           20, "WY" ),
	( "Lary Smith",          58, "NJ" ),
	( "Dave Dave",           21, "NJ" ),
	( "Laura Ann Alkinoos",  34, "PA" )
;


```

The problem is that "Jane True" is now a duplicate!

Let"s see it.

```
SELECT * from name_list;

```

We will get how to prevent this later.
Right now let"s get unique data back when the
actual data has duplicates.   For lots of reasons you 
can get duplicates in a set of selected data.

```
SELECT distinct * from name_list;

```

The select should return 10 rows of data.

Book: pages 12 to 14.

');
INSERT INTO a02_tags (id, tag) VALUES ('93fde3a8-282a-4f4b-9c2d-a58d73d4b287', 'insert');
INSERT INTO a02_tags (id, tag) VALUES ('79d5cb49-1342-4c5d-9a31-e8050019ee78', 'distinct');
INSERT INTO a02_tags (id, tag) VALUES ('39ad549e-5bb2-4185-a87d-962ebc5c61af', 'select distinct');
INSERT INTO a02_title (id, title, body) VALUES ('12904f08-8681-424b-a8bd-bd26dfe2b02d', '# Interactive - 06 - count rows of data
', '# Interactive - 06 - count rows of data

use count to get how many rows.

```
SELECT count(*) from name_list;

```

You should get 11 rows.

or with a where clause

```
SELECT count(*) from name_list
	WHERE state = "NJ"
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
	WHERE state = "NJ"
;

```

You should get back 1 row with a count of 10.

');
INSERT INTO a02_tags (id, tag) VALUES ('14b397cb-d709-4eb0-a74f-607f9de3ff38', 'count');
INSERT INTO a02_tags (id, tag) VALUES ('b4710d30-fc36-4919-9388-59fe6a6e7085', '"count distinct"');
INSERT INTO a02_title (id, title, body) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', '# Interactive - 07 - add a check constraint on age
', '# Interactive - 07 - add a check constraint on age

We can use the Data Definition Language (DDL) - create table to check
that values are in a correct range or value.

These are check constrains.

Let"s save our data for later, then recreate the table.

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

Provided that the counts are the same let"s clean up the temporary table with the old data. 

```
drop table old_name_list;
```

And let"s look at the data.


```
select * from name_list;

```

You should see 11 rows.  The duplicate should be removed.

Book: page 132 

');
INSERT INTO a02_tags (id, tag) VALUES ('16dbb245-1b55-49d8-b986-a145f3e67599', '"alter table rename"');
INSERT INTO a02_tags (id, tag) VALUES ('b158d74c-4bc0-4f5d-9c83-d5c3330ef184', '"rename"');
INSERT INTO a02_tags (id, tag) VALUES ('773c5a9d-1817-4c15-affd-8f4a219c9673', '"drop table"');
INSERT INTO a02_tags (id, tag) VALUES ('c4c81e4b-2b41-49d2-a8a0-c18714019f07', '"insert select"');
INSERT INTO a02_title (id, title, body) VALUES ('7296e800-3827-4ce9-8d8b-14df8ea1af2f', '# Interactive - 08 - create unique id and a primary key 
', '# Interactive - 08 - create unique id and a primary key 

It is really hard to update data when you don"t have a unique way of identifying a row.
People will often imagine that there is something unique in the data.  Some combination
of name/date/place-of-birth, generally it is not true.

The easy way to deal with this is to create unique keys.  PostgreSQL offers two ways 
of doing this.  The first is a key that counts up.   This makes short keys, that"s good
but also creates a bottle neck with a single source of "count-up" values.  The second
way is use a university unique identifier or UUID.  UUIDs are can be created in parallel
and will not collide.  This has lot"s of advantages, but they are long, hard to type
and take up lots of space in your database.

We will get back to sequential values later, for a different purpose.  Let"s do the
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

Let"s save our data for later, then recreate the table.

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

Provided that the counts are the same let"s clean up the temporary table with the old data. 


```
drop table old_name_list;
```

There are 2 parts that we added.  Both a ID column that is unique and
a thing called a `PRIMARY KEY`.


Your result should be similar to this list (the name_list_id"s will
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

');
INSERT INTO a02_tags (id, tag) VALUES ('a4b73d1d-56ef-4323-aff1-4de45acddbfb', '"primary key"');
INSERT INTO a02_tags (id, tag) VALUES ('6a6d95c3-5995-4dc4-b22d-b80af4b112f6', '"uuid"');
INSERT INTO a02_tags (id, tag) VALUES ('f951fd52-4b34-491e-bf5e-205295e41c45', '"unique id"');
INSERT INTO a02_tags (id, tag) VALUES ('34797c1a-2d8c-4510-a106-5787cc4e44d7', '"UUID"');
INSERT INTO a02_title (id, title, body) VALUES ('ace63caf-9787-4589-bbdf-2653724ba787', '# Interactive - 09 - add a table with state codes
', '# Interactive - 09 - add a table with state codes

A check constraint on all the state codes would be very long.   There are also
times when that is just not the best way to check that a value is correct.

There is a different way to check that a value is in a range of values.
That is to add a new table that contains all the values and have the
database verify that new values are in this list.

First let"s create the table with the values.  We can also have the
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
	("Alabama","AL","01"),
	("Alaska","AK","02"),
	("Arizona","AZ","04"),
	("Arkansas","AR","05"),
	("California","CA","06"),
	("Colorado","CO","08"),
	("Connecticut","CT","09"),
	("Delaware","DE","10"),
	("District of Columbia","DC","11"),
	("Florida","FL","12"),
	("Georgia","GA","13"),
	("Hawaii","HI","15"),
	("Idaho","ID","16"),
	("Illinois","IL","17"),
	("Indiana","IN","18"),
	("Iowa","IA","19"),
	("Kansas","KS","20"),
	("Kentucky","KY","21"),
	("Louisiana","LA","22"),
	("Maine","ME","23"),
	("Maryland","MD","24"),
	("Massachusetts","MA","25"),
	("Michigan","MI","26"),
	("Minnesota","MN","27"),
	("Mississippi","MS","28"),
	("Missouri","MO","29"),
	("Montana","MT","30"),
	("Nebraska","NE","31"),
	("Nevada","NV","32"),
	("New Hampshire","NH","33"),
	("New Jersey","NJ","34"),
	("New Mexico","NM","35"),
	("New York","NY","36"),
	("North Carolina","NC","37"),
	("North Dakota","ND","38"),
	("Ohio","OH","39"),
	("Oklahoma","OK","40"),
	("Oregon","OR","41"),
	("Pennsylvania","PA","42"),
	("Puerto Rico","PR","72"),
	("Rhode Island","RI","44"),
	("South Carolina","SC","45"),
	("South Dakota","SD","46"),
	("Tennessee","TN","47"),
	("Texas","TX","48"),
	("Utah","UT","49"),
	("Vermont","VT","50"),
	("Virginia","VA","51"),
	("Virgin Islands","VI","78"),
	("Washington","WA","53"),
	("West Virginia","WV","54"),
	("Wisconsin","WI","55"),
	("Wyoming","WY","56")
;

```


Now let"s make the relationship between them know to the database.
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
	( "nobody", "XX" )
;
```

You should get an error that looks similar to:

```
ERROR:  insert or update on table "name_list" violates foreign key constraint "name_list_state_fk"
DETAIL:  Key (state)=(XX) is not present in table "us_state".
```

Book: page 107, 136

');
INSERT INTO a02_tags (id, tag) VALUES ('bf1df0b0-46ab-4b8d-a7d6-2ec4f0c5c7a6', '"foreign key"');
INSERT INTO a02_tags (id, tag) VALUES ('94c65de4-83a8-471c-9cbc-a6c63f901381', '"alter table"');
INSERT INTO a02_tags (id, tag) VALUES ('24d48846-e257-4f5a-8e04-fcbc4b72f73a', '"add constraint"');
INSERT INTO a02_title (id, title, body) VALUES ('b62591f1-995a-482e-8695-59ff8aa8d375', '# Interactive - 10 - add a index on the name table
', '# Interactive - 10 - add a index on the name table

We have already added indexes but we need to make this process explicit.

The most common indexes are based on special kind of tree called a b-tree.

It is a very wide tree that allows us to get to the data stored on disk
quickly.  This is not the only kind of index.

There are indexes for other things that are built into PostgreSQL.

Let"s create an index on the real_name field.

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
select * from name_list where real_name = "bob true";
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

');
INSERT INTO a02_tags (id, tag) VALUES ('a0e7fec3-7a11-4199-81ce-5031c7d1e1a8', '"create index"');
INSERT INTO a02_title (id, title, body) VALUES ('d9990d48-9e0b-410d-9e15-0cc34ac2fcb9', '# Interactive - 11 - add a index on the name table that is case insensitive.
', '# Interactive - 11 - add a index on the name table that is case insensitive.

Let"s address the case sensitive problem first.

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
	WHERE lower(real_name) = lower("Bob True")
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

Let"s get rid of the index that is upper-lower case on the table.

```
drop index name_list_idx1;
```

This is the query that I used to find unused indexes (it"s a bit complicated):
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
WHERE indexdef !~* "unique"
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

');
INSERT INTO a02_tags (id, tag) VALUES ('7a188230-7e8a-4cfa-a43b-b46a4f6cb338', 'index');
INSERT INTO a02_tags (id, tag) VALUES ('bdda229c-fc44-473a-a085-ce06217870e3', '"lower"');
INSERT INTO a02_title (id, title, body) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', '# Interactive - 12 - fix our duplicate data
', '# Interactive - 12 - fix our duplicate data

Now that we have a unique primary key we can fix the duplicate name and its row.

```
SELECT * from name_list;

```

This shows us 2 rows and we would like to delete just one of them.  Without the unique
primary key this is really hard to do.  With the key we can delete one of the two rows.

This makes for a complex query.   First let"s select the UUID column, name_list_id
where the duplicate is.


```
SELECT name_list_id
	FROM name_list 
	WHERE real_name = "Jane True"
;

```

Now let"s just select 1 of the IDs. To do this we have to convert the UUID to text,
that is the `::text` so that we can use a function `min()` on it.  This is kind of
a random pick - but it will give us just 1 UUID.


```
SELECT min(name_list_id::text)
	FROM name_list 
	WHERE real_name = "Jane True"
;

```

Now we can delete and skip over the 1 UUID that we picked from above.  This is
the `not in` portion - where we put a select inside the delete.


```
DELETE FROM name_list
	WHERE real_name = "Jane True"
	  AND name_list_id::text not in (
		SELECT min(name_list_id::text)
		FROM name_list 
		WHERE real_name = "Jane True"
	)
;

```

Now select again and we have removed the duplicate.

```
SELECT * from name_list;

```

');
INSERT INTO a02_tags (id, tag) VALUES ('46100bd3-f3fd-4a51-827d-6eacdc12ce05', '"duplicate data"');
INSERT INTO a02_tags (id, tag) VALUES ('bb732104-26d5-493a-92f5-ae0c4abeb5fd', '"delete"');
INSERT INTO a02_tags (id, tag) VALUES ('d83fc4ef-fdd8-45f9-9b37-7575420470b4', '"type cast"');
INSERT INTO a02_tags (id, tag) VALUES ('c060b6db-929a-4e7b-956b-03b2d13ef1ad', '"min"');
INSERT INTO a02_tags (id, tag) VALUES ('9507196b-de21-45d3-a318-4a4f28176436', '"not in"');
INSERT INTO a02_title (id, title, body) VALUES ('4df809b9-8659-41b3-ac5c-6ecc642a1d41', '# Interactive - 13 - drop both tables
', '# Interactive - 13 - drop both tables

Let"s try getting rid of our 2 tables.   Our first attempt to do this will fail.

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
	( "Alabama",               "AL",     "01" ,      4903185,        25,      50750,     6,         2.0,   196.9  ),
	( "Alaska",                "AK",     "02" ,       731545,         1,     570641,    12,        -0.3,    52.3  ),
	( "Arizona",               "AZ",     "04" ,      7278717,         6,     113642,    12,         4.0,   309.1  ),
	( "Arkansas",              "AR",     "05" ,      3017825,        27,      52075,     8,         0.9,   115.9  ),
	( "California",            "CA",     "06" ,     39512223,         3,     155973,    12,         3.5,  2700.0  ),
	( "Colorado",              "CO",     "08" ,      5758736,         8,     103730,    10,         3.5,   336.4  ),
	( "Connecticut",           "CT",     "09" ,      3565387,        48,       4845,     1,         1.0,   242.2  ),
	( "Delaware",              "DE",     "10" ,       973764,        50,       1955,     3,         0.3,    63.9  ),
	( "District of Columbia",  "DC",     "11" ,       705749,        52,        137,     5,         3.2,  125.94  ),
	( "Florida",               "FL",     "12" ,     21477737,        26,      53997,     6,         3.5,   917.0  ),
	( "Georgia",               "GA",     "13" ,     10617423,        21,      57919,     6,         2.6,   522.4  ),
	( "Hawaii",                "HI",     "15" ,      1415872,        47,       6423,    12,         1.0,    80.8  ),
	( "Idaho",                 "ID",     "16" ,      1787065,        11,      82751,    12,         4.1,    69.9  ),
	( "Illinois",              "IL",     "17" ,     12671821,        24,      55593,     7,         2.1,   764.2  ),
	( "Indiana",               "IN",     "18" ,      6732219,        38,      35870,     7,         1.9,   326.1  ),
	( "Iowa",                  "IA",     "19" ,      3155070,        23,      55875,     7,         1.4,   170.7  ),
	( "Kansas",                "KS",     "20" ,      2913314,        13,      81823,    10,         1.9,   152.3  ),
	( "Kentucky",              "KY",     "21" ,      4467673,        36,      39732,     8,         1.4,   186.1  ),
	( "Louisiana",             "LA",     "22" ,      4648794,        33,      43566,    11,         1.1,   231.2  ),
	( "Maine",                 "ME",     "23" ,      1344212,        39,      30865,     1,         1.9,    56.7  ),
	( "Maryland",              "MD",     "24" ,      6045680,        42,       9775,     5,         1.6,   367.9  ),
	( "Massachusetts",         "MA",     "25" ,      6949503,        45,       7838,     1,         2.7,   501.3  ),
	( "Michigan",              "MI",     "26" ,      9986857,        22,      56539,     7,         2.7,   468.4  ),
	( "Minnesota",             "MN",     "27" ,      5639632,        14,      79617,     9,         2.2,   331.4  ),
	( "Mississippi",           "MS",     "28" ,      2976149,        31,      46914,     6,         1.0,   101.6  ),
	( "Missouri",              "MO",     "29" ,      6137428,        18,      68898,     8,         2.3,   282.2  )
;

INSERT INTO us_state
    ( state_name,             state,  FIPS_code,  population, area_rank, area_sq_mi, fed_area, gdp_growth, gdp ) values
	( "Montana",               "MT",     "30" ,      1068778,         4,     145556,     9,         0.9,    44.8  ),
	( "Nebraska",              "NE",     "31" ,      1934408,        15,      76878,    10,         1.5,   112.2  ),
	( "Nevada",                "NV",     "32" ,      3080156,         7,     109806,    12,         3.2,   146.2  ),
	( "New Hampshire",         "NH",     "33" ,      1359711,        44,       8969,     1,         2.2,    75.6  ),
	( "New Jersey",            "NJ",     "34" ,      8882190,        46,       7419,     5,         2.0,   554.7  ),
	( "New Mexico",            "NM",     "35" ,      2096829,         5,     121365,    11,         1.8,    92.6  ),
	( "New York",              "NY",     "36" ,     19453561,        30,      47224,     2,         2.1,  1400.0  ),
	( "North Carolina",        "NC",     "37" ,     10488084,        29,      48718,     5,         2.9,   496.1  ),
	( "North Dakota",          "ND",     "38" ,       762062,        17,      68994,     9,         2.5,    51.2  ),
	( "Ohio",                  "OH",     "39" ,     11689100,        35,      40953,     4,         1.8,   601.5  ),
	( "Oklahoma",              "OK",     "40" ,      3956971,        19,      68679,    10,         1.8,   193.0  ),
	( "Oregon",                "OR",     "41" ,      4217737,        10,      96003,    12,         3.4,   213.7  ),
	( "Pennsylvania",          "PA",     "42" ,     12801989,        32,      44820,     4,         2.1,   712.1  ),
	( "Puerto Rico",           "PR",     "72" ,      3194000,        49,       3515,     2,         0.4,   101.0  ),
	( "Rhode Island",          "RI",     "44" ,      1059361,        51,       1034,     1,         0.6,    53.7  ),
	( "South Carolina",        "SC",     "45" ,      5148714,        40,      30111,     5,         1.6,   202.8  ),
	( "South Dakota",          "SD",     "46" ,       884659,        16,      75898,     9,         1.3,    45.9  ),
	( "Tennessee",             "TN",     "47" ,      6833174,        34,      41220,     6,         3.0,   322.9  ),
	( "Texas",                 "TX",     "48" ,     28995881,         2,     261914,    11,         3.2,  1700.0  ),
	( "Utah",                  "UT",     "49" ,      3205958,        12,      82168,    12,         4.3,   157.2  ),
	( "Vermont",               "VT",     "50" ,       623989,        43,       9249,     1,         1.2,    30.0  ),
	( "Virginia",              "VA",     "51" ,      8535519,        37,      39598,     5,         2.4,    71.3  ),
	( "Virgin Islands",        "VI",     "78" ,       106977,        53,         68,    12,         0.24,     3.85),
	( "Washington",            "WA",     "53" ,      7614893,        20,      66582,    12,         5.7,   506.7  ),
	( "West Virginia",         "WV",     "54" ,      1792147,        41,      24087,     5,         2.4,    71.3  ),
	( "Wisconsin",             "WI",     "55" ,      5822434,        25,      54314,     7,         2.5,   299.8  ),
	( "Wyoming",               "WY",     "56" ,       578759,         9,      97105,    10,         0.3,    38.4  )
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
	( "Bob True",            22, "WY", 31000 ),
	( "Jane True",           20, "WY", 28000 ),
	( "Tom Ace",             31, "NJ", 82500 ),
	( "Steve Pen",           33, "NJ", 89400 ),
	( "Laura Jean Alkinoos", 34, "PA", 120000 ),
	( "Philip Schlump",      62, "WY", 101200 ),
	( "Liz Trubune",         30, "WY", 48000 ),
	( "Lary Smith",          58, "NJ", 48000 ),
	( "Dave Dave",           21, "NJ", 48000 ),
	( "Laura Ann Alkinoos",  34, "PA", 48000 )
;


```

You should have both states and territories with square miles.

```
SELECT * from us_state;
```

');
INSERT INTO a02_tags (id, tag) VALUES ('cd692878-2cd5-4886-a3c4-d0fe99884072', '"reload data"');
INSERT INTO a02_tags (id, tag) VALUES ('018ccc80-00cd-4c98-ae0a-5a883c151030', '"drop cascade"');
INSERT INTO a02_title (id, title, body) VALUES ('15b5fda8-17c5-44c7-bc13-f6f397ee9462', '# Interactive - 14 - data types
', '# Interactive - 14 - data types

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
Let"s add these to our name_list table.

```
ALTER TABLE name_list add updated timestamp ;
ALTER TABLE name_list add created timestamp 
	default current_timestamp not null  ;

```

To make the "updated" column work we need have PostgreSQL run some
code when an update happens.  This kind of a thing is called a "trigger".

Let"s add a trigger to the table.  
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
LANGUAGE "plpgsql";


CREATE TRIGGER name_list_trig
	BEFORE update ON name_list
	FOR EACH ROW
	EXECUTE PROCEDURE name_list_upd();


```


Now when we do an update on this table it will set the updated field
to the current time.


');
INSERT INTO a02_tags (id, tag) VALUES ('eb4833fe-66dc-4f00-be02-2ed60e86fd28', '"data types"');
INSERT INTO a02_title (id, title, body) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', '# Interactive - 15 - select with group data of data
', '# Interactive - 15 - select with group data of data

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
		string_agg(state, "," ORDER BY state) as  state_list
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

Let"s say we just want the avg_growth and the list of states.  We
have to have fed_area to do the grouping - but we can nest
our select.


```
SELECT t1.avg_growth, t1.state_list
	FROM (
		SELECT 
				t2.fed_area,
				avg(t2.gdp_growth) as avg_growth,
				string_agg(t2.state, "," ORDER BY state) as  state_list
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

');
INSERT INTO a02_tags (id, tag) VALUES ('a22361f2-304d-47aa-b465-1e841f76d712', '"max"');
INSERT INTO a02_tags (id, tag) VALUES ('29a1da8c-c341-476e-bbc7-2a87cb5fbea2', '"avg"');
INSERT INTO a02_tags (id, tag) VALUES ('8a79ed2a-74e0-4ab1-82fd-03e2cefb6446', '"group by"');
INSERT INTO a02_tags (id, tag) VALUES ('ee7a0190-1ec7-4914-a3be-e1d325c846a0', '"order by"');
INSERT INTO a02_tags (id, tag) VALUES ('7c5f67ca-4c8c-407a-a80c-cb994e76cd2e', '"nested query"');
INSERT INTO a02_tags (id, tag) VALUES ('ca7d3368-1d8c-4cb3-b2a1-5e9506585c04', '"sub query"');
INSERT INTO a02_title (id, title, body) VALUES ('3ea3bacb-e945-4dab-a30d-99561dbbb648', '# Interactive - 16 - count matching rows in a select
', '# Interactive - 16 - count matching rows in a select

You can count stuff that is grouped.   This turns out to be very useful.

Suppose that we want to know how many states are in a group and the
sum of the population in the group.

```
SELECT 
		fed_area,
		round(avg(gdp_growth)::numeric,2)::text||"%" as avg_growth,
		sum(population) as sum_population,
		count(state) as no_of_states,
		string_agg(state, "," ORDER BY state) as  state_list
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
4. You can convert from the numeric result of round to text with a "::text" type cast - then add the "%" to show it is a percentage.



## Book

- group by - page 120 to 121
- avg - 64
- order by - page 15, 16

');
INSERT INTO a02_title (id, title, body) VALUES ('79bf3bb8-0e98-4244-883e-2687d4b9e6d0', '# Interactive - 17 - select with join ( inner join, left outer join )
', '# Interactive - 17 - select with join ( inner join, left outer join )

SQL starts to get fun, and become a programming task as soon
as we have more than one table.

We have already seen a join between name_list and us_state based
on state code.  Let"s get specific on how joins work and how
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
	( 1, "Sales" ),
	( 2, "Development" ),
	( 3, "Execuatie" ),
	( 4, "Maintenance" )
;

INSERT INTO employee (  name, department_id, pay ) values	
	( "Bob", 1, 36000 ),
	( "Jane", 1, 140000 ),
	( "Sally", 2, 121000 ),
	( "Liz", 2, 101000 ),
	( "Dave", 1, 51000 ),
	( "CEO Kelly", 3, 1 ),
	( "Uncle Bob", NULL, 96000 ),
	( "Brother Charley", NULL, 48000 )
;



```

We have created the table department with a set of used IDs, 1..4.  We need
to update the number generator for the `serial` data to reflect this.
If we don"t it will start with 1 and we have already used 1.  We will not
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
or NULLs where they don"t join.

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

Interesting .... That is $144,000.00 payed out to employees that aren"t in
departments.


There are "right" joins but usually I just swap the order of the tables and use the left joins.


');
INSERT INTO a02_tags (id, tag) VALUES ('c99b8f92-e585-4c3e-a073-8da7b330a316', '"inner join"');
INSERT INTO a02_tags (id, tag) VALUES ('435ce75d-81c6-479a-bf28-96d0deccff74', '"outer join"');
INSERT INTO a02_tags (id, tag) VALUES ('a9a57f08-5b68-4f87-8359-74dbffb6f4d6', '"left outer join"');
INSERT INTO a02_title (id, title, body) VALUES ('3a935ab9-e899-4f27-bf74-857c99c7963f', '# Interactive - 18 - More joins (full joins)
', '# Interactive - 18 - More joins (full joins)

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


');
INSERT INTO a02_tags (id, tag) VALUES ('5e41e105-b96c-436f-9c71-c57316168c1d', '"full join"');
INSERT INTO a02_tags (id, tag) VALUES ('e190abff-cce1-412e-9b08-365b90c36546', '"full outer join"');
INSERT INTO a02_title (id, title, body) VALUES ('4eec7dee-9c15-42bb-a2e7-2fbff62f60f3', '# Interactive - 19 - select using sub-query and exists
', '# Interactive - 19 - select using sub-query and exists

Let"s use some of our joins to delete some data.

Let"s get rid of the people that are not in a department.

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
			SELECT "found"
			FROM employee as t5
			WHERE t5.pay > 65000
			  and t5.employee_id = t0.employee_id
		)
;

```

You should get back 2 rows.

These rows should be the offending rows with the department-less employees.

');
INSERT INTO a02_tags (id, tag) VALUES ('661cdcae-66f0-48b4-aa82-b15af9ca5591', '"select exists"');
INSERT INTO a02_tags (id, tag) VALUES ('ba1b8c9f-e0f6-4692-bcdd-cacb656142f9', '"sub-query"');
INSERT INTO a02_title (id, title, body) VALUES ('e439f21d-6a81-46d2-b101-5c932b857741', '# Interactive - 20 - delete with in based sub-query
', '# Interactive - 20 - delete with in based sub-query

Let"s use some of our joins to delete some data.

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
	( 1, "Sales" ),
	( 2, "Development" ),
	( 3, "Execuatie" ),
	( 4, "Maintenance" )
;

INSERT INTO employee (  name, department_id, pay ) values	
	( "Bob", 1, 36000 ),
	( "Jane", 1, 140000 ),
	( "Sally", 2, 121000 ),
	( "Liz", 2, 101000 ),
	( "Dave", 1, 51000 ),
	( "CEO Kelly", 3, 1 ),
	( "Uncle Bob", NULL, 96000 ),
	( "Brother Charley", NULL, 48000 )
;



```


Let"s get rid of the people that are not in a department.

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


');
INSERT INTO a02_tags (id, tag) VALUES ('68ca995a-40db-4969-9845-7b73539dee43', '"delete exists"');
INSERT INTO a02_title (id, title, body) VALUES ('aa573a06-a932-4ec3-a6ad-77a2ccbfd37d', '# Interactive - 21 - select with union / minus
', '# Interactive - 21 - select with union / minus

You can concatenate results with a "UNION" between two selects.  This can be kind of like a full join
but instead of getting back nulls you can fill in values that you like.

```
	SELECT t1.name as "Employee Name", "No Departmnt" "Department Name", t1.pay "Year Pay"
	FROM employee as t1
	WHERE t1.department_id is null
UNION
	SELECT "No Name" as "Employee Name", t2.dept_name as "Department Name", 0.0 "Year Pay"
	FROM department as t2 
ORDER BY 1
;

```

You should get back 4 rows.

');
INSERT INTO a02_tags (id, tag) VALUES ('8d9c0508-570e-4b55-b027-3b2a45de5e20', '"union"');
INSERT INTO a02_title (id, title, body) VALUES ('c94a4e16-ebb9-47ed-b84d-2936e8c7be32', '# Interactive - 22 - recursive select - populating existing tables 
', '# Interactive - 22 - recursive select - populating existing tables 

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
	(1, "Michael North", NULL),
	(2, "Megan Berry", 1),
	(3, "Sarah Berry", 1),
	(4, "Zoe Black", 1),
	(5, "Tim James", 1),
	(6, "Bella Tucker", 2),
	(7, "Ryan Metcalfe", 2),
	(8, "Max Mills", 2),
	(9, "Benjamin Glover", 2),
	(10, "Carolyn Henderson", 3),
	(11, "Nicola Kelly", 3),
	(12, "Alexandra Climo", 3),
	(13, "Dominic King", 3),
	(14, "Leonard Gray", 4),
	(15, "Eric Rampling", 4),
	(16, "Piers Paige", 7),
	(17, "Ryan Henderson", 7),
	(18, "Frank Tucker", 8),
	(19, "Nathan Ferguson", 8),
	(20, "Kevin Rampling", 8)
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

');
INSERT INTO a02_tags (id, tag) VALUES ('23f9350f-ab9d-4f36-baf1-55b61088dff6', '"recursive select"');
INSERT INTO a02_tags (id, tag) VALUES ('911d8f3a-8342-4f6c-94b1-6ece842b467b', 'recursive');
INSERT INTO a02_title (id, title, body) VALUES ('fa98049b-a18a-4652-8aaf-be0b0aece4cd', '# Interactive - 23 - with - pre-selects to do stuff.
', '# Interactive - 23 - with - pre-selects to do stuff.

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
	mystery_employess as ( select sum(pay) total_pay  from name_list where state = "WY" ),
	normal_employees as ( select sum(pay) total_pay from name_list where state in ( "NJ", "NY" ) )
SELECT round( ( tWY.total_pay / ( tWY.total_pay + tEast.total_pay ) ) * 100.0, 2)  as relative_pay
FROM 
	mystery_employess  as tWY
	, normal_employees  as tEast
;

```


You should get back a single row of data that tells you that in Wyoming you get 43% as much pay
as a job in NY or NJ (Note that the data in this example is not totally accurate.  Also you have
a much lower cost of living in Wyoming than you do in NY NY.)

');
INSERT INTO a02_tags (id, tag) VALUES ('e8939fc9-abab-4c7a-8568-1072ac99ecb1', '"with"');
INSERT INTO a02_tags (id, tag) VALUES ('f09539a5-c05b-4e2f-9313-7ff375b4d225', '"with select"');
INSERT INTO a02_title (id, title, body) VALUES ('7183cffc-7a10-4305-aea5-445a3060d34a', '# Interactive - 24 - truncate table
', '# Interactive - 24 - truncate table

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

');
INSERT INTO a02_tags (id, tag) VALUES ('6ead8988-ff46-4f8b-a2bd-66cbf4f30705', '"truncate"');
INSERT INTO a02_tags (id, tag) VALUES ('72086ba2-0400-4a3a-81e4-f662f03d6f24', '"fast delete"');
INSERT INTO a02_tags (id, tag) VALUES ('e13e235e-0654-446e-945b-94bb942dee72', '"delete all rows"');
INSERT INTO a02_title (id, title, body) VALUES ('c2d1bc86-6aac-4e85-9d03-ed0ec5464111', '# Interactive - 25 - drop cascade 
', '# Interactive - 25 - drop cascade 

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


Let"s re-create our tables at this point so we have fresh
data for future homework problems.

Run the file to re-create : hw13_4.sql

drop table if exists us_state cascade;


');
INSERT INTO a02_tags (id, tag) VALUES ('8691a92b-8b0e-4c7b-bae1-f4bd64b99b4c', '"drop"');
INSERT INTO a02_title (id, title, body) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', '# Interactive - 26 - 1 to 1 relationship  				(pk to pk)
', '# Interactive - 26 - 1 to 1 relationship  				(pk to pk)

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
	, "email_confirmed" 	char varying (1) default "n" not null
	, "setup_2fa_complete" 	char varying (1) default "n" not null
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
$$ LANGUAGE "plpgsql";


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
$$ LANGUAGE "plpgsql";


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
	, "seq"	 				bigint DEFAULT nextval("t_log_seq"::regclass) NOT NULL 
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
$$ LANGUAGE "plpgsql";


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
	, class_no					text default "4010-BC" not null	-- 4820 or 4010-BC - one of 2 classes
	, lang_to_use				text default "Go" not null		-- Go or PostgreSQL
	, misc						JSONb default "{}" not null		-- Whatever I forgot
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
	, completed					char(1) default "n" not null
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
$$ LANGUAGE "plpgsql";


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
$$ LANGUAGE "plpgsql";


DROP TRIGGER if exists ct_homework_trig_ins_upd on ct_homework;

CREATE TRIGGER ct_homework_trig_ins_upd
	AFTER insert or update ON ct_homework
	FOR EACH ROW
	EXECUTE PROCEDURE ct_homework_ins();






CREATE OR REPLACE function ct_homework_del()
RETURNS trigger AS $$
BEGIN
	update ct_homework_ans t3
		set completed = "x"
		where t3.homework_id = NEW.homework_id
		  and t3.completed = "n"
	;
	RETURN OLD;
END
$$ LANGUAGE "plpgsql";


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
$$ LANGUAGE "plpgsql";


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



');
INSERT INTO a02_tags (id, tag) VALUES ('e7a63d2f-07a6-4c5a-a897-6240d01777a5', '"setup"');
INSERT INTO a02_tags (id, tag) VALUES ('bee1a76c-bb67-4866-8f92-ce95567c0821', '"ct_homework"');
INSERT INTO a02_tags (id, tag) VALUES ('124a8835-233e-4c96-b605-408459094c0d', '"ct_homework_ans"');
INSERT INTO a02_tags (id, tag) VALUES ('ab5b72dc-d79e-4f59-9cba-9cd1caef5058', '"ct_tag"');
INSERT INTO a02_tags (id, tag) VALUES ('c2b7be39-5979-48aa-b9cd-d39789fb00a9', '"ct_tag_homework"');
INSERT INTO a02_tags (id, tag) VALUES ('a7cf66d8-5da2-40e4-8a04-cb5cadff824f', '"t_ymux_user"');
INSERT INTO a02_tags (id, tag) VALUES ('cace60cd-b594-4cff-b272-dbc4ab8d34e3', '"t_ymux_user_log"');
INSERT INTO a02_tags (id, tag) VALUES ('2ac1540e-f6cc-4c47-8442-a6b3960d4748', '"t_ymux_auth_token"');
INSERT INTO a02_title (id, title, body) VALUES ('690c600a-a338-4ce9-9557-9e7db1fcfd9e', '# Interactive - 27 - 1 to 0 or 1 relationship 			(fk, unique)
', '# Interactive - 27 - 1 to 0 or 1 relationship 			(fk, unique)

Now that we have our tables let"s look at the relationship between
`"t_ymux_user"` and `ct_login`.   This is our 1 to 0 or 1 relationship.

It is provided by the primary key on ct_login being required but not
having a default value where a key is generated.   This is combined
with the foreign key constraint to `"t_ymux_user"`.

Try an insert to see if you can fake it out (the insert will fail).

```
insert into ct_login ( user_id, pg_acct ) values ( uuid_generate_v4(), "x" );

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
            "Stmt": "insert into ct_login ( user_id, pg_acct ) values ( uuid_generate_v4(), "x" )"
        }
    ]
}
```

');
INSERT INTO a02_tags (id, tag) VALUES ('43ef1ce7-e756-460d-a8bd-76a9d9c5dfbb', '1:0');
INSERT INTO a02_tags (id, tag) VALUES ('2304c671-8946-4fd1-b041-2a65a476b385', '"1 to 0"');
INSERT INTO a02_tags (id, tag) VALUES ('ef344893-7c17-4222-8b7b-e2f6d97b4bcf', '"1:0 relationship"');
INSERT INTO a02_tags (id, tag) VALUES ('c611e87b-1aed-4dce-8843-25b76f8e1945', '"1:1"');
INSERT INTO a02_title (id, title, body) VALUES ('8532013a-f2ba-4b05-8c2e-f3067d4adfe8', '# Interactive - 28 - 1 to n relationship				(fk)
', '# Interactive - 28 - 1 to n relationship				(fk)

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

');
INSERT INTO a02_tags (id, tag) VALUES ('d34ad4b9-dde2-4408-8e0b-58c9cef4dd96', '1:n');
INSERT INTO a02_tags (id, tag) VALUES ('89e05cdd-4740-4773-b67c-3c488f914fa8', '"1:n relationship"');
INSERT INTO a02_title (id, title, body) VALUES ('475b796e-fa1c-4950-abb3-facdfaabc630', '# Interactive - 29 - m to n relationship				(fk to join table to fk)
', '# Interactive - 29 - m to n relationship				(fk to join table to fk)

Our model has a m to n (m:n) relationship in it.  This is between ct_homeowrk
and ct_tags.

This relationship requires an intermediate table.  Each side has a relationship
to the intermediate table.


ct_tag associates a tag_word with a tag_id  (Shown below - the table was created
in the script in homework 26 - you don"t need to run it.)

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

It"s important that the sort order by homework_no be done as an
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










');
INSERT INTO a02_tags (id, tag) VALUES ('1f75be4f-2c42-4fad-bf48-0ee8ce23220b', 'm:n');
INSERT INTO a02_tags (id, tag) VALUES ('de751871-f900-47d4-b3cb-4a98d66737a7', '"m to n"');
INSERT INTO a02_tags (id, tag) VALUES ('edfcd286-c168-4d80-8fb0-323546f65175', '"m:n"');
INSERT INTO a02_tags (id, tag) VALUES ('456be832-bc6b-4a57-b20a-836884e82031', '"m:n relationship"');
INSERT INTO a02_title (id, title, body) VALUES ('764f5a9a-fa2a-44e3-9089-809ad406a4d4', '# Interactive - 30 - 1 to ordered list relationship		(fk to uk with sequence)
', '# Interactive - 30 - 1 to ordered list relationship		(fk to uk with sequence)


The model has a 1 to a list of rows.  This is a more unusual relationship
because the list can be ordered by time.  Usually relationships in a SQL
database are not inherently ordered.  In  this case we use a sequence 
generated number to make the set of rows in a specific order.


Taken from hw26_3.sql that you have already run.
You don"t have to run it again.
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

For the field "seq" in the table we use the sequence.  This is
the `nextval("t_log_seq"::regclass)` default value.  When we insert
we allow the default value to fill `seq`.   Our join is a 1:n join
based on user_id to the user.  Each time a security event happens
we insert the type of event to this table.   In a complete
security system this kind of a "log" has a trigger on it and
for certain events it would generate an email to the user.  An
example is the creation of a device/application account or the
change of the account password.   Some events would just be logged
for later statistical usage - like a login or logout event.

Also taken from hw26_3.sql that you have already run.
You don"t have to run it again.

```
CREATE TABLE "t_ymux_user_log" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "user_id"				uuid 	-- if null then a failed event
	, "seq"	 				bigint DEFAULT nextval("t_log_seq"::regclass) NOT NULL 
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

Don"t loose your source code for these tables.
We will use these tables in the assignment on key word search later in the class.



');
INSERT INTO a02_tags (id, tag) VALUES ('78c8dedf-6d59-408c-b9dd-623b0e46069b', '"1 to list"');
INSERT INTO a02_tags (id, tag) VALUES ('9d4280ed-72ba-492d-b0ac-f1b252d4f260', '"list of rows"');
INSERT INTO a02_title (id, title, body) VALUES ('b2e19f08-be87-4c6b-8150-fe23a31ef873', '# Interactive - 31 - only one row of data				(uk with no sequence)
', '# Interactive - 31 - only one row of data				(uk with no sequence)

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
INSERT INTO ct_config ( application_name ) values ( "4820 class" );


```

and 2nd insert

```
insert into ct_config ( application_name ) values ( "4010 blockchain class" );

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
		RAISE EXCEPTION "cannot delete configuration row";
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


');
INSERT INTO a02_tags (id, tag) VALUES ('26005ad5-c639-468b-91e8-031b6b3eed1b', '"single row"');
INSERT INTO a02_tags (id, tag) VALUES ('6252310a-1a38-44be-8a72-2106037d0bf2', '"raise exception"');
INSERT INTO a02_tags (id, tag) VALUES ('dbdb1cb8-11fc-48ba-82c8-6ca3e53e1771', '"trigger"');
INSERT INTO a02_tags (id, tag) VALUES ('3f963c54-1c27-4692-951f-66ad44387cee', '"delete trigger"');
INSERT INTO a02_title (id, title, body) VALUES ('9da753ac-0f3f-466f-b65e-cc22d897eb28', '# Interactive - 32 - only one a fixed set of rows.		(pre-populate with key, pk, check-constraint on key)
', '# Interactive - 32 - only one a fixed set of rows.		(pre-populate with key, pk, check-constraint on key)

There is a different way to implement a set of configuration items.  In this case the items
are stored one in each row in a set of fixed rows.


```
DROP  TABLE if exists ct_config_row ;

CREATE TABLE ct_config_row (
	  id				serial not null primary key
	, name 				text not null check ( name in (
							"security_method",
							"encryption"
						) )
	, ty 				text not null default "str"
	, value 			text 
	, i_value 			bigint
	, b_value 			boolean
);

CREATE UNIQUE INDEX ct_config_row_p1 on ct_config_row ( name );

```

With a table like this we can insert some values:

```
INSERT INTO ct_config_row ( name, value ) values	
	( "security_method", "jwt" ),
	( "encryption", "es" )
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
		RAISE EXCEPTION "cannot delete configuration row";
	END IF;
END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER ct_config_row_prevent_delete 
	BEFORE DELETE ON ct_config_row
	FOR EACH ROW EXECUTE PROCEDURE ct_config_row_prevent_delete();

```

');
INSERT INTO a02_tags (id, tag) VALUES ('93b838a5-12ff-49f7-92c7-82f57e62702f', '"fixed set rows"');
INSERT INTO a02_tags (id, tag) VALUES ('83e3f2b2-1cba-4382-975c-a7494dc3a66e', '"check constraint"');
INSERT INTO a02_title (id, title, body) VALUES ('2037bea2-643a-47c0-a091-5cb4439ebdf2', '# Interactive - 33 - types of indexes (hash, gin)
', '# Interactive - 33 - types of indexes (hash, gin)

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


');
INSERT INTO a02_tags (id, tag) VALUES ('6c7cfebb-0108-4eca-8b6e-79a181a03fd5', '"index"');
INSERT INTO a02_tags (id, tag) VALUES ('fb6dabc0-11ec-42b8-aab0-cc107bb7093a', '"gin index"');
INSERT INTO a02_tags (id, tag) VALUES ('302f0491-d964-4e95-90d8-6bd5f6bc2579', '"hash index"');
INSERT INTO a02_title (id, title, body) VALUES ('e75f6fdc-46d9-4892-8b2d-bbacdab6bf14', '# Interactive - 34 - explain
', '# Interactive - 34 - explain

First you have to understand that different queries will work and perform in different 
ways.  The biggest thing is the query hitting an index.  That is not the only thing.

```
select
          t1.homework_id
        , t1.homework_no
        , case
            when t3.pts = 0 then "n"
            when t3.pts is null then "n"
            else "y"
          end as "has_been_seen"
        , t1.homework_no::int as i_homework_no
        , coalesce(t3.tries,NULL,0,t3.tries) as tries
    from ct_homework as t1
        left outer join ct_homework_seen as t2 on ( t1.homework_id = t2.homework_id )
        left outer join ct_homework_grade as t3 on ( t1.homework_id = t3.homework_id )
    where exists (
            select 1 as "found"
            from ct_login as t3
            where t3.user_id = "7a955820-050a-405c-7e30-310da8152b6d"
        )
     and ( t3.user_id = "7a955820-050a-405c-7e30-310da8152b6d"
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
            when t3.pts = 0 then "n"
            when t3.pts is null then "n"
            else "y"
          end as "has_been_seen"
        , t1.homework_no::int as i_homework_no
        , coalesce(t3.tries,NULL,0,t3.tries) as tries
    from ct_homework as t1
        left outer join ct_homework_seen as t2 on ( t1.homework_id = t2.homework_id )
        left outer join ct_homework_grade as t3 on ( t1.homework_id = t3.homework_id 
            and t3.user_id = "7a955820-050a-405c-7e30-310da8152b6d" )
    where exists (
            select 1 as "found"
            from ct_login as t3
            where t3.user_id = "7a955820-050a-405c-7e30-310da8152b6d"
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
		where t4.user_id ="7a955820-050a-405c-7e30-310da8152b6d" 
	)
select
          t1.homework_id
        , t1.homework_no
        , case
            when t3.pts = 0 then "n"
            when t3.pts is null then "n"
            else "y"
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

#### Validate: SQL-Select,"select "PASS" as x"

#### FilesToRun: hw34_5.sql
#### FilesToRun: hw34_3.sql
');
INSERT INTO a02_title (id, title, body) VALUES ('b1e30da6-7b83-41fd-be04-c48f641bd153', '# Interactive - 35 - views
', '# Interactive - 35 - views

The database can create a pre-defined select called a view.
A view is a query that you set up that looks like a table when selected from but
can be a join or other set of operations.  It is kind of like a query-macro.

For example we can create a view that let"s us list the unused indexes.

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
WHERE indexdef !~* "unique"
ORDER BY
    idstat.idx_scan DESC,
    pg_relation_size(indexrelid) DESC
;

```

Then when we want the list of unused indexes we just select from the view.


```
SELECT * from unused_index;

```


');
INSERT INTO a02_tags (id, tag) VALUES ('8913463a-a29e-443b-bae9-963edabba3ce', 'view');
INSERT INTO a02_tags (id, tag) VALUES ('f94c2cb1-e689-46a5-b45c-89196aa9e0a6', '"unused index"');
INSERT INTO a02_title (id, title, body) VALUES ('1c1951a9-bf9c-493d-b6aa-6cfde4cb6d0d', '# Interactive - 36 - stored procedures
', '# Interactive - 36 - stored procedures

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
select function_name ( "a" );
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

	SELECT "PASS"
		INTO data
		FROM ct_config 
		WHERE config_id = 1;
	IF not found THEN
		data = "FAIL";
	END IF;

	RETURN data;
END;
$$ LANGUAGE plpgsql;

```


In PostgreSQL a stored procedure creates a transaction at the "BEGIN" and ends it at the
"END".  This means that if you "RAISE" an error in the middle it will result in rolling back
the entire transaction.

Stored procedures can return rows of data.  Note the fact that the loop returns a single
row and then restart"s for each additional row.

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
LANGUAGE "plpgsql" ;

SELECT * 
	FROM getStateFipsCode()
;

```

');
INSERT INTO a02_tags (id, tag) VALUES ('cd52c492-fc3d-44dd-9bb7-78780c368825', '"function"');
INSERT INTO a02_tags (id, tag) VALUES ('42d7a290-9950-42ec-87d8-0df438fdb921', '"stored procedure"');
INSERT INTO a02_tags (id, tag) VALUES ('fbfc305e-a8e1-407e-9b4c-4a6d67f45e60', '"transaction"');
INSERT INTO a02_title (id, title, body) VALUES ('90f148ff-b58e-4cb0-978e-5e146a45a3b1', '# Interactive - 37 - encrypted/hashed passwords storage
', '# Interactive - 37 - encrypted/hashed passwords storage

It is a good idea to store passwords in a way that if the entire database is lost
you do not loos anybody"s password.  You need to hash them or encrypt them
in the table.

There are hash functions that are designed for this.  Of of these is  
the blowfish algorithm.  It is denoted to in the encryption parameters as "bf".


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
	select gen_salt("bf")
		into l_salt;
	l_pw = NEW.password;
	NEW.password = crypt(l_pw, l_salt);
	RETURN NEW;
END
$$ LANGUAGE "plpgsql";


CREATE TRIGGER example_users_insert_trig
BEFORE insert or update ON example_users
FOR EACH ROW
EXECUTE PROCEDURE example_users_insert();


```

When we insert into the table we can then save the hash of the password instead of the
password itself.

```
INSERT INTO example_users (email, password) VALUES 
	( "pschlump@uwyo.edu", "my-very-bad-password")
;

```

When we want to validate that a password that has been passed in is correct
we compare to the hashed value with:


```
SELECT id 
	FROM example_users as t1
	WHERE t1.email = "pschlump@uwyo.edu"
	  AND t1.password = crypt("my-very-bad-password", t1.password)
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
		SELECT "VALID-USER"
			INTO data
			FROM example_users as t1
			WHERE t1.email = un
			  AND t1.password = crypt(pw, t1.password)
			;
		IF not found THEN
			data = "Incorrect username or password.";
		END IF;
	EXCEPTION	
		WHEN no_data_found THEN
			data = "Incorrect username or password.";
		WHEN too_many_rows THEN
			data = "Incorrect username or password.";
		WHEN others THEN
			data = "Incorrect username or password.";
	END;

	RETURN data;
END;
$$ LANGUAGE plpgsql;

select login_correct ( "pschlump@uwyo.edu", "my-very-bad-password" );

select login_correct ( "pschlump@uwyo.edu", "my-VERY-bad-password" );



```

');
INSERT INTO a02_tags (id, tag) VALUES ('5205b067-9829-4d31-85ed-28e70f866c90', '"password"');
INSERT INTO a02_tags (id, tag) VALUES ('b7a9d69a-9596-4338-bd55-3390cf00e535', '"hash password"');
INSERT INTO a02_tags (id, tag) VALUES ('42ec4492-738b-4c60-a5b1-72222799a051', '"encrypted"');
INSERT INTO a02_title (id, title, body) VALUES ('cd45a38d-2ebb-46ed-b93a-cc3626581ae0', '# Interactive - 38 - key word lookup
', '# Interactive - 38 - key word lookup

(Note this set of information is the basis for Assignment 03 on keywords)

PostgreSQL includes an extensive set of tools for key word lookup.   The word lookup is efficient and takes account of items like language and root words.

With regular SQL you have a pattern matching operator, `LIKE`.

```
SELECT real_name 
	FROM name_list 
	WHERE real_name  LIKE "%ilip%"
; 

```

The `%` is wild card.  Because of the use of a wild car this kind of a query will usually result in a full table scan.  In some cases it is possible to use
a GIST index on the field and that will make the search faster.

PostgreSQL has an extended set of patterns that allows matching a wider set of values.  This is with the `SIMILAR TO` operator.

```
SELECT real_name 
	FROM name_list 
	WHERE real_name SIMILAR TO "(p|P)hilip%"
; 

```

PostgreSQL also includes the ability to use regular expressions on text fields.  This uses POSIX regular expressions.  The Operator is the tilde `~` operator.

```
SELECT real_name 
	FROM name_list 
	WHERE real_name ~ "[pP]hilip.*"
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
SELECT to_tsvector("The quick brown fox jumped over the lazy dog.");  
```

Will result in

```
                      to_tsvector                      
-------------------------------------------------------
 "brown":3 "dog":9 "fox":4 "jump":5 "lazi":8 "quick":2
(1 row)
```

This set of data has "The" eliminated the "word" location for each word.  The words are converted into the root words.  "lazy" is 
confuted to "lazi" the root word.



## tsquery

`tsquery` is the query side of this along with the `@@` operator.

```
SELECT to_tsvector("The quick brown fox jumped over the lazy dog")  
    @@ to_tsquery("fox")
;

```

Will return "t" for true.


```
SELECT to_tsvector("The quick brown fox jumped over the lazy dog")  
    @@ to_tsquery("bob")
;

```

Will return "f" for false.


The query processing also allows for operators in a query.

```
SELECT to_tsvector("The quick brown fox jumped over the lazy dog")  
    @@ to_tsquery("fox | duck")
;

```

Will return "t" for true.

There are and, `&`, or, `|` and  not, `!` operators.


## As a table

Let"s put the tsvector data type into a table and add some data.

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
	( "On Tyrany", "A book about how to stop tyrants and how to deal with the devaluation of democracy." ),
	( "How Democracies Die", "A look at how other democracies around the world have failed." )
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

Let"s query for a pair of words.


```
SELECT doc_id, document_title 
	FROM indexed_docs  
	WHERE document_tokens @@ to_tsquery("die & democracy")
;  

```

Having to update the table after it is changed is far from ideal.   Let"s replace this with
a trigger so that the tokens are always updated.    Also we will add a ranking and  the `document_body`.

Run the file `hw38_10.sql`:

```
CREATE OR REPLACE function indexed_docs_ins_upd()
RETURNS trigger AS $$
DECLARE
	l_lang text;
BEGIN
	l_lang = "english";
	NEW.document_tokens = 
		setweight ( to_tsvector ( l_lang::regconfig, coalesce(NEW.document_title,"")), "A" ) ||
		setweight ( to_tsvector ( l_lang::regconfig, coalesce(NEW.document_body,"")), "B" )
	;
	RETURN NEW;
END
$$ LANGUAGE "plpgsql";


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
	( "Kleptopia: How Dirty Money Is Conquering the World", "How the flow of dirty money is chaing world politics"),
	( "The End of Democracies", "How democracies aroudn the world are failing." )
;

```

A select on the indexed_documents will show that all 4 rows have the `document_tokens` field 
filled in.


Now add an index to the field so that searches will be fast.

Run the file `hw38_12.sql`:

```
CREATE INDEX if not exists indexed_docs_tsv_1 ON indexed_docs USING GIN (document_tokens);  

```







');
INSERT INTO a02_tags (id, tag) VALUES ('7ba3812b-51b6-42a2-8327-d057b9d77760', '"reverse key index"');
INSERT INTO a02_tags (id, tag) VALUES ('da1a0503-00bb-46fb-a96b-0af9fcc6cf01', '"like"');
INSERT INTO a02_tags (id, tag) VALUES ('507267d7-2097-488a-8b60-cd52f9113fac', '"keyword"');
INSERT INTO a02_title (id, title, body) VALUES ('c0970bd0-dcc3-4d5a-8cee-e4e4e39072bf', '# Interactive - 39 - materialized views
', '# Interactive - 39 - materialized views

One of the ways that you can improve performance in PostgreSQL and other SQL databases is a materialized view.
A regular view is a kind of "macro" that replaces the query"s from with the body of the view.  

In a materialized view the data itself is copied into the "view" and you can add indexes and other things
that optimize queries on this set of data.

The downsize to materialized views is that the data can get out of sync with the original data.

Materialized views are very useful when the source of the data is a foreign data wrapper.  Especially
when the foreign data is slow or only periodically changes.

Let"s use our table with some names in it. (From Interactive Homework 08)

Run File `hw39_0.sql`:

```
CREATE EXTENSION if not exists "uuid-ossp";
CREATE EXTENSION if not exists pgcrypto;

CREATE TABLE name_list if not exists (
	name_list_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key,
	real_name text check ( length(real_name) >= 1 ) not null,
	age int check ( age > 0 and age < 154 ) not  null,	
	state char varying (2) not null,
	pay numeric(10,2) 
);

CREATE INDEX if not exists name_list_idx1 on name_list ( real_name );
CREATE INDEX if not exists user_real_name_ci_idx1 ON name_list ((lower(real_name)));

```

First let"s refresh the data in name_list so that we know what is in it.

Run File `hw39_2.sql`:

```
DELETE FROM name_list ;

INSERT INTO name_list ( real_name, age, state, pay ) values
	( "Bob True",            22, "WY", 31000 ),
	( "Jane True",           20, "WY", 28000 ),
	( "Tom Ace",             31, "NJ", 82500 ),
	( "Steve Pen",           33, "NJ", 89400 ),
	( "Laura Jean Alkinoos", 34, "PA", 120000 ),
	( "Philip Schlump",      62, "WY", 101200 ),
	( "Liz Trubune",         30, "WY", 48000 ),
	( "Lary Smith",          58, "NJ", 48000 ),
	( "Dave Dave",           21, "NJ", 48000 ),
	( "Laura Ann Alkinoos",  34, "PA", 48000 )
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

Now let"s select the data:

```

SELECT * from count_by_state_of_names ;

```

You should get back 3 rows.


');
INSERT INTO a02_tags (id, tag) VALUES ('3ac7c99d-6afb-46bd-b451-fbcddc5f7b48', '"materialized view"');
INSERT INTO a02_title (id, title, body) VALUES ('d25401fd-2ec8-41b3-adde-819be7943a33', '# Interactive - 40 - refresh materialized view
', '# Interactive - 40 - refresh materialized view

Last time we created a materialized view, `count_by_state_of_names`.

This time let"s refresh it with new data.

```
REFRESH MATERIALIZED VIEW count_by_state_of_names;

```

Materialized views don"t change when the underlying data changes.  
You have to refresh them.


');
INSERT INTO a02_title (id, title, body) VALUES ('a427fa20-2403-47f7-8beb-af05a3318ab1', '# Interactive - 41 - case/when - if in projected columns
', '# Interactive - 41 - case/when - if in projected columns

You can change the return values in the projected columns.

For example if you want to map certain values to new values in a query.
An example with the name_list table is to create a new column that is
an in-Wyoming column.


```
SELECT
		  t1.real_name
		, t1.state
		, case
			when t1.state = "WY" then "y"
			when t1.state is null then "n"
			else "n"
		  end as "in_wyoming"
	FROM name_list as t1
;

```


');
INSERT INTO a02_tags (id, tag) VALUES ('f4da3421-d40f-42da-a81d-cc07245dd395', '"when"');
INSERT INTO a02_tags (id, tag) VALUES ('47870d40-c660-4b64-9c07-26b32e59da30', '"projected data"');
INSERT INTO a02_title (id, title, body) VALUES ('2189012c-e0eb-4959-8d33-9e25ef1c6898', '# Interactive - 42 - foreign data wrapper
', '# Interactive - 42 - foreign data wrapper

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
) SERVER import OPTIONS ( filename "/home/uw4820/hw42_03.csv", format "csv" );

```

Now we can use standard selects to access the data.

```

SELECT * from table1_import;

SELECT * from table1_import where col1 = "abc";


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

This is an example of using `dblink` - you don"t need to run it.  It is just an example.

```
SELECT * 
FROM   table1 as t1 
LEFT   JOIN (
   SELECT *
   FROM dblink("dbname=database2","SELECT t3.id, t3.code FROM table2 as t3") AS t2(id int, code text)
) AS t4 ON t4.column = t1.column
;
```













');
INSERT INTO a02_tags (id, tag) VALUES ('3ccd9aad-ea9f-4ca1-8ef7-fb1dd972c344', '"foreign data wrapper"');
INSERT INTO a02_tags (id, tag) VALUES ('d8eef215-f345-48a2-b87c-4cec636b6df2', '"csv"');
INSERT INTO a02_tags (id, tag) VALUES ('5dbc7563-8eb1-43fc-8f7f-45a71912b112', '"fdw"');
INSERT INTO a02_tags (id, tag) VALUES ('1f7e0177-9d68-40ed-9af6-c9d3d71edd8c', '"import data"');
INSERT INTO a02_title (id, title, body) VALUES ('0f59130c-a293-4046-b74f-8c8f59bcffdf', '# Interactive - 43 - indexes on functions - soundex 
', '# Interactive - 43 - indexes on functions - soundex 

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
	soundex text = "";
	char text;
	symbol text;
	last_symbol text = "";
	pos int = 1;
BEGIN
	WHILE length(soundex) < 4 LOOP
		char = upper(substr(input, pos, 1));
		pos = pos + 1;
		CASE char
		WHEN "" THEN
			-- End of input string
			IF soundex = "" THEN
				RETURN "";
			ELSE
				RETURN rpad(soundex, 4, "0");
			END IF;
		WHEN "B", "F", "P", "V" THEN
			symbol = "1";
		WHEN "C", "G", "J", "K", "Q", "S", "X", "Z" THEN
			symbol = "2";
		WHEN "D", "T" THEN
			symbol = "3";
		WHEN "L" THEN
			symbol = "4";
		WHEN "M", "N" THEN
			symbol = "5";
		WHEN "R" THEN
			symbol = "6";
		ELSE
			-- Not a consonant; no output, but next similar consonant will be re-recorded
			symbol = "";
		END CASE;

		IF soundex = "" THEN
			-- First character; only accept strictly English ASCII characters
			IF char ~>=~ "A" AND char ~<=~ "Z" THEN
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
	WHERE soundex(real_name) = soundex("philip schlump")
;

```

This will use the output from the function to do the query.  This makes for a fast lookup.


');
INSERT INTO a02_tags (id, tag) VALUES ('83bb34f0-3bd8-4bf8-844f-fbc64df951c5', '"fuzzy match"');
INSERT INTO a02_tags (id, tag) VALUES ('5ce5df38-1aea-40c6-ad80-03ca459a9bf9', '"soundex"');
INSERT INTO a02_tags (id, tag) VALUES ('c9092a6f-bbf4-414e-b14b-a0369dbc43db', '"function based index"');
INSERT INTO a02_title (id, title, body) VALUES ('86062a74-f4c1-40f4-9929-a26811513a7d', '# Interactive - 44 - alter table to add columns, remove columns
', '# Interactive - 44 - alter table to add columns, remove columns

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



');
INSERT INTO a02_tags (id, tag) VALUES ('0581ff4f-f5e4-4dc9-bf20-f0008a8aa6fd', '"alter"');
INSERT INTO a02_tags (id, tag) VALUES ('275052d1-f0ec-4546-be31-4d5afd7ce377', '"add column"');
INSERT INTO a02_title (id, title, body) VALUES ('4f8b06f5-3cc2-4444-a706-cfc3e8f536af', '# Interactive - 45 - alter table to add columns, remove columns
', '# Interactive - 45 - alter table to add columns, remove columns

Using the same table, name_list2 lets add a constraint to the us_state table.


```
ALTER TABLE name_list2
	ADD column state_nick_name text
;

```




');
INSERT INTO a02_title (id, title, body) VALUES ('8d00be8f-6993-4016-b45d-172328a4a5a4', '# Interactive - 46 -  NULL - differences between databases
', '# Interactive - 46 -  NULL - differences between databases

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
SELECT "found" where NULL = NULL;

```

will return 0 rows because NULL is not equal to anything, even itself.

```
SELECT "found" where NULL is NULL;

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



Note: In the Oracle database you use the "nvl" function and a special table with 1 row in it called "dual";



');
INSERT INTO a02_tags (id, tag) VALUES ('21c98eba-5cee-4936-a26f-43a837c7e4f2', '"NULL"');
INSERT INTO a02_title (id, title, body) VALUES ('43d18ed2-5f15-47d1-9038-ccef5f7c9b26', '# Interactive - 47 - NoSQL databases ( mongoDB ) v.s. JSONb in PostreSQL
', '# Interactive - 47 - NoSQL databases ( mongoDB ) v.s. JSONb in PostreSQL

One of the most common alternatives to a SQL database is MongoDB.
Front end developers like MongoDB because everting is in JSON.

There are two reasons why I don"t use MongoDB.

1. Concurrency control is incredibly important.  Google reviewed
its code base and counted the number of defects related to bad 
implementations of custom concurrency control.   The problems
were bad enough that Google banned the use of MongoDB.
2. Everything that can be done in MogoDB can be done just as
fast using JSONb data in PostgreSQL.  Also with PostgreSQL
you get a complete relational database with tables and
indexes and spacial data and...   That other stuff just
get thrown in.

So... Let"s look at how to use JSONb in PostgreSQL.

First let"s create a table.  This is the same as creating a "collection" 
in MongoDB.  The table will use a GIN index to index all of the 
data in the JSON data.

```
drop TABLE if exists test_collection ;

CREATE TABLE test_collection (
	id serial primary key not null,
	data JSONB
);

CREATE INDEX test_collection_gin_1 ON test_collection USING gin (data);

INSERT INTO test_collection ( data ) values	
	( "{"name":"bob"}" )
;

```

PostgreSQL has a slew of operators. 



| Operator | Right Operand Type | Description                                                                                        | Example                                             | Example Result  |
|:--------:|--------------------|----------------------------------------------------------------------------------------------------|-----------------------------------------------------|-----------------|
| `->`     | int                | Get JSON array element (indexed from zero, negative integers count from the end)                   | `"[{"a":"foo"},{"b":"bar"},{"c":"baz"}]"::json->2`  | `{"c":"baz"}`   |
| `->`     | text               | Get JSON object field by key                                                                       | `"{"a": {"b":"foo"}}"::json->"a"`                   | `{"b":"foo"}`   |
| `->>`    | int                | Get JSON array element as text                                                                     | `"[1,2,3]"::json->>2`                               | `3`             |
| `->>`    | text               | Get JSON object field as text                                                                      | `"{"a":1,"b":2}"::json->>"b"`                       | `2`             |
| `#>`     | text[]             | Get JSON object at specified path                                                                  | `"{"a": {"b":{"c": "foo"}}}"::json#>"{a,b}"`        | `{"c": "foo"}`  |
| `#>>`    | text[]             | Get JSON object at specified path as text                                                          | `"{"a":[1,2,3],"b":[4,5,6]}"::json#>>"{a,2}"`       | `3`             |
| `@>`     | JSONb              | Does the left JSON value contain the right JSON path/value entries at the top level?               | `"{"a":1, "b":2}"::JSONb @> "{"b":2}"::JSONb`       |                 |
| `<@`     | JSONb              | Are the left JSON path/value entries contained at the top level within the right JSON value?       | `"{"b":2}"::JSONb <@ "{"a":1, "b":2}"::JSONb`       |                 |
| `?`      | text               | Does the string exist as a top-level key within the JSON value?                                    | `"{"a":1, "b":2}"::JSONb ? "b"`                     |                 |
| `?|`     | text[]             | Do any of these array strings exist as top-level keys?                                             | `"{"a":1, "b":2, "c":3}"::JSONb ?| array["b", "c"]` |                 |
| `?&`     | text[]             | Do all of these array strings exist as top-level keys?                                             | `"["a", "b"]"::JSONb ?& array["a", "b"]`            |                 |
| `||`     | JSONb              | Concatenate two JSONb values into a new JSONb value                                                | `"["a", "b"]"::JSONb || "["c", "d"]"::JSONb`        |                 |
| `-`      | text               | Delete key/value pair or string element from left operand. Key/value pairs are matched based on their key value. | `"{"a": "b"}"::JSONb - "a"`           |                 |
| `-`      | integer            | Delete the array element with specified index (Negative integers count from the end). Throws an error if top level container is not an array. | `"["a", "b"]"::JSONb - 1` |    |
| `#-`     | text[]             | Delete the field or element with specified path (for JSON arrays, negative integers count from the end) | `"["a", {"b":1}]"::JSONb #- "{1,b}"`           |                 |


For example:

```
SELECT * 
	FROM test_collection 
	WHERE data->>"name" = "bob"
;

```

Should return 1 row the name equal to `bob`.


');
INSERT INTO a02_tags (id, tag) VALUES ('a78b8fe8-910c-40dd-98b1-fde772622ce2', '"JSONb"');
INSERT INTO a02_tags (id, tag) VALUES ('fe17fa7d-ef04-431e-b556-c56d0aab3f3d', '"MongoDB"');
INSERT INTO a02_title (id, title, body) VALUES ('7bb98e92-9a7c-4695-8c2d-198024576fd4', '# Interactive - 48 - window functions
', '# Interactive - 48 - window functions

Window functions allow operations of a set of data.  First let"s setup an example.


```

DROP TABLE if exists emp_sal;

CREATE TABLE emp_sal (
	emp_id serial primary key not null,
	dept text not null,
	salary numeric
);

INSERT INTO emp_sal ( dept, emp_id, salary ) values 
	( "Dev"   	,    11 ,   5200 ),
	( "Dev"   	,     7 ,   4200 ),
	( "Dev"   	,     9 ,   4500 ),
	( "Dev"   	,     8 ,   6000 ),
	( "Dev"   	,    10 ,   5200 ),
	( "H.R." 	,     5 ,   3500 ),
	( "H.R." 	,     2 ,   3900 ),
	( "sales"   ,     3 ,   4800 ),
	( "sales"   ,     1 ,   5000 ),
	( "sales"   ,     4 ,   4800 )
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



');
INSERT INTO a02_title (id, title, body) VALUES ('da3062ed-2c4e-4d93-932a-58ebddd44200', '# Interactive - 49 - PostgreSQL database maintenance
', '# Interactive - 49 - PostgreSQL database maintenance

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



');
INSERT INTO a02_tags (id, tag) VALUES ('10c7effc-fb5a-4283-b243-0336acd39304', '"vacuum"');
INSERT INTO a02_tags (id, tag) VALUES ('fcbcda22-0de4-43bb-80ea-ed35a2d0613d', '"analyze"');
INSERT INTO a02_title (id, title, body) VALUES ('12d4ad2a-b7e3-4ce8-ac8b-2a9f46a817fa', '# Interactive - 50 - Geometric Data / PostGIS
', '# Interactive - 50 - Geometric Data / PostGIS

PostgreSQL also has a substantial set of constructs that allow both indexing and data storage of points.
Collectively these base capabilities are built into a very good Geographic Information System, PostGIS.

PostGIS adds all sorts of fun stuff like projections and data for all the counties in the US.

Before using PostGIS you need to understand the basics - like points and lines and that PostgreSQL
can store and search spacial data.


```

xyzzy


```



');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '490a6201-a858-45db-b301-d5133d70ca89');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '5f30bd50-431f-473f-8cbc-b5dc99334ce9');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '03b06e7f-8903-4146-8b06-e47ba1dbff83');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '1a5c40d3-4161-4c04-8356-1f210eed8766');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('62549cfa-4fcd-41a7-b308-f71f99cae39b', '5468e876-3ef8-49d3-a581-9a32a41f745d');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c46570ef-4416-4e0a-ac8f-22b064faf53b', '99d58449-feb3-4e91-9572-c341a9f8e755');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c46570ef-4416-4e0a-ac8f-22b064faf53b', '354ba27c-5077-485c-b9e3-e02b35bc4643');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', '354ba27c-5077-485c-b9e3-e02b35bc4643');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b07ead6e-9cac-4c04-bedd-9cb6db532c3c', '710ad063-59fb-413c-b2ba-3382ca9471c3');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8759960a-5dc5-4664-ba7e-8ab936f80201', '710ad063-59fb-413c-b2ba-3382ca9471c3');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b07ead6e-9cac-4c04-bedd-9cb6db532c3c', '90372fef-269c-497e-a432-593ad0500262');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f5d552d5-fd51-4fb4-aac3-cf5df95298d7', '90372fef-269c-497e-a432-593ad0500262');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f5d552d5-fd51-4fb4-aac3-cf5df95298d7', 'baca31e3-6b14-413f-8f96-94f4d64c4a3b');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8759960a-5dc5-4664-ba7e-8ab936f80201', '93fde3a8-282a-4f4b-9c2d-a58d73d4b287');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8759960a-5dc5-4664-ba7e-8ab936f80201', '79d5cb49-1342-4c5d-9a31-e8050019ee78');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('12904f08-8681-424b-a8bd-bd26dfe2b02d', '79d5cb49-1342-4c5d-9a31-e8050019ee78');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8759960a-5dc5-4664-ba7e-8ab936f80201', '39ad549e-5bb2-4185-a87d-962ebc5c61af');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('12904f08-8681-424b-a8bd-bd26dfe2b02d', '14b397cb-d709-4eb0-a74f-607f9de3ff38');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('12904f08-8681-424b-a8bd-bd26dfe2b02d', 'b4710d30-fc36-4919-9388-59fe6a6e7085');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', '16dbb245-1b55-49d8-b986-a145f3e67599');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', 'b158d74c-4bc0-4f5d-9c83-d5c3330ef184');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', '773c5a9d-1817-4c15-affd-8f4a219c9673');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8fcde808-f283-4298-81b9-ace6c01da402', 'c4c81e4b-2b41-49d2-a8a0-c18714019f07');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7296e800-3827-4ce9-8d8b-14df8ea1af2f', 'a4b73d1d-56ef-4323-aff1-4de45acddbfb');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7296e800-3827-4ce9-8d8b-14df8ea1af2f', '6a6d95c3-5995-4dc4-b22d-b80af4b112f6');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7296e800-3827-4ce9-8d8b-14df8ea1af2f', 'f951fd52-4b34-491e-bf5e-205295e41c45');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7296e800-3827-4ce9-8d8b-14df8ea1af2f', '34797c1a-2d8c-4510-a106-5787cc4e44d7');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('ace63caf-9787-4589-bbdf-2653724ba787', 'bf1df0b0-46ab-4b8d-a7d6-2ec4f0c5c7a6');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('ace63caf-9787-4589-bbdf-2653724ba787', '94c65de4-83a8-471c-9cbc-a6c63f901381');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('ace63caf-9787-4589-bbdf-2653724ba787', '24d48846-e257-4f5a-8e04-fcbc4b72f73a');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b62591f1-995a-482e-8695-59ff8aa8d375', 'a0e7fec3-7a11-4199-81ce-5031c7d1e1a8');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('d9990d48-9e0b-410d-9e15-0cc34ac2fcb9', 'a0e7fec3-7a11-4199-81ce-5031c7d1e1a8');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('d9990d48-9e0b-410d-9e15-0cc34ac2fcb9', '7a188230-7e8a-4cfa-a43b-b46a4f6cb338');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('d9990d48-9e0b-410d-9e15-0cc34ac2fcb9', 'bdda229c-fc44-473a-a085-ce06217870e3');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', '46100bd3-f3fd-4a51-827d-6eacdc12ce05');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', 'bb732104-26d5-493a-92f5-ae0c4abeb5fd');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', 'd83fc4ef-fdd8-45f9-9b37-7575420470b4');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', 'c060b6db-929a-4e7b-956b-03b2d13ef1ad');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', 'c060b6db-929a-4e7b-956b-03b2d13ef1ad');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e5a2b30b-91ef-490a-951a-281f3ac11df9', '9507196b-de21-45d3-a318-4a4f28176436');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4df809b9-8659-41b3-ac5c-6ecc642a1d41', 'cd692878-2cd5-4886-a3c4-d0fe99884072');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4df809b9-8659-41b3-ac5c-6ecc642a1d41', '018ccc80-00cd-4c98-ae0a-5a883c151030');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c2d1bc86-6aac-4e85-9d03-ed0ec5464111', '018ccc80-00cd-4c98-ae0a-5a883c151030');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('15b5fda8-17c5-44c7-bc13-f6f397ee9462', 'eb4833fe-66dc-4f00-be02-2ed60e86fd28');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', 'a22361f2-304d-47aa-b465-1e841f76d712');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', '29a1da8c-c341-476e-bbc7-2a87cb5fbea2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('3ea3bacb-e945-4dab-a30d-99561dbbb648', '29a1da8c-c341-476e-bbc7-2a87cb5fbea2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', '8a79ed2a-74e0-4ab1-82fd-03e2cefb6446');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('3ea3bacb-e945-4dab-a30d-99561dbbb648', '8a79ed2a-74e0-4ab1-82fd-03e2cefb6446');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', 'ee7a0190-1ec7-4914-a3be-e1d325c846a0');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('3ea3bacb-e945-4dab-a30d-99561dbbb648', 'ee7a0190-1ec7-4914-a3be-e1d325c846a0');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', '7c5f67ca-4c8c-407a-a80c-cb994e76cd2e');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('f23bff4e-c930-48ef-a4ab-bc2c91c9b593', 'ca7d3368-1d8c-4cb3-b2a1-5e9506585c04');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('79bf3bb8-0e98-4244-883e-2687d4b9e6d0', 'c99b8f92-e585-4c3e-a073-8da7b330a316');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('79bf3bb8-0e98-4244-883e-2687d4b9e6d0', '435ce75d-81c6-479a-bf28-96d0deccff74');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('79bf3bb8-0e98-4244-883e-2687d4b9e6d0', 'a9a57f08-5b68-4f87-8359-74dbffb6f4d6');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('3a935ab9-e899-4f27-bf74-857c99c7963f', '5e41e105-b96c-436f-9c71-c57316168c1d');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('3a935ab9-e899-4f27-bf74-857c99c7963f', 'e190abff-cce1-412e-9b08-365b90c36546');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4eec7dee-9c15-42bb-a2e7-2fbff62f60f3', '661cdcae-66f0-48b4-aa82-b15af9ca5591');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4eec7dee-9c15-42bb-a2e7-2fbff62f60f3', 'ba1b8c9f-e0f6-4692-bcdd-cacb656142f9');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e439f21d-6a81-46d2-b101-5c932b857741', 'ba1b8c9f-e0f6-4692-bcdd-cacb656142f9');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('e439f21d-6a81-46d2-b101-5c932b857741', '68ca995a-40db-4969-9845-7b73539dee43');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('aa573a06-a932-4ec3-a6ad-77a2ccbfd37d', '8d9c0508-570e-4b55-b027-3b2a45de5e20');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c94a4e16-ebb9-47ed-b84d-2936e8c7be32', '23f9350f-ab9d-4f36-baf1-55b61088dff6');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c94a4e16-ebb9-47ed-b84d-2936e8c7be32', '911d8f3a-8342-4f6c-94b1-6ece842b467b');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('fa98049b-a18a-4652-8aaf-be0b0aece4cd', 'e8939fc9-abab-4c7a-8568-1072ac99ecb1');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('fa98049b-a18a-4652-8aaf-be0b0aece4cd', 'f09539a5-c05b-4e2f-9313-7ff375b4d225');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7183cffc-7a10-4305-aea5-445a3060d34a', '6ead8988-ff46-4f8b-a2bd-66cbf4f30705');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7183cffc-7a10-4305-aea5-445a3060d34a', '72086ba2-0400-4a3a-81e4-f662f03d6f24');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7183cffc-7a10-4305-aea5-445a3060d34a', 'e13e235e-0654-446e-945b-94bb942dee72');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c2d1bc86-6aac-4e85-9d03-ed0ec5464111', '8691a92b-8b0e-4c7b-bae1-f4bd64b99b4c');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'e7a63d2f-07a6-4c5a-a897-6240d01777a5');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'bee1a76c-bb67-4866-8f92-ce95567c0821');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', '124a8835-233e-4c96-b605-408459094c0d');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'ab5b72dc-d79e-4f59-9cba-9cd1caef5058');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'c2b7be39-5979-48aa-b9cd-d39789fb00a9');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'a7cf66d8-5da2-40e4-8a04-cb5cadff824f');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', 'cace60cd-b594-4cff-b272-dbc4ab8d34e3');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('04099a40-729d-4ef9-b6d2-4573997a1bf9', '2ac1540e-f6cc-4c47-8442-a6b3960d4748');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('690c600a-a338-4ce9-9557-9e7db1fcfd9e', '43ef1ce7-e756-460d-a8bd-76a9d9c5dfbb');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('690c600a-a338-4ce9-9557-9e7db1fcfd9e', '2304c671-8946-4fd1-b041-2a65a476b385');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('690c600a-a338-4ce9-9557-9e7db1fcfd9e', 'ef344893-7c17-4222-8b7b-e2f6d97b4bcf');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('690c600a-a338-4ce9-9557-9e7db1fcfd9e', 'c611e87b-1aed-4dce-8843-25b76f8e1945');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8532013a-f2ba-4b05-8c2e-f3067d4adfe8', 'd34ad4b9-dde2-4408-8e0b-58c9cef4dd96');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8532013a-f2ba-4b05-8c2e-f3067d4adfe8', '89e05cdd-4740-4773-b67c-3c488f914fa8');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('475b796e-fa1c-4950-abb3-facdfaabc630', '1f75be4f-2c42-4fad-bf48-0ee8ce23220b');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('475b796e-fa1c-4950-abb3-facdfaabc630', 'de751871-f900-47d4-b3cb-4a98d66737a7');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('475b796e-fa1c-4950-abb3-facdfaabc630', 'edfcd286-c168-4d80-8fb0-323546f65175');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('475b796e-fa1c-4950-abb3-facdfaabc630', '456be832-bc6b-4a57-b20a-836884e82031');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('764f5a9a-fa2a-44e3-9089-809ad406a4d4', '78c8dedf-6d59-408c-b9dd-623b0e46069b');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('764f5a9a-fa2a-44e3-9089-809ad406a4d4', '9d4280ed-72ba-492d-b0ac-f1b252d4f260');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b2e19f08-be87-4c6b-8150-fe23a31ef873', '26005ad5-c639-468b-91e8-031b6b3eed1b');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b2e19f08-be87-4c6b-8150-fe23a31ef873', '6252310a-1a38-44be-8a72-2106037d0bf2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b2e19f08-be87-4c6b-8150-fe23a31ef873', 'dbdb1cb8-11fc-48ba-82c8-6ca3e53e1771');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('9da753ac-0f3f-466f-b65e-cc22d897eb28', 'dbdb1cb8-11fc-48ba-82c8-6ca3e53e1771');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b2e19f08-be87-4c6b-8150-fe23a31ef873', '3f963c54-1c27-4692-951f-66ad44387cee');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('9da753ac-0f3f-466f-b65e-cc22d897eb28', '93b838a5-12ff-49f7-92c7-82f57e62702f');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('9da753ac-0f3f-466f-b65e-cc22d897eb28', '83e3f2b2-1cba-4382-975c-a7494dc3a66e');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2037bea2-643a-47c0-a091-5cb4439ebdf2', '6c7cfebb-0108-4eca-8b6e-79a181a03fd5');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2037bea2-643a-47c0-a091-5cb4439ebdf2', 'fb6dabc0-11ec-42b8-aab0-cc107bb7093a');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2037bea2-643a-47c0-a091-5cb4439ebdf2', '302f0491-d964-4e95-90d8-6bd5f6bc2579');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b1e30da6-7b83-41fd-be04-c48f641bd153', '8913463a-a29e-443b-bae9-963edabba3ce');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('b1e30da6-7b83-41fd-be04-c48f641bd153', 'f94c2cb1-e689-46a5-b45c-89196aa9e0a6');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('1c1951a9-bf9c-493d-b6aa-6cfde4cb6d0d', 'cd52c492-fc3d-44dd-9bb7-78780c368825');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('1c1951a9-bf9c-493d-b6aa-6cfde4cb6d0d', '42d7a290-9950-42ec-87d8-0df438fdb921');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('1c1951a9-bf9c-493d-b6aa-6cfde4cb6d0d', 'fbfc305e-a8e1-407e-9b4c-4a6d67f45e60');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('90f148ff-b58e-4cb0-978e-5e146a45a3b1', '5205b067-9829-4d31-85ed-28e70f866c90');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('90f148ff-b58e-4cb0-978e-5e146a45a3b1', 'b7a9d69a-9596-4338-bd55-3390cf00e535');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('90f148ff-b58e-4cb0-978e-5e146a45a3b1', '42ec4492-738b-4c60-a5b1-72222799a051');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('cd45a38d-2ebb-46ed-b93a-cc3626581ae0', '7ba3812b-51b6-42a2-8327-d057b9d77760');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('cd45a38d-2ebb-46ed-b93a-cc3626581ae0', 'da1a0503-00bb-46fb-a96b-0af9fcc6cf01');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('cd45a38d-2ebb-46ed-b93a-cc3626581ae0', '507267d7-2097-488a-8b60-cd52f9113fac');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('c0970bd0-dcc3-4d5a-8cee-e4e4e39072bf', '3ac7c99d-6afb-46bd-b451-fbcddc5f7b48');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('d25401fd-2ec8-41b3-adde-819be7943a33', '3ac7c99d-6afb-46bd-b451-fbcddc5f7b48');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('a427fa20-2403-47f7-8beb-af05a3318ab1', 'f4da3421-d40f-42da-a81d-cc07245dd395');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('a427fa20-2403-47f7-8beb-af05a3318ab1', '47870d40-c660-4b64-9c07-26b32e59da30');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2189012c-e0eb-4959-8d33-9e25ef1c6898', '3ccd9aad-ea9f-4ca1-8ef7-fb1dd972c344');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2189012c-e0eb-4959-8d33-9e25ef1c6898', 'd8eef215-f345-48a2-b87c-4cec636b6df2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2189012c-e0eb-4959-8d33-9e25ef1c6898', '5dbc7563-8eb1-43fc-8f7f-45a71912b112');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('2189012c-e0eb-4959-8d33-9e25ef1c6898', '1f7e0177-9d68-40ed-9af6-c9d3d71edd8c');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('0f59130c-a293-4046-b74f-8c8f59bcffdf', '83bb34f0-3bd8-4bf8-844f-fbc64df951c5');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('0f59130c-a293-4046-b74f-8c8f59bcffdf', '5ce5df38-1aea-40c6-ad80-03ca459a9bf9');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('0f59130c-a293-4046-b74f-8c8f59bcffdf', 'c9092a6f-bbf4-414e-b14b-a0369dbc43db');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('86062a74-f4c1-40f4-9929-a26811513a7d', '0581ff4f-f5e4-4dc9-bf20-f0008a8aa6fd');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4f8b06f5-3cc2-4444-a706-cfc3e8f536af', '0581ff4f-f5e4-4dc9-bf20-f0008a8aa6fd');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7bb98e92-9a7c-4695-8c2d-198024576fd4', '0581ff4f-f5e4-4dc9-bf20-f0008a8aa6fd');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('86062a74-f4c1-40f4-9929-a26811513a7d', '275052d1-f0ec-4546-be31-4d5afd7ce377');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('4f8b06f5-3cc2-4444-a706-cfc3e8f536af', '275052d1-f0ec-4546-be31-4d5afd7ce377');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('7bb98e92-9a7c-4695-8c2d-198024576fd4', '275052d1-f0ec-4546-be31-4d5afd7ce377');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('8d00be8f-6993-4016-b45d-172328a4a5a4', '21c98eba-5cee-4936-a26f-43a837c7e4f2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('43d18ed2-5f15-47d1-9038-ccef5f7c9b26', 'a78b8fe8-910c-40dd-98b1-fde772622ce2');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('43d18ed2-5f15-47d1-9038-ccef5f7c9b26', 'fe17fa7d-ef04-431e-b556-c56d0aab3f3d');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('da3062ed-2c4e-4d93-932a-58ebddd44200', '10c7effc-fb5a-4283-b243-0336acd39304');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('12d4ad2a-b7e3-4ce8-ac8b-2a9f46a817fa', '10c7effc-fb5a-4283-b243-0336acd39304');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('da3062ed-2c4e-4d93-932a-58ebddd44200', 'fcbcda22-0de4-43bb-80ea-ed35a2d0613d');
INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('12d4ad2a-b7e3-4ce8-ac8b-2a9f46a817fa', 'fcbcda22-0de4-43bb-80ea-ed35a2d0613d');

