FROM centos:7
ADD * /root/
RUN \cp -rf /root/cgroup/* /sys/fs/cgroup/;\
rm -rf /etc/systemd/system/*.wants/*;\
rm -rf /lib/systemd/system/basic.target.wants/*;\
rm -rf /lib/systemd/system/anaconda.target.wants/*;\
rm -rf /lib/systemd/system/local-fs.target.wants/*;\
rm -rf /lib/systemd/system/multi-user.target.wants/*;\
rm -rf /lib/systemd/system/sockets.target.wants/*udev*;\
rm -rf /lib/systemd/system/sockets.target.wants/*initctl*;\
rm -rf /lib/systemd/system/systemd-tmpfiles-setup.service;\
rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service;\
cd /root;\
yum install wget -y;\
wget https://www.so1234.top/jdk1.8.0_271.tar.gz;\
tar -xf jdk1.8.0_271.tar.gz;\
mv jdk1.8.0_271 /usr/local/jdk;\
rm -rf /root/*
ENV JAVA_HOME=/usr/local/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]

