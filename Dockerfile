# Version: 0.0.1
FROM jenkins/jenkins:lts
MAINTAINER Andy Cobley “aecobley@dundee.ac.uk”
USER root
RUN apt-get -y update
RUN apt-get -y install maven
USER jenkins
EXPOSE 80
EXPOSE 8080
EXPOSE 50000