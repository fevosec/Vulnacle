alter session set container=XEPDB1;

create user vuln01 identified by vuln01;

grant connect, resource to vuln01;
grant create any directory to vuln01;
grant drop any directory to vuln01;

