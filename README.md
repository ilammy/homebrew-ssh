OpenSSH
=======

Homebrew formulas for OpenSSH with improved randomart.

<img width="682" alt="eyecatch of ssh with feline randomart" src="https://user-images.githubusercontent.com/1256587/110201956-7c30b000-7e6e-11eb-90ec-72a219fc5d1d.png">

## Installation

This tap is not a part of the core Homebrew repo
so you will need to add it manually first:

```bash
brew tap ilammy/ssh
```

Then you can install the latest release:

```bash
brew install openssh-randomart
```

### Caveats

Note that `openssh-randomart` **conflicts** with vanilla `openssh`.
If you have it, you'll need to either uninstall or unlink it:

```bash
brew unlink openssh
```

After installation you'd like to start the `ssh-randomartd` service:

```bash
brew services start ssh-randomartd
```

And you'd want to put this into your `~/.ssh/config`:

```
# Display randomart for connections
VisualHostKey=yes
```

## Documentation

See [**~ilammy/ssh-randomartd**](https://git.sr.ht/~ilammy/ssh-randomartd).

## License

Formulas are distributed under the [**BSD 2-clause** license](LICENSE).

Individual software packages have their own terms, see `brew info`.
