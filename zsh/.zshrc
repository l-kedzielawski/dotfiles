###############################################
# BASIC ENV & ALIASES
###############################################

export EDITOR="nvim"
alias vim="nvim"

alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate'

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history               # share history between sessions
setopt hist_ignore_all_dups        # no duplicate entries
setopt hist_reduce_blanks          # trim extra spaces

# Quality-of-life options
setopt autocd                      # 'cd dir' just by typing 'dir'
setopt correct                     # typo correction on commands
setopt extended_glob
setopt interactive_comments        # allow comments in command line

bindkey -e                         # Emacs-style keybindings (default)


###############################################
# COMPLETION SYSTEM
###############################################

autoload -Uz compinit
compinit

# Load completion list / menu system (creates the "menuselect" keymap)
zmodload -i zsh/complist

# Enable menu selection so you can move through matches
zstyle ':completion:*' menu select

###############################################
# AUTOSUGGESTIONS
###############################################

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Make autosuggestions slightly dim so they don't shout
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


###############################################
# SYNTAX HIGHLIGHTING (MUST BE LAST PLUGIN)
###############################################

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ---- PATH HIGHLIGHTING BEHAVIOUR ----
# Valid paths = bold cyan
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'

# Typo / incomplete / unknown stuff = red (non-bold)
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=red'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'


###############################################
# PROMPT (GIT-AWARE, SIMPLE, FAST)
###############################################

autoload -Uz vcs_info

precmd() {
  vcs_info                             # refresh git info before each prompt
}

zstyle ':vcs_info:git:*' formats '%F{yellow}[%b]%f '  # [branch]

setopt prompt_subst

# Example:  lukas@fedora ~/code/project [main] %
PROMPT='%F{green}%n@%m%f %F{blue}%~%f ${vcs_info_msg_0_}%# '


# Tab = completion, Shift+Tab = go back
bindkey "^I" expand-or-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete



# opencode
export PATH=/home/gigabear/.opencode/bin:$PATH
