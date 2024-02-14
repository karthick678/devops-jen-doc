FROM openjdk:17
EXPOSE 8080
ADD target/devops-jen-doc.jar devops-jen-doc.jar
ENTRYPOINT ["java", "-jar", "devops-jen-doc.jar"]