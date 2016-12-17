# Introduction
This repository was forked from [carloe/docker-factorio](https://hub.docker.com/r/carloe/docker-factorio/) to build a custom configured server on factorio and provide extra information on how to setup a factorio server using docker.

# Server Setup

The easiest way to setup a factorio server by far, is to use [Digital Ocean.](https://m.do.co/c/ebb875976e21) Follow the link to signup and get $10 for free to start you off. This guide assumes your are using a Mac, Windows users may have to alter their method when it comes to terminal usage. Disclaimer: All referrals generate credit to my account for more factorio goodness.

1. Sign up to [Digital Ocean](https://m.do.co/c/ebb875976e21)
2. Click 'Create droplet' button
[Click the 'create droplet' button](https://cloud.githubusercontent.com/assets/6523593/21289585/0142f2c4-c499-11e6-81d0-ae064f8010b7.png)
3. Under 'Choose an image' select 'One-click apps'
[One-click apps](https://cloud.githubusercontent.com/assets/6523593/21289594/139c5e1a-c499-11e6-8dcf-29e1df8cd02f.png)
4. Select 'Docker 1.12.\* on 16.04'
[docker 1.12.0 on 16.04](https://cloud.githubusercontent.com/assets/6523593/21289616/486ed596-c499-11e6-855f-3be8ab58763f.png)
5. Select the '$5/mo' size, this is fine for a basic multiplayer server
[5 dollars a month memory](https://cloud.githubusercontent.com/assets/6523593/21289586/059d28d0-c499-11e6-8854-07a8b0df72c6.png)
6. Select the datacenter that is closest to you
[london datacenter selected](https://cloud.githubusercontent.com/assets/6523593/21289588/07d8aaac-c499-11e6-9603-185fea7bb496.png)
7. Add your [SSH public key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2). Alternatively, you will need to take note of the password that Digital Ocean send to you after you setup the server.
8. You will only need 1 droplet, name your server and click create.
[Create your droplet](https://cloud.githubusercontent.com/assets/6523593/21289590/0ce0d10a-c499-11e6-9d74-ad9b09db5c10.png)

# Connect to your server

Windows users will need to look at alterations for using PuTTY.

1. Make note of the IP address of your server (ipv4)
[docker IP address](https://cloud.githubusercontent.com/assets/6523593/21289591/100305ec-c499-11e6-9975-f2fe8114dab4.png)
2. Open terminal
3. `ssh root@IPaddress`, obviously replace 'IPaddress' with the IP address.

# Build Your Factorio headless server

The latest Factorio headless server is downloaded at build time. This may be a good reason you want to build your own image since the Docker Hub repo may not always be up to date.

1. `git clone https://github.com/LpmRaven/docker-factorio.git`
2. `docker build -t factorio-instance-name .`

# Persisting Saves

Use a docker volume to persist the savegames on the host machine rather than in the docker container.

```bash
mkdir $(pwd)/saves

# Make sure the saves dir can be written to by the "factorio" user in Docker, with uid 1000
sudo chown 1000:1000 $(pwd)/saves
# (alternatively, if you don't have root): chmod 777 $(pwd)/saves

```

# Basic Usage

The init script will automatically create a new save game if none exists.

Then launch your container as usual.

```bash
docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           factorio-instance-name
```
