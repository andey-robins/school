package main

// Copyright (C) Philip Schlump 2015-2018.
// MIT Licensed
// Source pulled from PureImagination Demo Server

//
// DO NOT EDIT THIS FILE
// This file is automatically generated from the Makefile
//
// make ValidateTables.go
//
// or:
//
// make gen
//

import (
	"fmt"
	"os"

	"gitlab.com/pschlump/PureImaginationServer/ymux"
)

// ValidateTablesDDL is the fuction that is called to validate the tables and stored procedures.
// it returns a list of tables that validated.
func ValidateTablesDDL(exitOnError ...bool) (good, bad []string) {
	var err error

	// Table: t_output
	/* {
		"created": true,
		"msg": true,
		"output": true,
		"seq": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_output",
		Columns: []ymux.PGColumn{
			{ColumnName: "seq"},
			{ColumnName: "msg"},
			{ColumnName: "output"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_output")
	} else {
		good = append(good, "t_output")
	}

	// Table: t_ymux_2fa
	/* {
		"created": true,
		"device_desc": true,
		"id": true,
		"last_used": true,
		"updated": true,
		"user_hash": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_2fa",
		Columns: []ymux.PGColumn{
			{ColumnName: "user_id"},
			{ColumnName: "user_hash"},
			{ColumnName: "device_desc"},
			{ColumnName: "last_used"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "id"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_2fa")
	} else {
		good = append(good, "t_ymux_2fa")
	}

	// Table: t_ymux_2fa_dev_otk
	/* {
		"created": true,
		"id": true,
		"one_time_key": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_2fa_dev_otk",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "user_id"},
			{ColumnName: "one_time_key"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_2fa_dev_otk")
	} else {
		good = append(good, "t_ymux_2fa_dev_otk")
	}

	// Table: t_ymux_2fa_otk
	/* {
		"created": true,
		"id": true,
		"one_time_key": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_2fa_otk",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "user_id"},
			{ColumnName: "one_time_key"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_2fa_otk")
	} else {
		good = append(good, "t_ymux_2fa_otk")
	}

	// Table: t_ymux_auth_token
	/* {
		"created": true,
		"id": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_auth_token",
		Columns: []ymux.PGColumn{
			{ColumnName: "user_id"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "id"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_auth_token")
	} else {
		good = append(good, "t_ymux_auth_token")
	}

	// Table: t_ymux_config
	/* {
		"b_value": true,
		"created": true,
		"i_value": true,
		"id": true,
		"name": true,
		"realm": true,
		"ty": true,
		"updated": true,
		"value": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_config",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "created"},
			{ColumnName: "b_value"},
			{ColumnName: "updated"},
			{ColumnName: "realm"},
			{ColumnName: "name"},
			{ColumnName: "ty"},
			{ColumnName: "value"},
			{ColumnName: "i_value"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_config")
	} else {
		good = append(good, "t_ymux_config")
	}

	// Table: t_ymux_documents
	/* {
		"blockerr": true,
		"blockhash": true,
		"blockno": true,
		"created": true,
		"document_file_name": true,
		"document_hash": true,
		"ethstatus": true,
		"file_name": true,
		"hash": true,
		"id": true,
		"note": true,
		"orig_file_extension": true,
		"orig_file_name": true,
		"signature": true,
		"txid": true,
		"updated": true,
		"url_file_name": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_documents",
		Columns: []ymux.PGColumn{
			{ColumnName: "hash"},
			{ColumnName: "blockhash"},
			{ColumnName: "id"},
			{ColumnName: "document_file_name"},
			{ColumnName: "orig_file_extension"},
			{ColumnName: "txid"},
			{ColumnName: "blockno"},
			{ColumnName: "blockerr"},
			{ColumnName: "note"},
			{ColumnName: "updated"},
			{ColumnName: "user_id"},
			{ColumnName: "file_name"},
			{ColumnName: "orig_file_name"},
			{ColumnName: "signature"},
			{ColumnName: "created"},
			{ColumnName: "document_hash"},
			{ColumnName: "url_file_name"},
			{ColumnName: "ethstatus"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_documents")
	} else {
		good = append(good, "t_ymux_documents")
	}

	// Table: t_ymux_origin_ok
	/* {
		"origin": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_origin_ok",
		Columns: []ymux.PGColumn{
			{ColumnName: "origin"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_origin_ok")
	} else {
		good = append(good, "t_ymux_origin_ok")
	}

	// Table: t_ymux_priv
	/* {
		"created": true,
		"desc": true,
		"id": true,
		"priv_name": true,
		"updated": true,
		"visible": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_priv",
		Columns: []ymux.PGColumn{
			{ColumnName: "created"},
			{ColumnName: "id"},
			{ColumnName: "priv_name"},
			{ColumnName: "desc"},
			{ColumnName: "visible"},
			{ColumnName: "updated"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_priv")
	} else {
		good = append(good, "t_ymux_priv")
	}

	// Table: t_ymux_registration_token
	/* {
		"created": true,
		"id": true,
		"token": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_registration_token",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "user_id"},
			{ColumnName: "token"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_registration_token")
	} else {
		good = append(good, "t_ymux_registration_token")
	}

	// Table: t_ymux_role
	/* {
		"created": true,
		"id": true,
		"is_template": true,
		"role_name": true,
		"updated": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_role",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "role_name"},
			{ColumnName: "is_template"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_role")
	} else {
		good = append(good, "t_ymux_role")
	}

	// Table: t_ymux_role_priv
	/* {
		"created": true,
		"id": true,
		"priv_id": true,
		"role_id": true,
		"updated": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_role_priv",
		Columns: []ymux.PGColumn{
			{ColumnName: "id"},
			{ColumnName: "role_id"},
			{ColumnName: "priv_id"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_role_priv")
	} else {
		good = append(good, "t_ymux_role_priv")
	}

	// Table: t_ymux_user
	/* {
		"acct_expire": true,
		"acct_type": true,
		"auth_token": true,
		"config": true,
		"created": true,
		"default_image": true,
		"default_title": true,
		"email": true,
		"email_confirmed": true,
		"enc_email_hash": true,
		"enc_user_hash": true,
		"id": true,
		"key_salt": true,
		"org_user_id": true,
		"parent_user_id": true,
		"password": true,
		"real_name": true,
		"realm": true,
		"recovery_expire": true,
		"recovery_token": true,
		"rfc_6238_secret": true,
		"roles_privs": true,
		"salt": true,
		"setup_2fa_complete": true,
		"setup_2fa_token": true,
		"updated": true,
		"user_role": true,
		"userinfo": true,
		"username": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_user",
		Columns: []ymux.PGColumn{
			{ColumnName: "userinfo"},
			{ColumnName: "recovery_expire"},
			{ColumnName: "created"},
			{ColumnName: "password"},
			{ColumnName: "acct_type"},
			{ColumnName: "parent_user_id"},
			{ColumnName: "auth_token"},
			{ColumnName: "updated"},
			{ColumnName: "setup_2fa_complete"},
			{ColumnName: "realm"},
			{ColumnName: "default_title"},
			{ColumnName: "acct_expire"},
			{ColumnName: "enc_user_hash"},
			{ColumnName: "salt"},
			{ColumnName: "default_image"},
			{ColumnName: "id"},
			{ColumnName: "email_confirmed"},
			{ColumnName: "org_user_id"},
			{ColumnName: "email"},
			{ColumnName: "real_name"},
			{ColumnName: "rfc_6238_secret"},
			{ColumnName: "recovery_token"},
			{ColumnName: "user_role"},
			{ColumnName: "enc_email_hash"},
			{ColumnName: "setup_2fa_token"},
			{ColumnName: "roles_privs"},
			{ColumnName: "config"},
			{ColumnName: "key_salt"},
			{ColumnName: "username"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_user")
	} else {
		good = append(good, "t_ymux_user")
	}

	// Table: t_ymux_user_log
	/* {
		"activity_name": true,
		"created": true,
		"id": true,
		"seq": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "t_ymux_user_log",
		Columns: []ymux.PGColumn{
			{ColumnName: "activity_name"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "id"},
			{ColumnName: "user_id"},
			{ColumnName: "seq"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "t_ymux_user_log")
	} else {
		good = append(good, "t_ymux_user_log")
	}

	// Table: ct_homework
	/* {
		"homework_id": true,
		"homework_no": true,
		"homework_title": true,
		"lesson_body": true,
		"points_avail": true,
		"video_img": true,
		"video_url": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_homework",
		Columns: []ymux.PGColumn{
			{ColumnName: "lesson_body"},
			{ColumnName: "homework_id"},
			{ColumnName: "homework_title"},
			{ColumnName: "homework_no"},
			{ColumnName: "points_avail"},
			{ColumnName: "video_url"},
			{ColumnName: "video_img"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_homework")
	} else {
		good = append(good, "ct_homework")
	}

	// Table: ct_login
	/* {
		"class_no": true,
		"lang_to_use": true,
		"misc": true,
		"pg_acct": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_login",
		Columns: []ymux.PGColumn{
			{ColumnName: "user_id"},
			{ColumnName: "pg_acct"},
			{ColumnName: "class_no"},
			{ColumnName: "lang_to_use"},
			{ColumnName: "misc"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_login")
	} else {
		good = append(good, "ct_login")
	}

	// Table: ct_homework_seen
	/* {
		"created": true,
		"homework_id": true,
		"homework_no": true,
		"id": true,
		"updated": true,
		"user_id": true,
		"watch_count": true,
		"when_seen": true,
		"when_start": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_homework_seen",
		Columns: []ymux.PGColumn{
			{ColumnName: "homework_no"},
			{ColumnName: "user_id"},
			{ColumnName: "when_seen"},
			{ColumnName: "watch_count"},
			{ColumnName: "when_start"},
			{ColumnName: "id"},
			{ColumnName: "homework_id"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_homework_seen")
	} else {
		good = append(good, "ct_homework_seen")
	}

	// Table: ct_homework_grade
	/* {
		"created": true,
		"homework_id": true,
		"homework_no": true,
		"pass": true,
		"pts": true,
		"tries": true,
		"updated": true,
		"user_id": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_homework_grade",
		Columns: []ymux.PGColumn{
			{ColumnName: "homework_id"},
			{ColumnName: "tries"},
			{ColumnName: "pass"},
			{ColumnName: "pts"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "homework_no"},
			{ColumnName: "user_id"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_homework_grade")
	} else {
		good = append(good, "ct_homework_grade")
	}

	// Table: ct_homework_list
	/* {
		"code": true,
		"created": true,
		"lesson_id": true,
		"pass": true,
		"updated": true,
		"user_id": true,
		"when_test": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_homework_list",
		Columns: []ymux.PGColumn{
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "user_id"},
			{ColumnName: "lesson_id"},
			{ColumnName: "when_test"},
			{ColumnName: "code"},
			{ColumnName: "pass"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_homework_list")
	} else {
		good = append(good, "ct_homework_list")
	}

	// Table: ct_homework_validation
	/* {
		"created": true,
		"id": true,
		"lesson_id": true,
		"qdata": true,
		"seq": true,
		"updated": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_homework_validation",
		Columns: []ymux.PGColumn{
			{ColumnName: "updated"},
			{ColumnName: "created"},
			{ColumnName: "id"},
			{ColumnName: "lesson_id"},
			{ColumnName: "seq"},
			{ColumnName: "qdata"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_homework_validation")
	} else {
		good = append(good, "ct_homework_validation")
	}

	// Table: ct_file_list
	/* {
		"created": true,
		"file_list_id": true,
		"file_name": true,
		"homework_no": true,
		"updated": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_file_list",
		Columns: []ymux.PGColumn{
			{ColumnName: "created"},
			{ColumnName: "file_list_id"},
			{ColumnName: "homework_no"},
			{ColumnName: "file_name"},
			{ColumnName: "updated"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_file_list")
	} else {
		good = append(good, "ct_file_list")
	}

	// Table: ct_val_homework
	/* {
		"created": true,
		"homework_no": true,
		"updated": true,
		"val_data": true,
		"val_id": true,
		"val_type": true
	} */

	err = ymux.PGCheckTableColumns(ymux.PGTable{
		TableName: "ct_val_homework",
		Columns: []ymux.PGColumn{
			{ColumnName: "val_id"},
			{ColumnName: "homework_no"},
			{ColumnName: "val_type"},
			{ColumnName: "val_data"},
			{ColumnName: "updated"},
			{ColumnName: "created"},
		},
	})
	if err != nil {
		fmt.Fprintf(os.Stderr, "Missing %s - PG not setup correctly.  Table missing column or missing.\n", err)
		bad = append(bad, "ct_val_homework")
	} else {
		good = append(good, "ct_val_homework")
	}

	if len(exitOnError) > 0 {
		if exitOnError[0] == true {
			if len(bad) > 0 {
				os.Exit(1)
			}
		}
	} else {
		if len(bad) > 0 {
			os.Exit(1)
		}
	}
	return
}