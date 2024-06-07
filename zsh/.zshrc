# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH config by PlanetSmuggler

export HISTFILE="~/.config/zsh/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Plugin Management using zsh_unplugged

if [[ ! -d ~/.config/zsh/plugins/zsh_unplugged ]]; then
	git clone --quiet https://github.com/mattmc3/zsh_unplugged ~/.config/zsh/plugins/zsh_unplugged
fi

source ~/.config/zsh/plugins/zsh_unplugged/zsh_unplugged.zsh

plugins=(
	zdharma-continuum/fast-syntax-highlighting
	zsh-users/zsh-autosuggestions
	romkatv/powerlevel10k
)

plugin-load $plugins

# Completions

if [[ ! -d ~/.config/zsh/plugins/zsh-completions ]]; then
	git clone --quiet https://github.com/zsh-users/zsh-completions ~/.config/zsh/plugins/zsh-completions
fi
fpath=(~/.config/zsh/plugins/zsh-completions $fpath)

zmodload zsh/complist
autoload compinit; compinit -i -d ~/.config/zsh/.zcompdump

_comp_options+=(globdots)

setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
unsetopt BEEP

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

zstyle ':completion:*' complete true
zstyle ':completion:*' menu select

bindkey '^I'   complete-word
bindkey '^[[Z' autosuggest-accept
bindkey -v

export KEYTIMEOUT=1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
