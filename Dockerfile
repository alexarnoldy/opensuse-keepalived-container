FROM registry.opensuse.org/opensuse/leap:15.4

MAINTAINER "alex.arnoldy@suse.com"

RUN zypper -n ref && zypper -n refs && zypper -n install keepalived

RUN mkdir -p /opt/container-config/
ADD ./ /opt/container-config/
RUN cp -p /opt/container-config/keepalived.conf /etc/keepalived/keepalived.conf

CMD keepalived --dont-fork --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf
