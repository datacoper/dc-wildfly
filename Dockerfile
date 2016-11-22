FROM jboss/wildfly:10.1.0.Final

MAINTAINER Roberto Filho <roberto.filho@datacoper.com.br>

# Volume para manter o ownership dos arquivos no COPY
VOLUME /opt/jboss/wildfly/modules/

# Copia o xml de configuração nosso
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
COPY standalone.conf /opt/jboss/wildfly/bin/standalone.conf
# Copia as libs necessárias
COPY modules/ /opt/jboss/wildfly/modules/

# Precisa setar na mão as permissões dos arquivos, pois o docker
# não honra a diretiva USER setada acima
USER root
RUN chown -R jboss:jboss /opt/jboss/wildfly/modules/

# Seta o volume para o diretório de deployments
VOLUME /opt/jboss/wildfly/standalone/deployments

# Passar a porta de debug para o wildfly
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "--debug", "8787"]
#ENV JAVA_OPTS "-Xms768m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true"
