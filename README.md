![docker-compose CI](https://github.com/galbirk/semarchy-docker-compose/workflows/docker-compose%20CI/badge.svg)

# semarchy-docker-compose
Deploy Semarchy xDM with docker-compose, including the Dockerfiles.<br>
Compose uses postgresql as Database.<br>
Added pgadmin container for psql web managment.

## Table of Contents
- [Run Example](#Run-Example)
  * [Install docker and docker-compose](#Install-docker-and-docker-compose)
  * [Clone git repository and deploy the compose file](#Clone-git-repository-and-deploy-the-compose-file)
- [Environment Variables](#Environment-Variables)
- [Author Information](#Author-Information)

# Run Example
## Install docker and docker-compose
[docker installation documentation](https://docs.docker.com/get-docker/)<br>
[docker-compose installation documentation](https://docs.docker.com/compose/install/)<br>
### install docker on linux
```bash
# Install docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker && sudo systemctl enable docker
# Ensure installation succeed
sudo docker --version
# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# Ensure installation succeed
docker-compose --version
```
## Clone git repository and deploy the compose file
```bash
git clone https://github.com/galbirk/semarchy-docker-compose.git
cd semarchy-docker-compose
docker-compose up # run docker-compose up -d for background running.
```
semarchy url: http://[ip/hostname]<br>
pgadmin url: http://[ip/hostname]:8080<br>
**semarchy default credentials:**<br>
username: admin<br>
password: Aa123456<br>
**pgadmin default credentials:**<br>
username: admin@admin.com<br>
password: admin<br>
**credentials can be changed with environment variables in the compose file.**
## Environment Variables
### Semarchy env vars.
* **SEMARCHY_NODE_TYPE** --> can be set to active/passive
### Postgres env vars.
* **POSTGRES_USER** --> postgres default user
* **POSTGRES_PASSWORD** --> postgres default password
* **POSTGRES_DB** --> postgres default db
### Pgadmin env vars.
* **PGADMIN_DEFAULT_EMAIL** --> pgadmin default mail
* **PGADMIN_DEFAULT_PASSWORD** --> pgadmin default password

## Docker Hun Images
#### The images are published in Docker Hub:
* [Semarchy image repository](https://hub.docker.com/repository/docker/galbirk/semarchy)
* [postgres for semarchy image repository](https://hub.docker.com/repository/docker/galbirk/postgres)

# Author Information

<b>Gal Birkman, DevOps Engineer.</b><br>
<b>email:</b> galbirkman@gmail.com<br>
<b>GitHub:</b> https://github.com/galbirk
