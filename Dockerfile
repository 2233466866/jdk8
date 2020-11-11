FROM centos:7
ADD * /root/
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*;\
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /lib/systemd/system/sockets.target.wants/*udev*;\
rm -f /lib/systemd/system/sockets.target.wants/*initctl*;\
unalias cp;\
cp -rf /root/cgroup/* /sys/fs/cgroup/;\
cd /root;\
mv jdk1.8.0_271 /usr/local/jdk;\
rm -rf /root/*
ENV JAVA_HOME /usr/local/jdk
ENV PATH ${PATH}:/usr/local/jdk/bin
CMD ["/usr/sbin/init"]
