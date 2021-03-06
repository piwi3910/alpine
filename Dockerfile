ARG VERSION=default

FROM alpine:${VERSION}

RUN apk update --no-cache &&\
    apk upgrade &&\
    apk add --no-cache \
    tzdata \
    bash \
    bash-completion \
    ca-certificates \
    openssl &&\
    echo "" > /root/.ash_history

# change default shell from ash to bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# run ca-cert updates
RUN update-ca-certificates

ENV LC_ALL=en_US.UTF-8    
