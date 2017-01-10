# Virtual environment for MATLAB #

## Description ##
This is a Docker image for MATLAB. Although MATLAB is not installed (because of licensing reasons), it has the minimal environment needed to run a MATLAB session and show figures and plots.

## Web demo builder ##
This Docker image is also used by the Web demo builder as the MATLAB *virtual environment*. You don't need to download it or use it directly from here, just use the Web demo builder interface, select the MATLAB programming language and this virtual environment will be automatically used.

## Showing figures and plots ##
If you want to use this image as your virtual environment for your MATLAB code (without using the Web demo builder), you might want to be able to show figures and plots within it. For this, you need to run your container with some special parameters.

These parameters allows the MATLAB session inside to get access to your X11 session. Replace `/usr/local/MATLAB/R2013a/` below with the path where MATLAB is installed in your computer (where the *bin/* directory resides). Keep in mind that the code has been tested with MATLAB R2013a.

    #!bash
    sudo docker run -ti -e DISPLAY=$DISPLAY -e uid=$UID \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v /usr/local/MATLAB/R2013a/:/MATLAB \
      sinclab/webdemo-base-matlab

Once inside the container, you will see a shell prompt like this:

    #!bash
    developer@CONTAINER_ID:/$

where CONTAINER_ID is a unique identifier of this container (you can get this ID by running `sudo docker ps`). You can use this identifier to control your container and, in those cases, the first four characters are usually enough.

This image contains a simple script located at `/run.sh`, which is a helper script to run MATLAB. You can pass the function to execute in MATLAB as the first argument:

    #!bash
    ./run.sh "MatlabFunction"
