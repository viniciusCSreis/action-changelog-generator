FROM ferrarimarco/github-changelog-generator

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*


ENTRYPOINT ["bash","/entrypoint.sh"]
