FROM ekidd/rust-musl-builder as builder

WORKDIR /home/rust/

# Avoid having to install/build all dependencies by copying
# the Cargo files and making a dummy src/main.rs
COPY src src 
COPY Cargo.toml .
COPY Cargo.lock .
RUN cargo build --release

# Size optimization
RUN strip target/x86_64-unknown-linux-musl/release/tool

# Start building the final image
FROM alpine 
RUN apk update && apk add openssl 
WORKDIR /home/rust/
COPY --from=builder /home/rust/target/x86_64-unknown-linux-musl/release/tool .
ENTRYPOINT ["./tool"]
