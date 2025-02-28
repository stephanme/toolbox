FROM alpine:3.21

RUN apk add --no-cache --virtual mytools rsync curl jq ca-certificates sqlite && rm -rf /var/cache/apk/*

CMD ["sh"]