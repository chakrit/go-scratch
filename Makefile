#!/usr/bin/make

PKG := .
BIN := $(shell basename `pwd`)
GO  := ./go

DEPS      := $(shell $(GO) list -f '{{join .Deps "\n"}}' $(PKG) | grep -v "^_")
TEST_DEPS := $(DEPS) $(shell $(GO) list -f '{{join .TestImports "\n"}}' $(PKG) | grep -v "^_")

.PHONY: default all vet test deps lint

default: test

all: build
build: deps
	$(GO) build -v $(PKG)
lint: vet
vet: deps
	$(GO) vet $(PKG)
fmt:
	$(GO) fmt $(PKG)
test: test-deps
	$(GO) test $(PKG)
cover: test-deps
	$(GO) test -cover $(PKG)
clean:
	$(GO) clean $(PKG)
deps:
	$(GO) get -d $(PKG)
	$(GO) install $(DEPS)
test-deps:
	$(GO) get -d -t $(PKG)
	$(GO) install $(TEST_DEPS)
run: all
	./$(BIN)

