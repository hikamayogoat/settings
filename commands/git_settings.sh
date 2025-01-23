# SSHキーを作成し、GitHub に公開鍵を登録しておく
ssh-keygen -t ed25519 -C "${EMAIL}" -f ~/.ssh/github

# 自分のメールアドレスを設定しておく
git config --global user.email "${EMAIL}"
