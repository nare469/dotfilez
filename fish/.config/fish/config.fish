# Enable vi mode
set fish_key_bindings fish_vi_key_bindings

# Disable default vi mode prompt
function fish_mode_prompt; end

# bobthefish configs
set -g theme_display_vi yes
set -g theme_date_format "+"
set -g theme_show_exit_status no
set -g theme_color_scheme gruvbox
set -g theme_display_virtualenv yes

set -g VIRTUAL_ENV_DISABLE_PROMPT 1
