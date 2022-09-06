FROM centos:7

# 更改 yum 源
RUN sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo

RUN sed -i -e '/plugins=1/d' -e '/plugins=0/d' /etc/yum.conf

RUN yum install epel-release curl -y && yum clean all && rm -rf /var/cache/yum
