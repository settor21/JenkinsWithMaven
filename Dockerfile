# Version: 0.0.1
FROM jenkins/jenkins:lts
MAINTAINER Andy C “aecobley@dundee.ac.uk”
USER root

# Install required dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common

# Add the repository for Python 3.9
RUN add-apt-repository -y ppa:deadsnakes/ppa

# Update package lists and install Python 3.9
RUN apt-get update && \
    apt-get install -y python3.9

# Install other dependencies
RUN apt-get install -y maven wget curl gnupg

# Configure Google Cloud SDK repository
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add -

# Install Google Cloud SDK
RUN apt-get update -y && \
    apt-get install google-cloud-sdk -y

USER jenkins
ENV PATH=$PATH:/google-cloud-sdk/bin
EXPOSE 80
EXPOSE 8080
EXPOSE 50000
