
# GOLANG project template

This is my personal go-lang project template.
It is built with these 2 goals in mind:

* Everything should be local to the development folder as much as is possible without
  resorting to ugly hacks.

* N-step build without any special setup after any `git clone` on a newly minted machine
  except for installing the `go` compiler itself.

* Do not rely on global `GOPATH` and yet still allows you to check your entire source
  folder in as if you would a normal go program. This makes your repository still plays
  well with other go coders and global `GOPATH` convention.

# Makefile

Everything is done through the `Makefile` for convenience. A wrapper script `./go` is also
provided that invokes `go` with `GOPATH` sets to the local `.go` folder.

Makefile tasks defaults to `all` and `vet`. The `all` is simply an alias for the `build`
task. All common tasks you'd do with `go` is written the same way with regards to the
Makefile so `go vet` is, through the Makefile, `make vet`.

# Dependencies

Special Makefile task `deps` and the list file `deps.list` is provided to list all the
required go-lang import paths you need in your project.

Running `make deps` will result in calling `go get` for each of the dependencies listed in
the `deps.list` file.

# Sample

Here's a sample output of what happens when you simply cloned this gist and issue `make`:

```
$ make
./go vet .
./go get github.com/gorilla/mux github.com/gorilla/context
./go build .
```

Basically it automatically `go get` any missing dependencies for you and then invokes the
build command with the local folder.

# TODO:

* Package this into a script.

# LICENSE:

[WTFPL](http://www.wtfpl.net/)

