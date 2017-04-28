
set -x GOPATH $HOME/go
set -x PATH $PATH $HOME/bin $GOPATH/bin $HOME/.gem/ruby/2.4.0/bin

# Reload colourscheme
wal -r

# Enable vi mode
set fish_key_bindings fish_vi_key_bindings

# bobthefish configs
set -g theme_display_vi yes
set -g theme_date_format "+"
set -g theme_show_exit_status no
set -g theme_color_scheme gruvbox
