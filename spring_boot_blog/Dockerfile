FROM java:8

EXPOSE 8084

ADD spring_boot_blog-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'

ENTRYPOINT ["java", "-jar", "/app.jar"]