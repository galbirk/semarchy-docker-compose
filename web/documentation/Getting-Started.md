# Introduction 
This is Semarchy for Docker based on:
- Java 11 (Open JDK)
- Tomcat 9.0.34
- Semarch 5.2.0 GA

Semarchy can run on alterative versions of Java or Tomcat. You can easily adjust this in the Dockerfile by changing the FROM command to whatever you prefer:
```
FROM tomcat:9.0.34-jdk11-openjdk
```

# Supported features
The following features are currently supported:
- Active / Passive nodes
- Admin account password configuration
- Database Repository configuration
- Database Data Location configuration
- Default Tomcat app deployment switch
- Azure AD Authentication (SSO)
- Azure AD Authorization through AAD groups

Coming soon:
- SMTP configuration

# Build
Building the docker image is straight forward. Simply run:
```
docker build -t semarchy .
```

# Run
```
docker run -it -p 8080:8080 --env-file env.list semarchy
```
Where env.list is a simple text file with environment variables:
```
SEMARCHY_NODE_TYPE=active|passive
SEMARCHY_LOGIN=your-semarchy_login
SEMARCHY_PASSWORD=xxxxxxxx
SEMARCHY_DATABASE_HOST=xxxxxxxx.database.windows.net
SEMARCHY_DATABASE_PORT=1433
SEMARCHY_DATABASE_REPO_NAME=xxxxxxxx
SEMARCHY_DATABASE_REPO_LOGIN=xxxxxxxx
SEMARCHY_DATABASE_REPO_PASSWORD=xxxxxxxx
SEMARCHY_DATABASE_DATA_01_NAME=xxxxxxxx
SEMARCHY_DATABASE_DATA_01_LOGIN=xxxxxxxx
SEMARCHY_DATABASE_DATA_01_PASSWORD=xxxxxxxx
SEMARCHY_DATABASE_DATA_02_ENABLE=false
SEMARCHY_DATABASE_DATA_02_NAME=xxxxxxxx
SEMARCHY_DATABASE_DATA_02_LOGIN=xxxxxxxx
SEMARCHY_DATABASE_DATA_02_PASSWORD=xxxxxxxx
SEMARCHY_DATABASE_DATA_03_ENABLE=false
SEMARCHY_DATABASE_DATA_03_NAME=xxxxxxxx
SEMARCHY_DATABASE_DATA_03_LOGIN=xxxxxxxx
SEMARCHY_DATABASE_DATA_03_PASSWORD=xxxxxxxx
SEMARCHY_DATABASE_DATA_04_ENABLE=false
SEMARCHY_DATABASE_DATA_04_NAME=xxxxxxxx
SEMARCHY_DATABASE_DATA_04_LOGIN=xxxxxxxx
SEMARCHY_DATABASE_DATA_04_PASSWORD=xxxxxxxx
TOMCAT_DEPLOY_DEFAULT_APPS=true|false
AAD_ENABLE_SSO=true|false
AAD_TENANT_ID=933c9cbe-35d3-4416-abbd-ddd1bca5879c
AAD_CLIENT_ID=xxxxxxxx
AAD_CLIENT_SECRET=xxxxxxxx
AAD_BASE_URI=https://xxxxxxxxx
AAD_GROUP_ID_TRANSACTIONAL_DATA_UPLOADER=xxxxxxxx
AAD_GROUP_ID_MASTER_DATA_OWNER=xxxxxxxx
AAD_GROUP_ID_MASTER_DATA_COLLABORATOR=xxxxxxxx
AAD_GROUP_ID_MASTER_DATA_VALIDATOR=xxxxxxxx
AAD_GROUP_ID_MASTER_DATA_READER=xxxxxxxx
AAD_GROUP_ID_AFFILIATE_COLLABORATOR=xxxxxxxx
AAD_GROUP_ID_AFFILIATE_VALIDATOR=xxxxxxxx
AAD_GROUP_ID_COLLABORATOR_VALIDATOR=xxxxxxxx
AAD_GROUP_ID_BUSINESS_ADMIN=xxxxxxxx
AAD_GROUP_ID_ADMIN=xxxxxxxx
```
> :warning: All the environment variable above will end up in XML files. Make sure you encode them first otherwise it will generate errors at runtime due to invalid XML synthax. This is important since passwords may contain XML special characters requiring encoding. Typically using https://coderstoolbox.net/string/ to encode your variables to be XML encoded.

