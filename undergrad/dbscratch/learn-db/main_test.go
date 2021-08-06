package main

// Copyright (C) Philip Schlump 2016.
// MIT Licensed
// Source pulled from PureImagination Demo Server

import (
	"testing"

	"github.com/pschlump/godebug"
)

/*
// Test all of the functions in the main program

func Test_BulkLoad(t *testing.T) {
	// t.Fatal("not implemented")
	// mux.Handle("/api/v2/bulk-load", http.HandlerFunc(HandleBulkLoadQR)).Method("GET", "POST").AuthRequired().NoDoc() // xyzzy - imlement.

	Cli := "/api/v2/bulk-load"

	www := CliResponseWriter.NewCliResonseWriter() // www := http.ResponseWriter
	/ *
	   type url.URL struct {
	   	Scheme     string
	   	Opaque     string    // encoded opaque data
	   	User       *Userinfo // username and password information
	   	Host       string    // host or host:port
	   	Path       string    // path (relative paths may omit leading slash)
	   	RawPath    string    // encoded path hint (see EscapedPath method)
	   	ForceQuery bool      // append a query ('?') even if RawQuery is empty
	   	RawQuery   string    // encoded query values, without '?'
	   	Fragment   string    // fragment for references, without '#'
	   }
	   // From: https://golang.org/src/net/url/url.go?s=9736:10252#L353 :363
	* /
	// qryParam := GetVar.GenQryFromCli()
	qryParam := "user_id=xyzzy"

	u := url.URL{
		User:     nil,
		Host:     "127.0.0.1:80",
		Path:     Cli,
		RawQuery: qryParam,
	}
	req := &http.Request{ // https://golang.org/src/net/http/request.go:113
		Method:     "GET",
		URL:        &u, // *url.URL
		Proto:      "HTTP/1.0",
		ProtoMajor: 1,
		ProtoMinor: 0,
		Header:     make(http.Header),
		// Body io.ReadCloser // :182 -- not used, GET request - no body.
		// Form url.Values -- Populate with values from CLI
		Host:       "127.0.0.1:80",
		RequestURI: Cli + "?" + qryParam, // "RequestURI": "/api/v1/status?id=dump-request",
	}
	HandleBulkLoadQR(www, req)
}
*/

// func SplitIntStmt(stmt string) (rv []string) {
func Test_SplitIntoStmt(t *testing.T) {
	tests := []struct {
		strIn    string
		expected []string
	}{
		{
			strIn: `
drop table abc;
create table abc ( n int );   
select 12 from abc;  
`,
			expected: []string{
				"drop table abc",
				"create table abc ( n int )",
				"select 12 from abc",
			},
		},
		{
			strIn: `

-- commet 1

drop TABLE if exists "t_ymux_auth_token" ; -- comment 2
drop TABLE if exists "t_ymu'_auth_token" ; -- comment 3
drop TABLE if exists "t_ymu""_auth_token" ; -- comment 4

`,
			expected: []string{
				`drop TABLE if exists "t_ymux_auth_token"`,
				`drop TABLE if exists "t_ymu'_auth_token"`,
				`drop TABLE if exists "t_ymu""_auth_token"`,
			},
		},
		{
			strIn: `

---- ya ya ya

drop TABLE if exists "t_ymux_auth_token" ;
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
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER t_ymux_auth_token_trig
BEFORE update ON "t_ymux_auth_token"
FOR EACH ROW
EXECUTE PROCEDURE t_ymux_auth_token_upd();

`,
			expected: []string{
				"drop TABLE if exists \"t_ymux_auth_token\"",
				`CREATE TABLE "t_ymux_auth_token" (
	  "id"					uuid DEFAULT uuid_generate_v4() not null primary key
	, "user_id"				uuid not null
	, "updated" 			timestamp
	, "created" 			timestamp default current_timestamp not null
)`,
				`create index "t_ymux_auth_token_p1" on "t_ymux_auth_token" ( "user_id" )`,
				`create index "t_ymux_auth_token_p2" on "t_ymux_auth_token" ( "created" )`,

				`ALTER TABLE "t_ymux_auth_token"
	ADD CONSTRAINT "t_ymux_auth_token_user_id_fk1"
	FOREIGN KEY ("user_id")
	REFERENCES "t_ymux_user" ("id")`,
				`CREATE OR REPLACE function t_ymux_auth_token_upd()
RETURNS trigger AS $$
BEGIN
	NEW.updated := current_timestamp;
	RETURN NEW;
END
$$ LANGUAGE 'plpgsql'`,
				`CREATE TRIGGER t_ymux_auth_token_trig
BEFORE update ON "t_ymux_auth_token"
FOR EACH ROW
EXECUTE PROCEDURE t_ymux_auth_token_upd()`,
			},
		},
	}

	for ii, test := range tests {
		rv := SplitIntoStmt(test.strIn)
		if len(rv) != len(test.expected) {
			t.Errorf("Test %d Length Mismatch: Exptect(%d) %s\n Got(%d) %s\n", ii, len(test.expected), godebug.SVarI(test.expected), len(rv), godebug.SVarI(rv))
		} else {
			for jj := 0; jj < len(test.expected); jj++ {
				if test.expected[jj] != rv[jj] {
					t.Errorf("Test %d Mismatch at %d: Exptect %s\nGot      %s\n", ii, jj, godebug.SVarI(test.expected), godebug.SVarI(rv))
				}
			}
		}
	}
}

// func IsSelect(stmt string) (rv bool) {
func Test_IsSelect(t *testing.T) {
	tests := []struct {
		strIn    string
		expected bool
	}{
		{
			strIn:    "drop table abc",
			expected: false,
		},
		{
			strIn:    "create table abc ( n int )",
			expected: false,
		},
		{
			strIn:    "select 12 from abc;",
			expected: true,
		},
		{
			strIn:    " select 12 from abc; ",
			expected: true,
		},
		// with
		{
			strIn:    "with select 12 from abc as p1 select * from p1;",
			expected: true,
		},
		// explain
		{
			strIn:    "explain with select 12 from abc as p1 select * from p1;",
			expected: true,
		},
	}

	for ii, test := range tests {
		rv := IsSelect(test.strIn)
		if rv != test.expected {
			t.Errorf("Test %d Mismatch: Exptect %v got %v\n", ii, test.expected, rv)
		}
	}
}
