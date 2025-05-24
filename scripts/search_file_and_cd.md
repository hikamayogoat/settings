## 事前準備

```sh
brew install peco
brew install fd
```

- https://github.com/peco/peco
- https://github.com/sharkdp/fd

## コマンド

任意のディレクトリに作成

```sh
#!/bin/zsh

### search file and cd
cdf() { # cd + find 的な
  if [ -z "$1" ]; then
    echo "Usage: cdf <filename>"
    return 1
  fi

  local results
  results=$(fd --hidden --type f "$1")

  if [ -z "$results" ]; then
    echo "No such file."
    return 1
  fi

  local count
  count=$(echo "$results" | grep -c .)

  local target_path=""

  if [ "$count" -eq 1 ]; then
    target_path="$results"
  else
    target_path=$(echo "$results" | peco)
  fi

  if [ -n "$target_path" ]; then
    cd "$(dirname "$target_path")"
  fi
}

# go run ./... や npm run dev できるディレクトリまでのエイリアス
alias cdg='cdf main.go'
alias cdn='cdf package.json'
```

## ~/.zshrc で読み込み設定

```sh
local custom_script_dir="$HOME/${PATH_TO_SCRIPTS}"
if [ -d "$custom_script_dir" ] && [ -n "$(fd .sh "$custom_script_dir" -e sh --maxdepth 1)" ]; then
  for file in "$custom_script_dir"/*.sh; do
    source "$file"
  done
fi
```
