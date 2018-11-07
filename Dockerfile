FROM centos
MAINTAINER riskzhu
ADD ./apache-tomcat-8.5.8.tar.gz /root
ADD ./jdk-8u141-linux-x64.tar.gz /root
ENV JAVA_HOME /root/jdk1.8.0_141
ENV PATH $JAVA_HOME/bin:$PATH
WORKDIR /root/apache-tomcat-8.5.8/conf
ADD ./server.xml /root/apache-tomcat-8.5.8/conf/
#拷贝到tomcat ROOT目录
WORKDIR /root/apache-tomcat-8.5.8/webapps/ROOT
RUN rm -rf *
ADD ./dist/ /root/apache-tomcat-8.5.8/webapps/ROOT
ADD ./vue/ /root/apache-tomcat-8.5.8/webapps/ROOT
ENTRYPOINT /root/apache-tomcat-8.5.8/bin/startup.sh && tail -F /root/apache-tomcat-8.5.8/logs/catalina.out


