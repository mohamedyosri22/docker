FROM openjdk:17-jre-slim
FROM maven:3.6.0-jdk-17-slim
COPY src /student/src
COPY pom.xml /student
RUN mvn -f /student/pom.xml clean package
RUN mvn -f /student/pom.xml install package
############################################
ENTRYPOINT["java","-jar","/student/target/dockerapp-0.0.1-SNAPSHOT.jar"]