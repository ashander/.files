ls -a $HOME/dotfiles/ | grep '^\.[a-zA-Z]' | xargs -I{} ln -s $HOME/dotfiles/{} {}
