FROM pingworks/docker-ws-baseimg:0.2
MAINTAINER Christoph Lukas <christoph.lukas@gmx.net>

EXPOSE 80

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get install -y ruby2.1

RUN gem update --system && \
    gem install bundler rake rubygems-mirror geminabox

ADD .mirrorrc /root/.gem/.mirrorrc
ADD config.ru /root/.gem/mirror/config.ru
ADD rc.local /etc/rc.local
ADD setup.sh /setup.sh

CMD ["/sbin/init"]

