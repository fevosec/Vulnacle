alter session set container=XEPDB1;

create user vuln08 identified by vuln08;

grant connect, resource to vuln08;

grant execute on dbms_advisor to vuln08;

grant create any directory to vuln08;
grant advisor to vuln08;

