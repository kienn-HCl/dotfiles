CAview --rule $(( RANDOM % 256 ))

#save history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history histignorealldups

# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
DIRSTACKSIZE=100
setopt auto_pushd

## 同じディレクトリを pushd しい
setopt pushd_ignore_dups

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# コマンドの打ち間違いを指摘してくれる
# setopt correct

#-- Do not sound --#
setopt nolistbeep

#-- Make colors available --#
autoload -Uz colors
colors

#補完候補を詰めて表示
#setopt list_packed

## 補完候補一覧でファイルの種別をマーク表示
#setopt list_types

## 補完候補を一覧表示
#setopt auto_list

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# wsl関連
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

#OPENcomand
function open() {
    if [ $# != 1 ]; then
        explorer.exe .
    else
        if [ -e $1 ]; then
            cmd.exe /c start $(wslpath -w $1) 2> /dev/null
        else
            echo "open: $1 : No such file or directory" 
        fi
    fi
}

#GO
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:~/go/bin

#powerline
#function powerline_precmd() {
#    PS1="$(/usr/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
#
#    # Uncomment the following line to automatically clear errors after showing
#    # them once. This not only clears the error for powerline-go, but also for
#    # everything else you run in that shell. Don't enable this if you're not
#    # sure this is what you want.
#
#    #set "?"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ] && [ -f "/usr/bin/powerline-go" ]; then
#    install_powerline_precmd
#fi

#alias
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias :q='exit'

#BROWSER
export BROWSER=$(which firefox)

# zplug読み込み
source /usr/share/zsh/scripts/zplug/init.zsh

## ここにプラグインを書き込む ##
#コマンドのハイライト
zplug "zsh-users/zsh-syntax-highlighting"

#過去履歴強化
zplug "zsh-users/zsh-history-substring-search"

#履歴サジェスト
zplug "zsh-users/zsh-autosuggestions"

#補完強化
zplug "zsh-users/zsh-completions"

#cdの強化
#zplug "b4b4r07/enhancd", use:init.sh

# インストールされていないプラグインがあったらインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

# シェル操作をvim互換にする
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode

#python
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#ruby
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init - zsh)"

#deno
#export DENO_INSTALL="$HOME/.deno"
#export PATH="$DENO_INSTALL/bin:$PATH"

#neovim
export XDG_CONFIG_HOME="$HOME/.config"

#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d,l -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d,l 2> /dev/null | fzf +m) && cd "$dir"
}

source /usr/share/doc/pkgfile/command-not-found.zsh

#add completions
fpath=(~/dotfiles/zshcompletion $fpath)

# starship init
eval "$(starship init zsh)"

# asdf
source /opt/asdf-vm/asdf.sh
