set fish_greeting

function su
  /bin/su --shell=/usr/bin/fish $argv
end

setxkbmap -option caps:escape

set EDITOR nvim
set LANG en_GB.UTF-8
set PATH /usr/local/bin $HOME/.go/bin $PATH
set GOPATH $HOME/.go $GOPATH

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
