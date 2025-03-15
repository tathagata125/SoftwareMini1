FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY /src ./src
RUN mvn clean install
FROM eclipse-temurin:17-jdk

WORKDIR /app
COPY --from=build /app/target/MT2024161-1.0-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","MT2024161-1.0-SNAPSHOT.jar"]
