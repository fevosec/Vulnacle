alter session set container=XEPDB1;
create user vuln03 identified by vuln03;

grant connect, resource to vuln03;
grant execute on DBMS_SCHEDULER to vuln03;
grant create job to vuln03;
grant create external job to vuln03;

