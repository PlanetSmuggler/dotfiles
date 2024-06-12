# ZSH config by PlanetSmuggler

# History

export HISTFILE="~/.config/zsh/.zhistory"
export HISTSIZE=15000
export SAVEHIST=15000
unsetopt HIST_SAVE_NO_DUPS

# Plugin Management using zsh_unplugged

if [[ ! -d ~/.config/zsh/plugins/zsh_unplugged ]]; then
	git clone --quiet https://github.com/mattmc3/zsh_unplugged ~/.config/zsh/plugins/zsh_unplugged
fi
source ~/.config/zsh/plugins/zsh_unplugged/zsh_unplugged.zsh
plugins=(zdharma-continuum/fast-syntax-highlighting zsh-users/zsh-autosuggestions)
plugin-load $plugins
eval "$(starship init zsh)"

# Completions

if [[ ! -d ~/.config/zsh/plugins/zsh-completions ]]; then
	git clone --quiet https://github.com/zsh-users/zsh-completions ~/.config/zsh/plugins/zsh-completions
fi
fpath=(~/.config/zsh/plugins/zsh-completions $fpath)
zmodload zsh/complist
autoload compinit; compinit -i -d ~/.config/zsh/.zcompdump

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.config/zsh/.zcompcache"
zstyle ':completion:*' complete true
zstyle ':completion:*' menu select
zstyle ':completion:*' file-list all
zstyle ':completion:*:*:cp:*' file-sort size

zstyle ':completion:*' squeeze-slashes true # Converts // to / in case of mistakes in path
zstyle ':completion:*' complete-options true

# options
setopt globdots
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
unsetopt BEEP

# Vi Mode

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forwar-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^I' complete-word
bindkey '^[[Z' autosuggest-accept
