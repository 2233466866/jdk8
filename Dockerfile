FROM centos:7
ADD * /root/
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    JAVA_VERSION="1.8.0_271" \
    JAVA_HOME="/usr/local/jdk${JAVA_VERSION}" \
    PATH="${PATH}:${JAVA_HOME}/bin"
RUN \cp /root/jdk${JAVA_VERSION} /usr/local/;\
\cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

