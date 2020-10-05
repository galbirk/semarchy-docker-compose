#!/bin/bash
# Main run script

#####################################
# CONFIGURATION INJECTION
#####################################

# We use sed to inject secrets & variables in configuration files
# sed -i 's/Nick/John/g' report.txt => Replace every occurrence of Nick with John in report.txt

# Tomcat users
sed -i "s/{SEMARCHY_LOGIN}/$SEMARCHY_LOGIN/g" "$CATALINA_HOME/conf/tomcat-users.xml"
ESCAPED_SEMARCHY_PASSWORD=$(echo $SEMARCHY_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_PASSWORD}/$ESCAPED_SEMARCHY_PASSWORD/g" "$CATALINA_HOME/conf/tomcat-users.xml"

# Repository
sed -i "s/{SEMARCHY_DATABASE_HOST}/$SEMARCHY_DATABASE_HOST/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_PORT}/$SEMARCHY_DATABASE_PORT/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_REPO_NAME}/$SEMARCHY_DATABASE_REPO_NAME/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_REPO_LOGIN}/$SEMARCHY_DATABASE_REPO_LOGIN/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_SEMARCHY_DATABASE_REPO_PASSWORD=$(echo $SEMARCHY_DATABASE_REPO_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_DATABASE_REPO_PASSWORD}/$ESCAPED_SEMARCHY_DATABASE_REPO_PASSWORD/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Data location 01
sed -i "s/{SEMARCHY_DATABASE_DATA_01_NAME}/$SEMARCHY_DATABASE_DATA_01_NAME/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_DATA_01_LOGIN}/$SEMARCHY_DATABASE_DATA_01_LOGIN/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_SEMARCHY_DATABASE_DATA_01_PASSWORD=$(echo $SEMARCHY_DATABASE_DATA_01_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_DATABASE_DATA_01_PASSWORD}/$ESCAPED_SEMARCHY_DATABASE_DATA_01_PASSWORD/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Data location 02
sed -i "s/{SEMARCHY_DATABASE_DATA_02_NAME}/$SEMARCHY_DATABASE_DATA_02_NAME/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_DATA_02_LOGIN}/$SEMARCHY_DATABASE_DATA_02_LOGIN/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_SEMARCHY_DATABASE_DATA_02_PASSWORD=$(echo $SEMARCHY_DATABASE_DATA_02_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_DATABASE_DATA_02_PASSWORD}/$ESCAPED_SEMARCHY_DATABASE_DATA_02_PASSWORD/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Data location 03
sed -i "s/{SEMARCHY_DATABASE_DATA_03_NAME}/$SEMARCHY_DATABASE_DATA_03_NAME/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_DATA_03_LOGIN}/$SEMARCHY_DATABASE_DATA_03_LOGIN/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_SEMARCHY_DATABASE_DATA_03_PASSWORD=$(echo $SEMARCHY_DATABASE_DATA_03_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_DATABASE_DATA_03_PASSWORD}/$ESCAPED_SEMARCHY_DATABASE_DATA_03_PASSWORD/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Data location 04
sed -i "s/{SEMARCHY_DATABASE_DATA_04_NAME}/$SEMARCHY_DATABASE_DATA_04_NAME/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{SEMARCHY_DATABASE_DATA_04_LOGIN}/$SEMARCHY_DATABASE_DATA_04_LOGIN/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_SEMARCHY_DATABASE_DATA_04_PASSWORD=$(echo $SEMARCHY_DATABASE_DATA_04_PASSWORD | sed -e 's/[\/&]/\\&/g')
sed -i "s/{SEMARCHY_DATABASE_DATA_04_PASSWORD}/$ESCAPED_SEMARCHY_DATABASE_DATA_04_PASSWORD/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Azure AD
sed -i "s/{AAD_TENANT_ID}/$AAD_TENANT_ID/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{AAD_CLIENT_ID}/$AAD_CLIENT_ID/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
sed -i "s/{AAD_CLIENT_SECRET}/$AAD_CLIENT_SECRET/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
ESCAPED_AAD_BASE_URI=$(echo $AAD_BASE_URI | sed -e 's/[\/&]/\\&/g')
sed -i "s/{AAD_BASE_URI}/$ESCAPED_AAD_BASE_URI/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"

