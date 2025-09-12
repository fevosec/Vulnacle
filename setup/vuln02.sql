ALTER SESSION SET CONTAINER = XEPDB1;

CREATE USER vuln02 
IDENTIFIED BY vuln02
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE, CREATE PROCEDURE TO vuln02;

BEGIN
  DBMS_JAVA.grant_permission(
    'VULN02', 
    'java.io.FilePermission', 
    '<<ALL FILES>>', 
    'read,write,execute,delete'
  );

  DBMS_JAVA.grant_permission(
    'VULN02', 
    'SYS:java.lang.RuntimePermission', 
    'writeFileDescriptor', 
    ''
  );

  DBMS_JAVA.grant_permission(
    'VULN02', 
    'SYS:java.lang.RuntimePermission', 
    'readFileDescriptor', 
    ''
  );
END;
/
