# Use a scratch image to host our binary.
FROM scratch
COPY foo /foo
ENTRYPOINT ["/foo"]
