FROM alpine:3.17

RUN apk add --no-cache --virtual mytools rsync curl jq ca-certificates && rm -rf /var/cache/apk/*

CMD ["sh"]