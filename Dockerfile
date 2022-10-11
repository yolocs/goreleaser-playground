FROM --platform=$BUILDPLATFORM golang:1.19 AS builder

ENV PORT=8080
ENV CGO_ENABLED=0
ENV GOPROXY=https://proxy.golang.org,direct

WORKDIR /go/src/app
COPY . .

RUN go build \
  -a \
  -trimpath \
  -ldflags "-s -w -extldflags='-static'" \
  -o /go/bin/foo \
  ./cmd/foo

RUN strip -s /go/bin/foo

RUN echo "nobody:*:65534:65534:nobody:/:/bin/false" > /tmp/etc-passwd

# Use a scratch image to host our binary.
FROM scratch
COPY --from=builder /tmp/etc-passwd /etc/passwd
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/bin/foo /foo
USER nobody

EXPOSE 8080
ENTRYPOINT ["/foo"]