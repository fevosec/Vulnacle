lter session set container=XEPDB1;
create user vuln04 identified by vuln04;
grant connect, resource to vuln04;

grant execute on UTL_HTTP to vuln04;
grant execute on UTL_TCP to vuln04;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl=>'vuln04acl.xml',
  description=>'access control list example',
  principal=>'VULN04',
  is_grant=>TRUE,
   privilege=>'connect');
  commit;
  end;
/

begin
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
  acl=>'vuln04acl.xml',host=>'*'); 
  commit;
end;
/


