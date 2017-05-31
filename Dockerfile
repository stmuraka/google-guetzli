FROM alpine
MAINTAINER Shaun Murakami (stmuraka@gmail.com)
RUN apk update \
 && apk upgrade \
 && apk add \
        git \
        libpng-dev \
        build-base \
 && rm -rf /var/cache/apk/*

ENV GIT_URL="https://github.com/google/guetzli.git"
# Download source
RUN mkdir /opt
WORKDIR /opt
RUN git clone ${GIT_URL}
WORKDIR /opt/guetzli
RUN make
RUN ln -s /opt/guetzli/bin/Release/guetzli /usr/bin/guetzli
ENTRYPOINT ["guetzli"]
RUN mkdir -p /root/images
WORKDIR /root/images
VOLUME /root/images
