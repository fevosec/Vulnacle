alter session set container=XEPDB1;

create user vuln07 identified by vuln07;

grant connect, resource to vuln07;

CREATE OR REPLACE DIRECTORY vuln07_dir AS '/etc';
GRANT READ, WRITE ON DIRECTORY vuln07_dir TO vuln07;
GRANT EXECUTE ON DBMS_XSLPROCESSOR TO vuln07;
