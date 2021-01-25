FROM lobotomised/docker-php-base:latest

COPY /docker/queue/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

ENTRYPOINT ["/bin/sh", "/root/startup.sh"]
