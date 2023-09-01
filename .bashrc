    case $- in
        *i*) ;;
          *) return;;
    esac

    HISTCONTROL=ignoreboth

    shopt -s histappend

    HISTSIZE=1000
    HISTFILESIZE=2000

    shopt -s checkwinsize

    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            color_prompt=yes
        else
            color_prompt=
        fi
    fi

    PROMPT_ALTERNATIVE=twoline
    NEWLINE_BEFORE_PROMPT=yes

    if [ "$color_prompt" = yes ]; then
        # override default virtualenv indicator in prompt
        VIRTUAL_ENV_DISABLE_PROMPT=1

        prompt_color='\[\033[;32m\]'
        info_color='\[\033[1;34m\]'

        # prompt_symbol=㉿
        # prompt_symbol='✌  '
        # prompt_symbol='󱚦  '
        # prompt_symbol=' '
        # prompt_symbol='   '
        # prompt_symbol='  '
        # prompt_symbol='👄 '
        prompt_symbol='🍺 '
        # prompt_symbol='  '

        if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
            prompt_color='\[\033[;94m\]'
            info_color='\[\033[1;31m\]'
        fi
        case "$PROMPT_ALTERNATIVE" in
            twoline)
                # PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'Gos'$prompt_symbol'\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] ';;
                PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'Gos'$prompt_symbol'\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'╰─>'$info_color'\[\033[0m\] ';;
            oneline)
                PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}'$info_color'\u@\h\[\033[00m\]:'$prompt_color'\[\033[01m\]\w\[\033[00m\]\$ ';;
            backtrack)
                PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
        esac
        unset prompt_color
        unset info_color
        unset prompt_symbol
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    [ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"

    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

        alias ls='ls --color=auto'
        alias dir='lsd --group-directories-first --icon=never --date=relative --blocks permission,user,date,context,name,size'
        alias mkdir='mkdir -v'
        alias rm='rm -v'
        # alias dir='ls -ino --group-directories-first --color=auto'
        
        alias Home='cd ~/'
        alias Rumah='cd ~/'
        alias Omah='cd ~/'
        alias Pekerjaan='sudo cd /media/gendon/Pekerjaan/Pekerjaan/'
        
        alias Clean='sudo apt clean'
        alias Autoremove='sudo apt autoremove -y'
        alias Update='sudo apt update -y'
        alias Upgrade='sudo apt upgrade -y'
        alias UPUP='Update && Upgrade && Autoremove && Clean'
        alias UPUPc='Update && Upgrade && Autoremove && Clean && cls'
        alias startMongodb='sudo systemctl start mongod && sudo systemctl status mongod'
        alias stopMongodb='sudo systemctl stop mongod'
        alias statusMongodb='sudo systemctl status mongod'
        alias startXampp='sudo /opt/lampp/xampp start'
        alias stopXampp='sudo /opt/lampp/xampp stop'
        alias youtube='yt'

        alias bn='cd ..'
        alias 2bn='cd ../..'
        alias 3bn='cd ../../..'
        alias :q='exit'

        alias cls='clear'
        alias El='cd /media/gendon/Pekerjaan/Pekerjaan/Gambar/El'
        alias Aku='cd /media/gendon/Pekerjaan/Pekerjaan/Gambar/Aku'
        alias Downloads='cd ~/Downloads'
        alias Pekerjaan='cd /media/gendon/Pekerjaan/Developer/Program'
        alias Tugas='cd /media/gendon/Tugas'
        alias Latihan='cd ~/Documents/Latihan'
        alias latihanEl='cd ~/Documents/Latihan/El'
        alias latihanGos='cd ~/Documents/Latihan/Gos'
        alias Kursus='cd ~/Documents/Latihan/El/Kelas MERN Stack/kursus'
        alias Liver='live-server'
        alias Suhu='curl v2n.wttr.in/Yogyakarta'
        
        alias python='python3.10'

        #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


source <(ng completion script)

export PATH="$HOME/.local/bin:$PATH"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export PATH=/home/gendon/anaconda3/condabin:/home/gendon/.local/bin:/home/gendon/.local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin:/home/gendon/.dotnet/tools:/home/gendon/anaconda3/bin:/home/gendon/.cargo/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gendon/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gendon/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gendon/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gendon/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Jalankan Tmux saat startup
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi

PROMPT_DIRTRIM=1

# NEOFETCH
# neofetch --chafa ~/Downloads/BlackGos.png --size 360px
neofetch
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
