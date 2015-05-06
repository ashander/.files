echo "This will delete the following in" $HOME ":"
ls -a $HOME/.files/ | grep '^\.[a-zA-Z]' | grep -v '.gitignore' | grep -v '^.git$'
echo "and replace them with simlinks to this directory."
# confirmation snippet from http://stackoverflow.com/a/3232082
read -r -p "Are you sure? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])
	for file in .* .*/; do
		if [[ $file =~ .gitignore ]]; then
			break;
		elif [[ $file =~ ^.git$ ]]; then
			break;
		elif [[ $file =~ ^\.[a-zA-Z] ]]; then
			rm  $HOME/$file
			ln -s $HOME/.files/$file $HOME/$file
		else
			continue
		fi
       done
        ;;
    *)
        ;;
esac
