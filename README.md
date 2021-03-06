OpenSSH
=======

Homebrew formulas for OpenSSH with improved randomart.

<img width="682" alt="eyecatch of ssh with feline randomart" src="https://user-images.githubusercontent.com/1256587/110200282-ca8d8100-7e65-11eb-8d0f-b765f77876f6.png">

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

Note that it **conflicts** with the vanilla `openssh`
which you'll need to either uninstall or unlink:

```bash
brew unlink openssh
```

After installation you would want to start the `ssh-randomartd` service:

```bash
brew services start ssh-randomartd
```

## Configuration

See [~ilammy/ssh-randomartd](https://git.sr.ht/~ilammy/ssh-randomartd) repo
for documentation.

## License

Formulas are distributed under the [BSD 2-clause license](LICENSE).

Individual software packages have their own terms, see `brew info`.
