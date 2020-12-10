#!/bin/sh
VERSION=2.0.0a
echo ${VERSION}

rm -rf ./dest/*

# go get
# go build -v -o dest/packer-provisioner-goss-${VERSION}-windows-amd64

for GOOS in darwin linux windows; do
  for GOARCH in 386 amd64; do
    export GOOS GOARCH
      echo Build ${GOOS}/${GOARCH} appication...
      # go get -v ./...
      go get
      go build -v -o dest/packer-provisioner-goss-${VERSION}-$GOOS-$GOARCH
  done
done