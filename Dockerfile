FROM ferrarimarco/github-changelog-generator

WORKDIR /usr/local/src/your-app
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
