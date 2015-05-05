# all that's run if we open X11
export PATH=$HOME/bin:$PATH
export PKG_CPPFLAGS=`Rscript -e 'Rcpp:::CxxFlags()'`
export PKG_LIBS=`Rscript -e 'Rcpp:::LdFlags()'`

echo "
-use the Ctrl-R trick to incrementally search back through your command history
-chmod 755 for executable...

LaTeX install:
~/texmf/...
kpsepath (bib or tex) | tr : '\n'
sudo mktexlsr . # or sudo texhash

\bibliography{~/Dropbox/bib/library}

sed for paths: use not / as a delimter, eg
sed -i s,pheno-evo/stan/pheno,pheno-evo/stan/pheno__, *

"
echo "
TODOS for this week:
"
tld | cut -c 15-  > $HOME/Dropbox/notes/daytodo.txt
tlw | cut -c 15-  > $HOME/Dropbox/notes/weektodo.txt

#| xargs -L 1

#tlw
tld inf #| cut -c 15- |xargs -I{} -L 1 growltodo "{}"
tld const #| cut -c 15- |xargs -I{} -L 1 growltodo "{}"
