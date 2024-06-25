FROM maven:3.9.2-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/demo-jwt-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080

LABEL authors="JAQUELINE"

ENTRYPOINT ["java", "-jar", "demo.jar"]