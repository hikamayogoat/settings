# VSCode で vim バインドの j,k,h,l を長押ししてもリピート入力されないときに実行した。
# ちゃんと検証してないけど、この2つをやったら動いた
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false