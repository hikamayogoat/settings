# ghq と peco をインストールする
brew install ghq
brew install peco
git config --global ghq.root '~/${SOMETHING_DIR}'

# ~/.zshrc に以下を追記
alias g='cd $(ghq root)/$(ghq list | peco)'
