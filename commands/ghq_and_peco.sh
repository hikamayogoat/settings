# ghq と peco をインストールする
brew install ghq
brew install peco

# ~/.zshrc に以下を追記
alias g='cd $(ghq root)/$(ghq list | peco)'
