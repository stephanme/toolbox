FROM alpine:3.15

RUN apk add --no-cache --virtual mytools rsync curl jq ca-certificates && rm -rf /var/cache/apk/*

CMD ["sh"]