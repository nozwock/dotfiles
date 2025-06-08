# Dotfiles

These dotfiles are for my Arch-based system, and so there might be some stuff which isn't distribution agnostic.

Management of dotfiles is currently being done using [dotbot].

*I should just use stow huh?...*

## Usage

*Prerequisites: python, git*

```sh
git clone https://github.com/nozwock/dotfiles.git .dotfiles --recursive
cd .dotfiles
```

#### For installing a predefined profile

```bash
./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles

#### For installing individual configurations

```bash
./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

> [!TIP]
> Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.\
> *DO NOT* run the script directly with sudo.

---

#### Tooling

```
nvim, zsh, zellij, exa, fd, fzf, rg, delta, dust
```

TODO: Maybe have a script to install my usual tooling.


[dotbot]: https://github.com/anishathalye/dotbot