# Environment variables
The following environment variables are required to run the container

- ### SEMARCHY_NODE_TYPE

The type of node that will be deployed, either active or passive. If you only deploy a single instance, than set this to active.
More info: https://www.semarchy.com/doc/semarchy-xdm/semng.html#high-availability-configuration

- ### SEMARCHY_LOGIN

Login to access Semarchy web admin. This setting will be placed in tomcat-users.xml file.

- ### SEMARCHY_PASSWORD

Password to access Semarchy web admin. This setting will be placed in tomcat-users.xml file.

- ### SEMARCHY_DATABASE_HOST

The host name of the database server. This setting will be placed in semarchy.xml file.

- ### SEMARCHY_DATABASE_PORT

The port of the database server. Typically 1433. This setting will be placed in semarchy.xml file.

- ### SEMARCHY_DATABASE_REPO_NAME

The database name of Semarchy "Repository" that contains configuration of the application. This setting will be placed in semarchy.xml file.

- ### SEMARCHY_DATABASE_REPO_LOGIN

The database login of Semarchy "Repository" that contains configuration of the application. This setting will be placed in semarchy.xml file.

- ### SEMARCHY_DATABASE_REPO_PASSWORD

The database password of Semarchy "Repository" that contains configuration of the application. This setting will be placed in semarchy.xml file.

- ### SEMARCHY_DATABASE_DATA_0x_ENABLE

Set to true to enable more data locations. Accepted values for x are 2, 3, 4.
x=1 is ignored since one data location is mandatory.

- ### SEMARCHY_DATABASE_DATA_0x_NAME

The database name of Semarchy "Data Location" that contains data of the application. This setting will be placed in semarchy.xml file.
Replace x with 1, 2, 3 or 4

- ### SEMARCHY_DATABASE_DATA_0x_LOGIN

The database login of Semarchy "Data Location" that contains data of the application. This setting will be placed in semarchy.xml file.
Replace x with 1, 2, 3 or 4

- ### SEMARCHY_DATABASE_DATA_0x_PASSWORD

The database password of Semarchy "Data Location" that contains data of the application. This setting will be placed in semarchy.xml file.
Replace x with 1, 2, 3 or 4

- ### TOMCAT_DEPLOY_DEFAULT_APPS

If set to true, will deploy Tomcat default applications (manager, examples, host manager, docs, ...).
If running in production, you should disable it by setting the variable to false.
Expected value: true | false

- ### AAD_ENABLE_SSO

To enable or disable AAD single sign on.
Expected value: true | false

- ### AAD_TENANT_ID (optional)

Azure AD tenant ID.
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_CLIENT_ID (optional)

Azure AD Application Registration ID.
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_CLIENT_SECRET (optional)

Azure AD Application Registration Secret.
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_BASE_URI (optional)

The base uri used to build the callback uri for Single Sign-on.
Format : https://xxxxxxxxx
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_TRANSACTIONAL_DATA_UPLOADER (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "transactionalDataUploader".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_MASTER_DATA_OWNER (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "masterDataOwner".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_MASTER_DATA_COLLABORATOR (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "masterDataCollaborator".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_MASTER_DATA_VALIDATOR (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "masterDataValidator".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_MASTER_DATA_READER (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "masterDataReader".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_AFFILIATE_COLLABORATOR (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "affiliateCollaborator".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_AFFILIATE_VALIDATOR (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "affiliateValidator".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_COLLABORATOR_VALIDATOR (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "collaboratorValidator".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_BUSINESS_ADMIN (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "businessAdmin".
Only required if AAD_ENABLE_SSO is set to true.

- ### AAD_GROUP_ID_ADMIN (optional)

Azure AD Group ID that contains all the users that will have Semarchy role "semarchyAdmin".
Only required if AAD_ENABLE_SSO is set to true.

# Hosting

Since it is all about Docker, you can consider hosting on anything the runs Docker.
We are providing [hosting guidelines for Azure here.](/Azure-Hosting.md)

