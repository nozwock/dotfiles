# Dotfiles

![repo-size]
[![Powered by dotbot][db-shield]][db-link]

[db-link]: https://github.com/anishathalye/dotbot
[db-shield]: https://img.shields.io/badge/powered%20by-dotbot-blue?style=flat&color=32a852&labelColor=1d212a
[repo-size]: https://img.shields.io/github/repo-size/nozwock/dotfiles?style=flat&label=repo-size&color=blueviolet&labelColor=1d212a

## :fire: Usage

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
