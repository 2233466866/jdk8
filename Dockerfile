FROM centos:7
ADD * /root/
ENV JAVA_VERSION=1.8.0_271
ENV JAVA_HOME=/usr/local/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin
RUN cp -r /root/jdk${JAVA_VERSION} /usr/local/jdk

