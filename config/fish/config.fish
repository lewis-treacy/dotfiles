set fish_greeting

function su
  /bin/su --shell=/usr/bin/fish $argv
end

set -U SXHKD_SHELL /bin/bash
set -gx GOPATH $HOME/.go
set -gx EDITOR nvim
set -gx DIFFPROG "nvim -d"

set -gx VISUAL gvim
set -gx LANG en_GB.UTF-8
set -gx PATH /usr/local/bin $HOME/.go/bin $HOME/.bin $HOME/.local/bin $HOME/.pyenv/versions $PATH
set -gx SHELL /usr/bin/fish
set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set fish_color_autosuggestion brgrey
set fish_color_command green
set fish_color_comment bryellow
set fish_color_cwd red
set fish_color_cwd_root red
set fish_color_error red
set fish_color_param blue
set fish_color_quote yellow
set fish_color_redirection teal
set fish_color_status red
set fish_color_user brgreen

status is-login; and pyenv init --path | source

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

source ~/.config/fish/aliases.fish
