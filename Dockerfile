FROM mhart/alpine-node

# FIXME: fix --no-check-certificate

WORKDIR /
RUN apk add --no-cache wget git \
 && wget --no-check-certificate https://github.com/benweet/stackedit/archive/v4.3.14.tar.gz \
 && tar -xzf v4.3.14.tar.gz && rm -f v4.3.14.tar.gz \
 && (cd /stackedit-4.3.14; npm install) \
 && apk del wget git

WORKDIR  /stackedit-4.3.14
EXPOSE 3000
CMD node server.js
