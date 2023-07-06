FROM maven:3.5.4-jdk-8-alpine as build
copy ./pom.xml ./pom.xml
copy ./src ./src
RUN mvn clean pacakage 
FROM openjdk:8-jdk
WORKDIR  /app1.0
copy --from=build target/sample-*.jar ./sample.jar
cmd ["java","-jar","./sample.jar"]