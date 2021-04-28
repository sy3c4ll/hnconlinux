# Installing Hancom Office 2020 for Linux through Docker


![Hancom Office 2020](http://img3.tmon.kr/cdn3/deals/2021/03/17/4034773674/front_75000_i98ax.jpg)

## Synopsis

HANCOM Inc. is notorious for not having proper Linux support. The last version that had a partially supported Linux port is from 2008 (as far as I know), and after that only a viewer, with no editing capabilities whatsoever and fatal dependency issues on installation for anything other than Debian, was available. Up until recently. With the release of Hancom Office 2020, a Linux beta version was announced for the development of a port for their government-supported Korean Linux distro, HANCOM Gooroom OS. Currently the suite is available for free, being preinstalled on HANCOM Gooroom OS with an official installer being released as a .deb package. The installer is frankly quite dodgy and unintuitive, but with the help of dpkg the .deb packages of the suite can be extracted. Here, I have provided the necessary files and scripts required to install the suite with dependencies on a Docker container.

Known issues include being unable to write in Korean, at least for me. If you can get it to work, contact me via the Issues tab. Issue submissions are always welcome! In particular, if you're able to write a bash script to automate the steps below, I would appreciate it greatly if you submitted a pull request with said script.

Big shoutout to the post on https://hamonikr.org/Free_Board/83229, I basically copied their stuff.

## Installation

First, you must have Docker installed and enabled. Follow the steps on the official [Docker documentation](https://docs.docker.com/engine/install/) to install the Docker Engine, then run `systemctl enable docker && systemctl start docker` as root to set Docker to start at boot. Run `usermod -aG docker $USER` as root to add yourself to the docker group and avoid having to run every Docker command as root- this is recommended but optional, you may choose to leave the user settings as it is and prefix every Docker call with sudo.

Then, `git clone` this repository with `git clone https://github.com/sy3c4ll/hnconlinux.git`. There should be a Dockerfile and four bash scripts. Download two additional .deb packages from Google Drive ([hh.deb](https://drive.google.com/file/d/1rvMYXeavcQ8VD3fA3OTBTZ37NvKXJRtc/view?usp=sharing) and [hv.deb](https://drive.google.com/file/d/1-cbIF7lAouZ3g0q63fqZraoElbGtII0T/view?usp=sharing)), and check if they are named correctly to hh.deb and hv.deb since these names are used directly within the Dockerfile- the order does not matter. With the Dockerfile and the two packages in the current working directory, run `docker build -t hnc .` to start building the Docker image. This will take some time.

When the image finishes building, you may execute each of the scripts to run the program as per the name of the script. You may safely move the scripts to the location of your choice- I recommend moving it to ~/bin, since the does not require root permissions to modify and oftentimes the location is added to PATH by default- allowing you to run the programs anywhere using the appropriate names.

You may now safely delete the cloned folder, if you wish to do so.

## Disclaimers

I do not own Hancom Office 2020 or HANCOM Inc. and have created this repository for recreational and non-profit purposes. If you are an employee at HANCOM Inc. and you do not wish the content to be made public, notify me through the Issues tab or by direct messaging and I will private the repository as soon as possible.

Download and/or install the content at your own discretion. I am not responsible for any damages done to your personal device through the use of this repository.

