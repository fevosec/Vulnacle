alter session set container=XEPDB1;

create user vuln1 identified by vuln1;

grant connect, resource to vuln1;
grant create any directory to vuln1;
grant delete any directory to vuln1;

