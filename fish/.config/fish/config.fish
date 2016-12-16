
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Enable vi mode
set fish_key_bindings fish_vi_key_bindings

# Set docker environment
if command -v docker-machine > /dev/null
  eval (docker-machine env default)
end

set -x TERM xterm-256color
set -x ITERABLE_ENVIRONMENT development

# bobthefish configs
set -g theme_display_vi yes
set -g theme_date_format "+"
set -g theme_show_exit_status no
