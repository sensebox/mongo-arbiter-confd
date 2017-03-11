FROM mongo:3.2

# install confd
RUN set -x \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
  && wget -O /usr/local/bin/confd "https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64" \
  && chmod +x /usr/local/bin/confd \
  && apt-get purge -y --auto-remove ca-certificates wget

# Copy confd files
COPY confd_files /etc/confd/

COPY run-confd.sh /run-confd.sh
ENTRYPOINT ["/run-confd.sh"]
