#!/usr/bin/make

PKG := .
BIN := $(shell basename `pwd`)
GO  := $(realpath ./go)

.PHONY: %

default: test

all: build
build: deps
	$(GO) build $(PKG)
lint: vet
vet: deps
	$(GO) get code.google.com/p/go.tools/cmd/vet
	$(GO) vet $(PKG)
fmt:
	$(GO) fmt $(PKG)
test: test-deps
	$(GO) test $(PKG)
cover: test-deps
	$(GO) test -cover $(PKG)
clean:
	$(GO) clean -i $(PKG)
clean-all:
	$(GO) clean -i -r $(PKG)
deps:
	$(GO) get -d $(PKG)
test-deps:
	$(GO) get -d -t $(PKG)
run: all
	./$(BIN)

