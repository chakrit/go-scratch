#!/usr/bin/make

PKG := .

.PHONY: default all vet test deps

default: test

all: build
build: deps
	./go build $(PKG)
vet: deps
	./go vet $(PKG)
fmt:
	./go fmt $(PKG)
test: deps
	./go test $(PKG)
clean:
	./go clean $(PKG)
deps:
	./go get -d $(PKG)

