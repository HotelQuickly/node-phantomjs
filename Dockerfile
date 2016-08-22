FROM node:6-slim

ENV PHANTOM_VERSION 2.1.1

# INSTALLING PHANTOM_JS FOR KARMA TEST
RUN set -x \
    && buildDeps='libpng12-0 curl git bzip2 file libfreetype6 libfontconfig1 python-pip python-dev libpq-dev libmemcached-dev libzmq-dev libjpeg62-turbo-dev zlib1g-dev libtiff5-dev make g++ psmisc' \
    && apt-get update \
    && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSLO "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_VERSION-linux-x86_64.tar.bz2" \
    && tar -C /usr/local -xjf "phantomjs-$PHANTOM_VERSION-linux-x86_64.tar.bz2" \
    && ln -sf /usr/local/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \
    && rm "phantomjs-$PHANTOM_VERSION-linux-x86_64.tar.bz2"
