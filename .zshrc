echo "read zshrc"


# nvimから呼ばれた時だけ能動的に.zprofileを読み込む
# if [[ "$(ps -o comm= $PPID)" == *"nvim"* ]]; then
if [[ "$(ps -o comm= $PPID)" == *"nvim"* ]] || [[ "$(ps -o comm= $PPID)" == *"vim"* ]]; then
  echo "PPID is nvim!"
  source $HOME/.zprofile
  alias nv='nvr'
else
  echo "not from nvim (maybe login shell)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
