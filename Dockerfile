FROM nginx
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && mv confd-0.11.0-linux-amd64 confd && chmod ugo+x confd
RUN mkdir -p /etc/confd/conf.d && mkdir -p /etc/confd/templates
COPY conf.d/balancer.toml /etc/confd/conf.d/balancer.toml
COPY conf.d/balancer.conf.tmpl /etc/confd/templates/balancer.conf.tmpl
COPY bootstrap.sh /bootstrap.sh
RUN chmod ugo+x /bootstrap.sh
CMD ["/bootstrap.sh"]