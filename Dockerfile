FROM osixia/openldap:1.5.0

ENV LDAP_ORGANISATION=MyCompany
ENV LDAP_DOMAIN=mycompany.org
ENV LDAP_ADMIN_PASSWORD=admin

COPY bootstrap /container/service/slapd/assets/config/bootstrap/ldif/custom
