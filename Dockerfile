FROM jboss/wildfly:10.1.0.Final

MAINTAINER Roberto Filho <roberto.filho@datacoper.com.br>

USER jboss

# Copia o xml de configuração nosso
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
# Copia as libs necessárias
COPY modules/ /opt/jboss/wildfly/modules/

# Seta o volume para o diretório de deployments

VOLUME /opt/jboss/wildfly/standalone/deployments