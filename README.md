# Dotfiles

*working on **new** neovim lua config in [`new-nvim-22`](https://github.com/nozwock/dotfiles/tree/new-nvim-22) branch (not merged)*

[db-link]: https://github.com/anishathalye/dotbot
[db-shield]: https://img.shields.io/badge/powered%20by-dotbot-blue?style=flat&color=32a852&labelColor=1d212a
[repo-size]: https://img.shields.io/github/repo-size/nozwock/dotfiles?style=flat&label=repo-size&color=blueviolet&labelColor=1d212a

The dotfiles are optimal for **arch/arch-based** distros; & so there might be some configs which aren't distro agnostic atm.

*damnit i should just use stow huh?...*

## Usage

*Prerequisites: python, git*

```sh
git clone https://github.com/nozwock/dotfiles.git .dotfiles --recursive
cd .dotfiles
```

### For installing a predefined profile:

```bash
./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles

### For installing single configurations:

```bash
./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

---
#### Conventional Commits custom types \*-\*
`new, change, fix, docs`

---
#### terminal tools I need/use
- nvim, zsh, zellij
- exa, fd, fzf, rg
