FROM openjdk:17-slim
FROM maven:3.6.3-openjdk-17-slim AS build
COPY src /student/src
COPY pom.xml /student
RUN mvn -f /student/pom.xml clean package
RUN mvn -f /student/pom.xml install package
COPY . /student
EXPOSE 8080
ENTRYPOINT ["java","-jar","/student/target/dockerapp-0.0.1-SNAPSHOT.jar"]