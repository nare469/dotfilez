
set -x GOPATH $HOME/go
set -x PATH $PATH $HOME/bin $GOPATH/bin

# Enable vi mode
set fish_key_bindings fish_vi_key_bindings

# bobthefish configs
set -g theme_display_vi yes
set -g theme_date_format "+"
set -g theme_show_exit_status no
set -g theme_color_scheme gruvbox
