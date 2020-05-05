# gnuradio-docker

This is a Dockerfile for a GNU Radio 3.8 installation based on Ubuntu 18.04. It will add the official GNU Radio PPA and install it plus a few missing dependencies. In order to use a USB device or have a GUI view for something like the GNU Radio Companion, you must `docker run` with additional parameters, they are provided in the `buildandrun.sh` script.

If you did not [install docker and use a docker group](https://docs.docker.com/engine/install/linux-postinstall/) you will need to run the script with `sudo` privs, but I'm not positive that will work.
