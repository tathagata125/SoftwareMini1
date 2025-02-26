FROM maven:3.8.6-eclipse-temurin-17 AS build

# Set the working directory
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline
# Copy the source code
COPY src ./src
#Build the project and run tests
RUN mvn clean install

FROM eclipse-temurin:17-jdk

WORKDIR /app
# Ensure the script has execute permissions
COPY --from=build /app/target/MT2024161-1.0-SNAPSHOT.jar .

# Set the default command to execute ScientificCalculator.java
ENTRYPOINT ["java","-jar", "MT2024161-1.0-SNAPSHOT.jar"]