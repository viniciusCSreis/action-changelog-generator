FROM ferrarimarco/github-changelog-generator

WORKDIR /usr/local/src/your-app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]