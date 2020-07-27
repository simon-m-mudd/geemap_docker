# This is a docker container for geemap
# https://github.com/giswqs/geemap

# Pull base image. We start from the miniconda imade
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive

# Update conda
RUN conda install -y -c conda-forge conda

# Add the conda forge
RUN conda config --add channels conda-forge

# Set the channel
RUN conda config --set channel_priority strict

# Add git so you can clone repos
# Also set the python version
RUN conda install -y git python=3.7

# Some tools for fetching data
RUN conda install -y wget unzip

# Now the ipython stack for creating local ipython servers
RUN conda install mamba -y -c conda-forge
RUN mamba install geemap -y -c conda-forge
# RUN mamba install jupyter_contrib_nbextensions -y -c conda-forge

# Set the working directory
# WORKDIR /geemap_data
