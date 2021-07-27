FROM ubuntu:21.04
COPY scripts/ /tmp/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /tmp/build.sh && chmod +x /tmp/start.sh && mv /tmp/start.sh /usr/bin/start.sh
RUN bash /tmp/build.sh


EXPOSE 9200

#CMD tail -f /dev/null
ENTRYPOINT ["start.sh"]