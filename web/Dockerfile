# Semarchy installation documentation : https://www.semarchy.com/doc/semarchy-xdm/semng.html
# Java support :
# - Java 8 - version 1.8.0.25 and above
# - Java 11
# Tomcat support :
# - Tomcat 8.5.*
# - Tomcat 9.0.*

FROM tomcat:9.0.38-jdk11-openjdk

ARG SEMARCHY_VERSION="5.0"

ARG FILENAME="semarchy-xdm-preconfigured-5.0.4.ga-20190708-1257.zip"

# env vars
ENV SEMARCHY_NODE_TYPE=active \
    SEMARCHY_DATABASE_HOST=db \
    SEMARCHY_DATABASE_PORT=5432 \
    SEMARCHY_LOGIN=admin \
    SEMARCHY_PASSWORD=Aa123456

# Tomcat config
COPY tomcat/ $CATALINA_HOME/

RUN cd /tmp && \
    wget https://www.semarchy.com/downloads/products/${SEMARCHY_VERSION}/${FILENAME} && \
    unzip ${FILENAME} && \
    rm ${FILENAME} && \
    mv /tmp/mdm-server/webapps/semarchy.war $CATALINA_HOME/webapps/ && \
    rm -rf /tmp/mdm-server /tmp/pulse /tmp/README.txt

# We run the main script, that will start Tomcat amongst other things
COPY run.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/run.sh

CMD ["/bin/bash", "-c", "run.sh"]
