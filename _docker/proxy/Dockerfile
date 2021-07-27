FROM httpd:latest

# Base config for HTTP & HTTPS
COPY httpd.conf /usr/local/apache2/conf
COPY httpd-ssl.conf /usr/local/apache2/conf

COPY conf/playground_https.conf /usr/local/apache2/conf

# indra (graylog)
COPY conf/graylog.conf /usr/local/apache2/conf
# indra (elasticsearc)
COPY conf/elasticsearch.conf /usr/local/apache2/conf

# indra (Phoneservice Websites)
COPY conf/indra_http.conf /usr/local/apache2/conf
COPY conf/indra_https.conf /usr/local/apache2/conf

# Mailhog (Mail-catcher service)
COPY conf/mailhog_http.conf /usr/local/apache2/conf
COPY conf/mailhog_https.conf /usr/local/apache2/conf

# Playground (PHP empty project for quick tests and experiments)
COPY conf/playground_http.conf /usr/local/apache2/conf
COPY conf/playground_https.conf /usr/local/apache2/conf

# Domain lists (will be included in both HTTP & HTTPS configurations)
COPY conf/domains/elasticsearch_domains.conf /usr/local/apache2/conf
COPY conf/domains/graylog_domains.conf /usr/local/apache2/conf
COPY conf/domains/indra_domains.conf /usr/local/apache2/conf
COPY conf/domains/mailhog_domains.conf /usr/local/apache2/conf
COPY conf/domains/playground_domains.conf /usr/local/apache2/conf

# Self-signed certificates
COPY selfSignedCertificates/server.key /usr/local/apache2/conf
COPY selfSignedCertificates/server.crt /usr/local/apache2/conf