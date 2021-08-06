DROP VIEW IF EXISTS i_issue_st_sv;

CREATE VIEW i_issue_st_sv AS
    SELECT
        iss.*,
        sev.severity,
        sta.state
    FROM i_issue iss
    JOIN i_state sta ON iss.state_id=sta.id
    JOIN i_severity sev ON iss.severity_id=sev.id
ORDER BY iss.severity_id DESC, iss.updated DESC, iss.created DESC;
