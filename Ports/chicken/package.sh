#!/usr/bin/env -S bash ../.port_include.sh
port='chicken'
version='5.3.0'
useconfigure='false'
files=(
    "https://code.call-cc.org/releases/${version}/chicken-${version}.tar.gz c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76"
)

build() {
    run make PREFIX=/usr/local \
             PLATFORM=cross-linux-serenity \
             HOSTSYSTEM="${SERENITY_ARCH}-pc-serenity" \
             DESTDIR=$PORT_BUILD_DIR/target

    run make PLATFORM=serenity \
             TARGETSYSTEM="${SERENITY_ARCH}-pc-serenity" \
             TARGET_PREFIX=$PORT_BUILD_DIR/target/usr/local \
             TARGET_RUN_PREFIX=/usr/local
}

install() {
    run make PLATFORM=cross-linux-serenity \
             TARGETSYSTEM="${SERENITY_ARCH}-pc-serenity" \
             TARGET_PREFIX=$PORT_BUILD_DIR/target/usr/local \
             TARGET_RUN_PREFIX=/usr/local \
             DESTDIR=$DESTDIR \
             install
}