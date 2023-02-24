echo "read zprofile"

DIR=$HOME/mac_dotfiles

if [ -f "$DIR/.from_ubuntu_bashrc" ]; then
	source "$DIR/.from_ubuntu_bashrc"
fi

if [ -f "$DIR/.zsh_aliases" ]; then
	source "$DIR/.zsh_aliases"
fi

if [ -f "$DIR/aliasrc" ]; then
	source "$DIR/aliasrc"
fi

if [ -f "$DIR/.for_others_from_zprofile" ]; then
	source "$DIR/.for_others_from_zprofile"
fi

if [ -f "$DIR/.keybindings" ]; then
	source "$DIR/.keybindings"
fi


# プロンプトの設定

export VIRTUAL_ENV_DISABLE_PROMPT=1
autoload -Uz colors
colors
autoload -Uz add-zsh-hook
local p_cdir="%B%F{blue}[%(5~|.../%2~|%~)]%f%b"$'\n'
local p_info="%n@%m${WINDOW:+[${WINDOW}]}"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
local p_base=" $p_cdir$p_rhost$p_info $p_mark "
function __precmd_virtual_env() {
    local p_penv="%B%F{cyan}${VIRTUAL_ENV:+(`echo ${VIRTUAL_ENV##*/}|rev|cut -d- -f3-|rev`)}%f%b"
    PROMPT="$p_penv$p_base"
}
add-zsh-hook precmd __precmd_virtual_env
