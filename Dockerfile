FROM osixia/openldap:1.5.0

COPY bootstrap/users.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif

ENV LDAP_ORGANISATION="My Company"
ENV LDAP_DOMAIN="mycompany.org"
ENV LDAP_ADMIN_PASSWORD="admin"

EXPOSE 389
