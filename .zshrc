# Go コマンドが使えるようにPATHを通す
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Alt+矢印で区切り文字として扱わないものたち
# _ や . でも止まってくれるようにする意図
export WORDCHARS='*?[]~=/&;!#$%^(){}<>'
