export PATH=/usr/local/bin:/usr/local/sbin:$PATH
source .apikeys.sh
#shell vars
#PS1='\w$(__git_ps1 " (%s)")$ '
#PS2=' $ '
HISTCONTROL=ignoreboth
export CLICOLOR=2
export LSCOLORS=ExFxBxDxCxegedabagacad

# env vars
export GS_DEVICE=pdfwrite
export ASYMPTOTE_PSVIEWER=open
export TERM=xterm-256color
alias emacsclient=ec # from http://emacsformacosx.com/tips
export EDITOR=vim
export GREP_COLOR='37;41;1' ##

#export UAHOME=/afs/ualberta.ca/home/a/s/ashander/
#export IGERT=$HOME/Dropbox/IGERT/Modeling/

alias t='$HOME/Dropbox/todos/todo.sh'
alias tl='t ls'
alias tl+='t ls +'
alias tlw='t ls @week'
alias tld='t ls @day'
alias eg='egrep --color'
alias th='t -d $HOME/MSC/todo.cfg'
alias thl='th ls'

alias gt='growltimer'

alias wget='curl -O'

alias hibernateon='sudo pmset -a hibernatemode 5'
alias hibernateoff='sudo pmset -a hibernatemode 0'
alias hibernatedefault='sudo pmset -a hibernatemode 7'

# bash comp
source $HOME/.bash_completion.d/smt-complete.sh
source $HOME/.bash_completion.d/git-completion.bash
source $HOME/.git-prompt.sh

## virtualenv stuff
export WORKON_HOME=~/.virtualenvs
source $HOME/.local/bin/virtualenvwrapper_lazy.sh

alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv'
alias v.mk_withglobalsitepackages='mkvirtualenv --system-site-packages'
alias v.mk3_withglobalsitepackages='mkvirtualenv --system-site-packages -p /usr/local/bin/python3'
alias v.mk3='mkvirtualenv -p /usr/local/bin/python3'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

# for pipsi, pip install --user etc
export PATH=~/.local/bin:$PATH

# r devtools aliases
alias dv.install='Rscript -e "devtools::install()"'
alias dv.test='Rscript -e "devtools::test()"'
alias dv.check='Rscript -e "devtools::check()"'
alias dv.doccheck='Rscript -e "devtools::check_doc()"'
alias dv.build='Rscript -e "devtools::build()"'