# Semarchy role mapping
sed -i "s/{AAD_GROUP_ID_TRANSACTIONAL_DATA_UPLOADER}/$AAD_GROUP_ID_TRANSACTIONAL_DATA_UPLOADER/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_MASTER_DATA_OWNER}/$AAD_GROUP_ID_MASTER_DATA_OWNER/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_MASTER_DATA_COLLABORATOR}/$AAD_GROUP_ID_MASTER_DATA_COLLABORATOR/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_MASTER_DATA_VALIDATOR}/$AAD_GROUP_ID_MASTER_DATA_VALIDATOR/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_MASTER_DATA_READER}/$AAD_GROUP_ID_MASTER_DATA_READER/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_AFFILIATE_COLLABORATOR}/$AAD_GROUP_ID_AFFILIATE_COLLABORATOR/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_AFFILIATE_VALIDATOR}/$AAD_GROUP_ID_AFFILIATE_VALIDATOR/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_COLLABORATOR_VALIDATOR}/$AAD_GROUP_ID_COLLABORATOR_VALIDATOR/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_BUSINESS_ADMIN}/$AAD_GROUP_ID_BUSINESS_ADMIN/g" "$CATALINA_HOME/conf/roles-mapping.properties"
sed -i "s/{AAD_GROUP_ID_ADMIN}/$AAD_GROUP_ID_ADMIN/g" "$CATALINA_HOME/conf/roles-mapping.properties"

# Single Sign on configuration
if [ "$AAD_ENABLE_SSO" = true ]
then
    # We uncomment AAD sso section and comment standard authentication
    sed -i "s/{AAD_ENABLE_SSO}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/AAD_ENABLE_SSO}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{AAD_DISABLE_SSO}/<!--/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/AAD_DISABLE_SSO}/-->/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
else
    # We comment AAD sso section and uncomment standard authentication
    sed -i "s/{AAD_ENABLE_SSO}/<!--/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/AAD_ENABLE_SSO}/-->/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{AAD_DISABLE_SSO}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/AAD_DISABLE_SSO}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
fi

# Data location 02 configuration
if [ "$SEMARCHY_DATABASE_DATA_02_ENABLE" = true ]
then
    # We uncomment AAD sso section and comment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_02_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_02_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
else
    # We comment AAD sso section and uncomment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_02_ENABLE}/<!--/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_02_ENABLE}/-->/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
fi

# Data location 03 configuration
if [ "$SEMARCHY_DATABASE_DATA_03_ENABLE" = true ]
then
    # We uncomment AAD sso section and comment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_03_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_03_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
else
    # We comment AAD sso section and uncomment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_03_ENABLE}/<!--/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_03_ENABLE}/-->/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
fi

# Data location 04 configuration
if [ "$SEMARCHY_DATABASE_DATA_04_ENABLE" = true ]
then
    # We uncomment AAD sso section and comment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_04_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_04_ENABLE}//g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
else
    # We comment AAD sso section and uncomment standard authentication
    sed -i "s/{SEMARCHY_DATABASE_DATA_04_ENABLE}/<!--/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
    sed -i "s/{\/SEMARCHY_DATABASE_DATA_04_ENABLE}/-->/g" "$CATALINA_HOME/conf/Catalina/localhost/semarchy.xml"
fi

#####################################
# WAR INJECTION
#####################################

# We deploy Tomcat default apps (overriding redirection to /semarchy)
if [ "$TOMCAT_DEPLOY_DEFAULT_APPS" = true ]
then
    rm $CATALINA_HOME/webapps/ROOT/index.jsp # remove redirection set in Dockerfile  
    mv $CATALINA_HOME/webapps.dist/* $CATALINA_HOME/webapps/ # Deploy default webapps
fi

# Depending on the node type (active or passive), we copy (move) a different war file
# We take advantage of auto deploy : https://tomcat.apache.org/tomcat-9.0-doc/deployer-howto.html#Deployment_on_Tomcat_startup
#if [ "$SEMARCHY_NODE_TYPE" = "active" ]
#then
    # active node
#    mv $CATALINA_HOME/webapps/semarchy-active.war $CATALINA_HOME/webapps/semarchy.war
#    rm $CATALINA_HOME/webapps/semarchy-passive.war
#else
    # passive node
#    mv $CATALINA_HOME/webapps/semarchy-passive.war $CATALINA_HOME/webapps/semarchy.war
#    rm $CATALINA_HOME/webapps/semarchy-active.war
#fi

#####################################
# TOMCAT LAUNCH
#####################################
$CATALINA_HOME/bin/catalina.sh run
