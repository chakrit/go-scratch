
# GOLANG project template

This is my personal [GOLANG](http://golang.org/) project template.
It is built with these goals in mind:

* Everything should be local to the development folder as much as is possible without
  resorting to ugly hacks.

* N-step build without any special setup after any `git clone` on a newly minted machine
  except for installing the `go` compiler itself.

* Do not rely on global `GOPATH` and yet still allows you to check your entire source
  folder in as if you would a normal go program. This makes your repository still plays
  well with other go coders and global `GOPATH` convention.

# Getting Started

Run this one-liner to dump the repository content into current directory.

```sh
curl -L https://github.com/chakrit/go-scratch/archive/master.tar.gz | tar -xzv --strip 1
```

Or a full setup for a new project:

```sh
mkdir your-new-shiny-project    # Make a new shiny folder for your new project.
cd your-new-shiny-project       # Get into the folder first, of course.
git init                        # Or not, doesn't matter.

# Download the scratch template
curl -L https://github.com/chakrit/go-scratch/archive/master.tar.gz | tar -xzv --strip 1

git add .
git commit -m "Initialize GOLANG project. (github.com/chakrit/go-scratch)"
```

# Makefile

Everything is done through the `Makefile` for convenience. A wrapper script `./go` is also
provided that invokes `go` with `GOPATH` sets to the local `.go` folder.

Makefile tasks defaults to `test`. The `all` task is simply an alias for the `build`
task. All common tasks you'd do with `go` is given the same name in the Makefile so
`go vet` is, through the Makefile, `make vet` or via the wrapper script `./go vet`.

# Dependencies

Dependencies are handled implicitly and automatically as you run tasks that involve import
paths thanks to the powerful scanning capability of the `go list` commands.

Specifically, `make deps` and `make test-deps` will invoke the scanning and then
`go install` will be used to install each and every import depdencies found. This is
however, not required as tasks that requires dependencies will automatically runs them
first.

The initial `main.go` file provided with this project contains some dependencies as well
as tests (and test dependencies) to demonstrate this.

### Subpackages

This template is meant to be used for a single-package project. However you can still use
this with multiple subpackages quite easily via one of the following way:

* Override `PKG` variable before running make targets to target a specific subpackage
  (`PKG` is the import path passed to the `go` tool, defaults to `.`)
* Create a dummy `go` source file in the root package that implicitly references all
  subpackages.

For example, if you have a `context` subpackage, you can run its tests like so:

```sh
$ make test PKG=./context
```

# Sample

Here's a sample output of what happens when you simply cloned this repository and issue
`make`:

```sh
$ make
./go get -d -t .
./go install github.com/kylelemons/go-gypsy/yaml # ... and other dependencies
./go test .
ok      _/Users/chakrit/Documents/go-scratch    0.011s
```

### Silent run

Uses `make`'s `-s` flag to prevent `make` from echoing commands (useful for reducing
clutter to standard output.)

```sh
$ make -s
ok      _/Users/chakrit/Documents/go-scratch    0.011s
```

# TODO:

* Package the curl installation into a script.

# LICENSE:

[WTFPL](http://www.wtfpl.net/)

