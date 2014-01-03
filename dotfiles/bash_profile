# .bash_profile

export PATH=/Users/icarus4/bin:/Users/icarus4/usr/bin:/usr/local/bin:$PATH
export GREP_COLOR='31'

# Function
function git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
	echo "("${ref#refs/heads/}") ";
}

# wcgrep
function wcg {
	grep --color=always -R $1 * | grep -v .svn | grep -v "~" | grep -v ".pyc" | grep -v Binary
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

PS1='\[\033[0;92m\]\u\[\033[0;31m\]@\[\033[0;93m\]\W \[\033[0;96m\]$(git_branch)\[\033[0m\]\$ '

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# IP
alias ip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# Enable color
export CLICOLOR=1

# Setup color scheme for list
#export LSCOLORS=ExFxCxDxBxegedabagacad

# Enable color for iTerm
#export TERM=xterm-color

# Setup ls
#alias ls=`ls -vG`
#alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lt='ls -t'
alias llt='ls -lt'

# Git
alias s='git status'
alias b='git branch'
alias co='git checkout'
alias ci='git commit'
alias gl='git log'

# less
alias less='less -R'
alias tree='tree -C'

# cd
alias p='pwd'
alias j='cd'
alias f='ls'
alias t='cd ..;pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

# grep
alias grep='grep --color=always'

# Source .bash_profile
alias reload='. ~/.bash_profile'
