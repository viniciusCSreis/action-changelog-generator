FROM ferrarimarco/github-changelog-generator

COPY entrypoint.sh /entrypoint.sh

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache git hub

ENTRYPOINT ["sh","/entrypoint.sh"]
