# Single Instance on Azure App Service

In this section we will describe a basic hosting scenario where Semarchy runs on a single Active instance inside an Azure Web App for Containers.
Autoscaling (horizontal) is set to Off, but you can still indeed scale vertically the App Service Plan.

## Architecture

![webapp-single-azure-archi.png](../../.attachments/webapp-single-azure-archi.png =800x450)

## Advantage of Azure Web App

Azure Web App comes with many advantages, out of which:
- PaaS
- Custom domain
- SSL handling
- Automated Backups
- Auto scaling (not useful in this case)
- Deployment features (git integration, slots, ...)

## Installation basics

### App Service Plan

Your App Service Plan will need to be running on Linux:\
![image.png](/.attachments/image-07f21884-2cd1-4c4c-9be5-6fca3e4d4c42.png)

Premium V2 P1v2 is a good starting point:\
![image.png](/.attachments/image-c977f5da-bacb-47fe-81fd-fd36ce7e1641.png)

### Web App Creation

Make sure you select "Docker Container" on Linux when creating your Web App:\
![image.png](/.attachments/image-9bf98940-2694-4e60-b063-c6172eefda86.png)

The Docker part is straight forward. You can use the public image pernodricard/semarchy or a private image of your choice:\
![image.png](/.attachments/image-e535bcf6-550f-4670-9fbd-f4c0b4711fbc.png)

### Web App Configuration

Go in "TLS/SSL settings" and tick HTTPS only and TLS >= 1.2:\
![image.png](/.attachments/image-3a4cad02-936d-4e29-b855-b0631581d8e1.png)

In the "Custom domains" section, configure any custom domain you may want:\
![image.png](/.attachments/image-cdc3424d-4c75-4586-ac8e-26720b93a1f0.png)

Go to "Configuration" -> "Application settings" and configure all the environment variables:\
![image.png](/.attachments/image-17578bb8-dc3f-4b6e-987f-d7c644f3375a.png)
This is probably the most painful part. I suggest using the Advanced Editor which simplifies things a lot.

Since we are running a single node, make sure you set SEMARCHY_NODE_TYPE to active:\
![image.png](/.attachments/image-3989ee5b-dbe5-4b63-989f-05c1751f3d69.png)

In the "Scale out" section, verify that the number of instances is set to 1 with Manual Scale:\
![image.png](/.attachments/image-da33a441-2b08-4927-94b7-b0a1caa3639b.png)

You are done ! Go to the "Overview" and click browse:\
![image.png](/.attachments/image-9da1e1c0-9371-4075-878c-ac55532835f7.png)

This will take you to Semarchy, accept the licence agreement:\
![image.png](/.attachments/image-de0606e0-f37a-44f0-9015-8760f95ff89d.png)

Then select the type of repo you want to create:\
![image.png](/.attachments/image-3e23adfa-32d6-49c6-a686-f6d0246f74a2.png)

\o/\
![image.png](/.attachments/image-bf9ab98f-7b84-47d2-b40f-c694ebe24056.png)
