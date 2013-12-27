#!/usr/bin/make

PKG := .
BIN := $(shell basename `pwd`)

DEPS      := $(shell ./go list -f '{{join .Deps "\n"}}' . | grep -v "^_")
TEST_DEPS := $(DEPS) $(shell ./go list -f '{{join .TestImports "\n"}}' . | grep -v "^_")

.PHONY: default all vet test deps lint

default: test

all: build
build: deps
	./go build -v $(PKG)
lint: vet
vet: deps
	./go vet $(PKG)
fmt:
	./go fmt $(PKG)
test: test-deps
	./go test $(PKG)
clean:
	./go clean $(PKG)
deps:
	./go get -d $(PKG)
	./go install $(DEPS)
test-deps:
	./go get -d -t $(PKG)
	./go install $(TEST_DEPS)
run: all
	./$(BIN)

