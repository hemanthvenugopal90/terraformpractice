#Sample Docker File 1
FROM amazonlinux

RUN yum install httpd -y && \
    yum install git -y

RUN mkdir /root/.ssh

COPY ./id_rsa /root/.ssh/id_rsa

RUN chmod -R 700 /root/.ssh && \
    chown -R root:root /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN git clone git@bitbucket.org:hemanthdevops/html-web-app.git /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#sample Dockerfile 2 to set up Apache tomcat
FROM amazonlinux AS Build
ENV JAVA_HOME=/opt/jdk11
ENV PATH=$PATH:/opt/jdk11/bin
ENV M2_HOME /opt/maven
RUN export PATH
RUN export JAVA_HOME
RUN yum install wget -y && \
    yum install gzip -y && \ 
    yum install tar -y  && \
    yum install git -y  

RUN wget https://download.java.net/openjdk/jdk11.0.0.1/ri/openjdk-11.0.0.1_linux-x64_bin.tar.gz && \
    tar -zxf openjdk-11.0.0.1_linux-x64_bin.tar.gz && \
    mv jdk-11.0.0.1 /opt/jdk11


RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz && \
    tar -zxf apache-maven-3.9.3-bin.tar.gz && \
    mv apache-maven-3.9.3 /opt/maven


RUN mkdir /root/.ssh

COPY ./id_rsa /root/.ssh/id_rsa

RUN chmod -R 700 /root/.ssh && \
    chown -R root:root /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN git clone git@bitbucket.org:hemanthdevops/java-login-app.git /opt/app
WORKDIR /opt/app
RUN /opt/maven/bin/mvn package


FROM amazonlinux 
ENV JAVA_HOME=/opt/jdk11
ENV PATH=$PATH:/opt/jdk11/bin
RUN yum install wget -y && \
    yum install gzip -y && \ 
    yum install tar -y
RUN wget https://download.java.net/openjdk/jdk11.0.0.1/ri/openjdk-11.0.0.1_linux-x64_bin.tar.gz && \
    tar -zxf openjdk-11.0.0.1_linux-x64_bin.tar.gz && \
    mv jdk-11.0.0.1 /opt/jdk11
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz && \
    tar -zxf apache-tomcat-8.5.82.tar.gz && \
    mv apache-tomcat-8.5.82 /opt/tomcat 
COPY --from=Build /opt/app/target/dptweb-1.0.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

#sample Dockerfile 3 to set up nginx

FROM amazonlinux
RUN yum install telnet -y
RUN yum install nginx -y
COPY ./nginx.conf /etc/nginx/nginx.conf
CMD ["nginx" "-g" "daemon off;"]

#sample Dockerfile for Mysql
FROM mysql:5.7
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes


