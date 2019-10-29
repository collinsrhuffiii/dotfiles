# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# suggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
export LC_ALL=en_US.UTF-8

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/ch/go/bin
export PATH=$PATH:/home/.cargo/bin

source /home/ch/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
