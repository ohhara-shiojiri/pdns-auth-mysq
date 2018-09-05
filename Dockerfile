FROM centos:latest

MAINTAINER Shinichiro Ohhara <ohhara@shiojiri.com>

RUN yum update -y && yum install -y epel-release yum-plugin-priorities && \
	curl -o /etc/yum.repos.d/powerdns-auth-41.repo https://repo.powerdns.com/repo-files/centos-auth-41.repo && \
	yum install -y pdns pdns-backend-mysql

EXPOSE 53/tcp 53/udp

CMD ["/usr/sbin/pdns_server"]

