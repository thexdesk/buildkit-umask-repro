FROM alpine
ADD https://raw.githubusercontent.com/h2o/h2o/master/share/h2o/setuidgid /usr/local/bin/
RUN apk add --no-cache perl && chmod +x /usr/local/bin/setuidgid
COPY scripts /scripts
RUN adduser -D newuser
