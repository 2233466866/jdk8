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
\cp -rfn /root/cgroup/* /sys/fs/cgroup/;\
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
cd /root;\
curl https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz -o jdk-8u202-linux-x64.tar.gz;\
tar -xf jdk-8u202-linux-x64.tar.gz;\
mv /root/jdk1.8.0_202 /usr/local/jdk
ENV JAVA_HOME=/usr/local/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
