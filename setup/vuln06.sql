alter session set container=XEPDB1;

create user vuln06 identified by vuln06;

alter user vuln06 quota unlimited on users;

grant connect, resource to vuln06;

grant TEXT DATASTORE ACCESS to VULN06;

