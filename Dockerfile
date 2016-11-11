FROM jboss/wildfly:10.1.0.Final

MAINTAINER Roberto Filho <roberto.filho@datacoper.com.br>

USER jboss

# Volume para manter o ownership dos arquivos no COPY
VOLUME /opt/jboss/wildfly/modules/

# Copia o xml de configuração nosso
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
# Copia as libs necessárias
COPY modules/ /opt/jboss/wildfly/modules/

USER root
# Da acesso para o usuário jboss
RUN chown -R jboss:jboss /opt/jboss/wildfly/modules/

# Seta o volume para o diretório de deployments

VOLUME /opt/jboss/wildfly/standalone/deployments
