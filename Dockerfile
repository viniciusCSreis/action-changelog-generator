FROM ferrarimarco/github-changelog-generator

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

RUN apk add --update bash

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
