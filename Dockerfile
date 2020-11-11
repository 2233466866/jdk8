FROM centos:7
ADD * /root/
RUN cd /root;\
mv jdk1.8.0_271 /usr/local/jdk;\
rm -rf /root/*
ENV JAVA_HOME /usr/local/jdk
ENV PATH ${PATH}:/usr/local/jdk/bin
CMD ["/usr/sbin/init"]
