



FROM  maven:3.8.2-jdk-11 


COPY ./settings-docker.xml /usr/share/maven/ref/



RUN     mvn clean verify
RUN     mvn dependency:resolve

