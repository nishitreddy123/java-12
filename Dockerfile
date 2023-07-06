FROM maven:latest as build
copy ./pom.xml ./pom.xml
copy ./src ./src
RUN mvn package
FROM openjdk:8-jdk
WORKDIR  /app1.2
copy --from=build target/sample-*.jar ./sample.jar
cmd ["java","-jar","./sample.jar"]