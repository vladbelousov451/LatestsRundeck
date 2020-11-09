FROM jordan/rundeck
USER root
RUN mkdir /installs
COPY assets/git-plugin-1.0.4.jar /var/lib/rundeck/libext/ 
COPY assets/powershell_7.0.3-1.debian.9_amd64.deb /installs/
##  coppy Gitplugin to the container image and copy powershell installation file
WORKDIR /installs
RUN apt-get update -y && apt-get install liblttng-ust0 -y
RUN apt-get install ansible -y && apt-get install git -y

RUN dpkg -i -a /installs/powershell_7.0.3-1.debian.9_amd64.deb
## Find and install powershell and python needed modules
RUN pwsh -command "Find-Module -Name VMware.PowerCLI , PowervRA ,ansibleTower, PowerNSX | Install-Module -Force"


