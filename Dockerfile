FROM alpine:3.9

RUN apk add --no-cache squid && \
  mkdir -p /etc/squid/conf.d && \
  cp /etc/squid/squid.conf /etc/squid/conf.d/default.conf && \
  echo 'include /etc/squid/conf.d/*.conf' > /etc/squid/squid.conf

RUN install -d -o squid -g squid \
		/var/cache/squid \
		/var/log/squid \
		/var/run/squid && \
	chmod +x /usr/lib/squid/*

COPY log.conf /etc/squid/conf.d/log.conf
# COPY my.conf /etc/squid/conf.d/default.conf
# RUN echo 'thr3a:$apr1$ZAAnUDIf$yvDygELIlnN/V.cOjw5.p.' > /etc/squid/passwd

EXPOSE 3128
USER squid
CMD ["/usr/sbin/squid", "-NYCd 1"]

