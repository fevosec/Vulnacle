alter session set container=XEPDB1;

create role MAINTENANCE;
grant DBA to MAINTENANCE;

create user vuln05 identified by vuln05;

grant CONNECT, RESOURCE, MAINTENANCE to vuln05;

