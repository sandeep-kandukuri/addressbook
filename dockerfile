From tomcat:10.1.34-jdk17-temurin-jammy
add target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
