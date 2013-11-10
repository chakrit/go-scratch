#!/usr/bin/make

PKG := .

.PHONY: default all vet test deps

default: vet build

all: build
build: deps
	./go build $(PKG)
vet:
	./go vet $(PKG)
fmt:
	./go fmt $(PKG)
test: all
	./go test $(PKG)
clean:
	./go clean $(PKG)

# read in a list of dependencies
deps:
	./go get $(shell cat deps.list)

