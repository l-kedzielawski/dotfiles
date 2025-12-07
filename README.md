My personal Linux configuration files managed with **GNU Stow**.  
These dotfiles are used on Fedora/Kali with zsh, tmux, Neovim, and OpenCode.

## Included Configurations

```

dotfiles/
├── zsh/.zshrc
├── tmux/.tmux.conf
├── nvim/.config/nvim/
└── opencode/.config/opencode/opencode.json

````

## Installation

Clone the repository:

```bash
git clone https://github.com/<YOUR_USERNAME>/dotfiles ~/dotfiles
cd ~/dotfiles
````

Install the configs using GNU Stow:

```bash
stow zsh
stow tmux
stow nvim
stow opencode
```


Edit your config files normally:

* `~/.zshrc`
* `~/.tmux.conf`
* `~/.config/nvim/`
* `~/.config/opencode/opencode.json`



## Requirements

* GNU Stow
* zsh
* tmux
* Neovim
* OpenCode

