FROM tomcat:7-jre7

MAINTAINER "Leonardo Luiz<leonardlsc@gmail.com>"

ADD tomcat-users.xml /usr/local/tomcat/conf/
ADD server.xml /usr/local/tomcat/conf/

ENV JDPA_OPTS "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"

RUN apt-get --yes --force-yes update && apt-get --yes --force-yes install  \
    vim \
    libapr1-dev \
    libssl-dev \
    build-essential \
    openjdk-7-jdk

ENV CATALINA_OPTS "-Duser.timezone=America/Sao_Paulo -Djava.library.path=/usr/local/apr/lib"
ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/apr/lib"

RUN wget http://mirror.nbtelecom.com.br/apache//apr/apr-1.5.2.tar.gz
RUN tar -xzvf apr-1.5.2.tar.gz
RUN cd apr-1.5.2
ADD build-apr.sh build-apr.sh
RUN chmod +x build-apr.sh
RUN ./build-apr.sh
RUN cd .. && rm -rf apr-1.5.2

ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 80
EXPOSE 443
CMD ["/run.sh"]
