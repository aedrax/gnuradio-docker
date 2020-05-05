#!/bin/bash

docker build -t gnuradio .
docker run -it --privileged --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/home/gruser/.Xauthority:rw"  gnuradio
