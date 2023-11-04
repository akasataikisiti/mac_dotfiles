echo "read zshrc"


# nvimから呼ばれた時だけ能動的に.zprofileを読み込む
if [[ "$(ps -o comm= $PPID)" == *"nvim"* ]]; then
  echo "PPID is nvim!"
  source $HOME/.zprofile
else
  echo "not from nvim (maybe login shell)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
