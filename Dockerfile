FROM alpine:3.23
ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache --virtual mytools rsync curl jq ca-certificates sqlite && rm -rf /var/cache/apk/*

#renovate: datasource=github-releases depName=regclient/regclient
ARG REGCLIENT_VERSION=0.11.1
RUN curl -o /usr/local/bin/regctl --fail -sSL https://github.com/regclient/regclient/releases/download/v${REGCLIENT_VERSION}/regctl-${TARGETOS}-${TARGETARCH} && \
    chmod a+x /usr/local/bin/regctl && \
    curl -o /usr/local/bin/regsync --fail -sSL https://github.com/regclient/regclient/releases/download/v${REGCLIENT_VERSION}/regsync-${TARGETOS}-${TARGETARCH} && \
    chmod a+x /usr/local/bin/regsync

#renovate: datasource=github-releases depName=kopia/kopia
ARG KOPIA_VERSION=0.22.3
RUN curl -o /tmp/kopia.tar.gz --fail -sSL https://github.com/kopia/kopia/releases/download/v${KOPIA_VERSION}/kopia-${KOPIA_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz && \
    tar -xzf /tmp/kopia.tar.gz -C /tmp && \
    mv /tmp/kopia-${KOPIA_VERSION}-${TARGETOS}-${TARGETARCH}/kopia /usr/local/bin/kopia && \
    chmod a+x /usr/local/bin/kopia && \
    rm -rf /tmp/kopia*

CMD ["sh"]