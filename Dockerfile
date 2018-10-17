# Version: 0.0.1
FROM jenkins/jenkins:lts
MAINTAINER Andy C “aecobley@dundee.ac.uk”
RUN apt-get install maven
EXPOSE 80
EXPOSE 8080
EXPOSE 50000