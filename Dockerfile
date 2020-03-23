FROM ferrarimarco/github-changelog-generator

COPY entrypoint2.sh /entrypoint2.sh

ENTRYPOINT ["sh","/entrypoint2.sh"]
