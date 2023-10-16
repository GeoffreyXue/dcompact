# Use an official Ubuntu as the base image
FROM ubuntu:latest

# Update the package lists and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y \
    git \
    libgflags-dev \
    libsnappy-dev \
    zlib1g-dev \
    libbz2-dev \
    liblz4-dev \
    libzstd-dev

# Cleanup
RUN apt-get clean

# Your application setup goes here

# Command to run your application (if applicable)
CMD ["/bin/bash"]
