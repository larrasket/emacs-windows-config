
if [ -n "$INSIDE_EMACS" ]; then

	    export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

fi



export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"


alias gitt='cd aur && git clone'
alias post='/home/ghd/me/temp/page/app/GetFilesForPosting'
alias camera="mplayer -tv device=/dev/video1 tv://"
alias lib='libgen -s'
alias pubb1='hugo -t  lines && cd public && git add . &&  git commit -m \"update\" && git push origin master '
alias pub1='git add . && git commit -m update && git push origin latest_branch'
alias pub='pub1 && pubb1'
alias mic='ncpamixer'
alias wife='nmtui'
alias n='cd books/notes'
alias hd='nmcli con up'
alias pro='cd /Documents/prop'
alias s='setsid rsblocks '
alias mynet='sudo netstat -atupen'
alias vi='nvim'
alias c='clear'
alias sv='sudo vim'
alias smk='sudo make clean install'
alias imk='makepkg -si'
alias update='sudo pacman -Syu'
alias i='sudo pacman -S '
alias r='sudo pacman -R'
alias host='sv /etc/hosts'
alias ls='ls --color=auto'
alias doom='~/.emacs.d/bin/doom'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias pss='keepassxc'
alias f="lfrun"
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias d='yt-dlp -o '\''%(title)s.%(ext)s'\'' '
alias todo='v ~/org/todo.org'
alias ds='yt-dlp -f 136 -o  '\''%(title)s.%(ext)s'\'' '
alias dss='yt-dlp -f '\''bestvideo[height<=480]+bestaudio/best[height<=480]'\''  --write-auto-sub -o  '\''%(title)s.%(ext)s'\'' '
alias mp3='yt-dlp -o '\''%(title)s.%(ext)s'\'' --extract-audio --audio-format mp3 --add-metadata'
unset use_color safe_term match_lhs sh
alias mvi='mpv --config-dir=$HOME/.config/mvi'
alias mva='mpv --config-dir=$HOME/.config/mvi *jpg *png *gif *webp *tiff *raw *bmp *svg'
alias po='castero'
alias run='rm -r ~/source/Politics'
alias cin='vi ~/blog/content/cinema.md'
alias bin='vi ~/blog/content/books.md'
alias you='lf-yt'
alias p='kitty +kitten icat'
alias ls='ls -l'
alias ll='exa'
alias vim='nvim'
alias e=emacs
alias v='vi'
alias a='v ~/org/todo.org'
alias sz='du -sh'
alias msd='cd ~/me/music/l/'
alias t='v ~/me/temp/x.cpp'
alias k='killall'
alias htop='gotop'
alias tori='tordl'
alias send='tar -cz . | nc -q 10 -l -p 9090'
alias rec='nc -w 10 192.168.1.6 9090 | tar -xz'
alias shut='shutdown -P '
alias psql='sudo -iu postgres && psql'
alias mincraft='prime-run /usr/bin/java -jar /opt/tlauncher/tlauncher.jar'
alias netwatch='sudo nethogs'
alias cat='highlight -O ansi --force'
alias scriptcs='cscs'
alias z='zathura'

