# セキュリティ的な意味でも GitHub の推奨する方法を信じてみると安心感があるんじゃないかと思うのでよしなに
# https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# SSHキーを作成し、GitHub に公開鍵を登録しておく
ssh-keygen -t ed25519 -C "${EMAIL}" -f ~/.ssh/github

# 自分のメールアドレスを設定しておく
git config --global user.email "${EMAIL}"
