FROM maven:3.2-onbuild as build
copy ./pom.xml ./pom.xml
copy ./src ./src
RUN mvn pacakage
FROM openjdk:8-jdk
WORKDIR  /app1.2
copy --from=build target/sample-*.jar ./sample.jar
cmd ["java","-jar","./sample.jar"]