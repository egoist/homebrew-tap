# Egoist Tap

## Casks

- [`postcat`](https://github.com/egoist/postcat) — keyboard-first API client in your terminal
- [`kero`](https://kero.sh) — keyboard-first terminal workspace

```sh
brew install --cask egoist/tap/postcat
```

Installs as the `pcat` command (not `postcat`), since `postcat` already
names the Postfix mail-queue viewer that ships on most systems.

```sh
brew install egoist/tap/kero
```

kero updates itself in-app via [Sparkle](https://sparkle-project.org), so
`brew upgrade` normally has nothing to do. To make Homebrew reinstall the
version pinned here anyway:

```sh
brew upgrade --greedy kero
```

## All formulae

- [`aho`](https://github.com/egoist/aho)
- [`dum`](https://github.com/egoist/dum)

## How do I install these formulae?

`brew install egoist/tap/<formula>`

Or:

`brew tap egoist/tap` and `brew install <formula>`

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
