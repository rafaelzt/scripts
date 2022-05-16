HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export PATH=/home/rafael/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias
alias ls="exa -lhg --icons"
alias cat="bat"

# Key Bindings (showkey -a)
bindkey "\eOA"    up-line-or-history
bindkey "\eOB"    down-line-or-history
bindkey "\eOC"    forward-char
bindkey "\eOD"    backward-char
bindkey "\e[3~"   delete-char
bindkey "\x7f"    backward-delete-char
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line

cd
