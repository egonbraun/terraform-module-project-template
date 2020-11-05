FROM golang:1.15.3-buster

LABEL "maintainer" = "Egon Braun <egonbraun@gmail.com>"

ENV PATH="/go/bin:/opt/tfenv/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

VOLUME /go/src/module

WORKDIR /go/src/module

RUN apt update        && \
    apt install unzip && \
    apt autoclean

RUN git clone https://github.com/tfutils/tfenv.git /opt/tfenv

ENTRYPOINT ["/go/src/module/entrypoint.sh"]
