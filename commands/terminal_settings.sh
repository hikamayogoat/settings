# prezto をインストール
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# powerlevel10k をセットアップ
prompt -p powerlevel10k   
p10k configure # 実行前に、powerlevel10k の README に従ってフォントをインストールする
# ~/.zpreztorc に以下を追記
# zstyle ':prezto:module:prompt' theme 'sorin' の記述をコメントアウト or 削除
zstyle ':prezto:module:prompt' theme 'powerlevel10k' 


# zsh のサジェスチョン・ハイライトを有効にする
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
# zshrc に以下を追記
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh