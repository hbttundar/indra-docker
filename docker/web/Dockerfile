FROM ubuntu:21.04

LABEL maintainer="Hosein Bagherzadegan Talkhouncheh"

WORKDIR /var/www/html

ARG APP_ENV
ARG PHP_VERSION
ARG INSTALL_XDEBUG
# Configure non-root user.
ARG WWWGROUP
ARG WWWUSER
RUN groupadd --force -g $WWWGROUP indra
RUN useradd -ms /bin/bash --no-user-group -g $WWWGROUP -u 1337 indra
RUN usermod -a -G root indra && usermod -a -G www-data indra

COPY ./msmtp/  /tmp/
#
# copy all bash scripts that we need
#
COPY ./${PHP_VERSION}/build.sh /tmp/
COPY scripts/indra/ /tmp/indra/
RUN chmod +x /tmp/build.sh && chmod +x /tmp/indra/permission.sh
RUN bash /tmp/build.sh
#
# copy all bash scripts that we need
#
COPY ${PHP_VERSION}/php/php.ini /etc/php/8.0/cli/conf.d/99-indra.ini
COPY apache /etc/apache2/

RUN update-ca-certificates
RUN setcap "cap_net_bind_service=+ep" /usr/bin/php${PHP_VERSION}

# set permissions
RUN sh /tmp/indra/permission.sh


EXPOSE 80 443

ENTRYPOINT ["start.sh"]