# docker run -e TEAMCITY_SERVER=http://buildserver:8111 -dt -p 9090:9090 ariya/centos7-teamcity-agent-nodejs

FROM ariya/centos7-oracle-jre7

MAINTAINER Yueheng He <heyuehengtaichi@gmail.com> Ariya Hidayat <ariya.hidayat@gmail.com>

ADD setup-agent.sh /setup-agent.sh
RUN yum -y install wget unzip sudo curl
RUN adduser teamcity

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash - && yum install -y nodejs npm

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh run"
