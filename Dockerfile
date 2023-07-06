FROM maven:3.8.4-openjdk-8-slim AS maven_build
WORKDIR / app
copy ./pom.xml ./pom.xml
copy ./src ./src
run mvn pacakage 
FROM openjdk:8-jdk
WORKDIR  /app
copy --from=build target/sample-*.jar ./sample.jar
cmd ["java","-jar", "./sample.jar"]