FROM alpine:3.2
RUN apk add --update ca-certificates
ADD http://github.com/tsenart/vegeta/releases/download/v5.9.0/vegeta-v5.9.0-linux-amd64.tar.gz /go/bin/vegeta.tar.gz
RUN cd /go/bin && tar xzvf /go/bin/vegeta.tar.gz 
RUN chmod +x /go/bin/vegeta
RUN ln -s /go/bin/vegeta /usr/local/bin/vegeta

ENTRYPOINT ["/go/bin/vegeta"]
