FROM osixia/openldap:1.5.0

# UTF-8 desteği
ENV LANG C.UTF-8

# UID ve GID override (OpenLDAP varsayılanı 911)
ARG USER_ID=911
ARG GROUP_ID=911

# Kullanıcı ve grup ayarlarını güncelle
RUN groupmod -g ${GROUP_ID} openldap && \
    usermod -u ${USER_ID} -g ${GROUP_ID} openldap

# LDIF dosyasını kopyala ve sahipliğini ayarla
COPY bootstrap/users.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
RUN chown openldap:openldap /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif

# LDAP ortam değişkenleri
ENV LDAP_ORGANISATION="My Company"
ENV LDAP_DOMAIN="mycompany.org"
ENV LDAP_ADMIN_PASSWORD="admin"

# Bağlantı portu
EXPOSE 389

# openldap kullanıcısıyla çalıştır
USER openldap
