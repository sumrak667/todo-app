FROM eclipse-temurin:17-jdk
VOLUME /tmp
COPY target/todo-app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
