set fish_greeting

function su
  /bin/su --shell=/usr/bin/fish $argv
end

set -U SXHKD_SHELL /bin/bash
set -gx GOPATH $HOME/.go
set -gx EDITOR nvim
set -gx VISUAL gvim
set -gx LANG en_GB.UTF-8
set -gx PATH /usr/local/bin $HOME/.go/bin $HOME/.bin $PATH
set -gx SHELL /usr/bin/fish

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

source ~/.config/fish/aliases.fish
