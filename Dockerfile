FROM alpine

RUN apk add --no-cache curl jq gnupg

RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
