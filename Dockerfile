FROM tomcat
EXPOSE 8090

COPY example.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
