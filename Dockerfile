FROM osixia/openldap:1.5.0

ENV LDAP_ORGANISATION="MyCompany" \
    LDAP_DOMAIN="mycompany.org" \
    LDAP_ADMIN_PASSWORD="admin"

COPY bootstrap/users.ldif /container/service/slapd/assets/config/bootstrap/ldif/custom/users.ldif
