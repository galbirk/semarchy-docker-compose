# Semarchy installation documentation : https://www.semarchy.com/doc/semarchy-xdm/semng.html
# Java support :
# - Java 8 - version 1.8.0.25 and above
# - Java 11
# Tomcat support :
# - Tomcat 8.5.*
# - Tomcat 9.0.*

FROM tomcat:9.0.38-jdk11-openjdk

# Tomcat config
COPY tomcat/ $CATALINA_HOME/

# We run the main script, that will start Tomcat amongst other things
COPY run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh
CMD ["/bin/bash", "-c", "run.sh"]