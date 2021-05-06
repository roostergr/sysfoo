FROM maven:3.6.3 as build
WORKDIR /opt/demo
COPY . /opt/demo
RUN mvn package

FROM tomcat as run
WORKDIR /usr/local/tomcat
COPY --from=0 /opt/demo/target/sysfoo.war webapps/
CMD catalina.sh run
