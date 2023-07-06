FROM maven:3.8.4-openjdk-8-slim AS maven_build
WORKDIR / app
copy pom.xml .
run mvn dependency:go-offline
copy src ./src
run mvn pacakage -DskipTests
FROM openjdk:8-jre-slim
WORKDIR  /app
copy --from=maven-build /app/target/sample-1.0.3.jar .
cmd ["java","-jar", "sample-1.0.3.jar"]