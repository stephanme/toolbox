FROM alpine:3.23
ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache --virtual mytools rsync curl jq ca-certificates sqlite kopia && rm -rf /var/cache/apk/*

#renovate: datasource=github-releases depName=regclient/regclient
ARG REGCLIENT_VERSION=0.11.1
RUN curl -o /usr/local/bin/regctl --fail -sSL https://github.com/regclient/regclient/releases/download/v${REGCLIENT_VERSION}/regctl-${TARGETOS}-${TARGETARCH} && \
    chmod a+x /usr/local/bin/regctl && \
    curl -o /usr/local/bin/regsync --fail -sSL https://github.com/regclient/regclient/releases/download/v${REGCLIENT_VERSION}/regsync-${TARGETOS}-${TARGETARCH} && \
    chmod a+x /usr/local/bin/regsync

CMD ["sh"]