# Activate syntax highlighting
 source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
((${+ZSH_HIGHLIGHT_STYLES})) || typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Activate mise
eval "$(~/.local/bin/mise activate zsh)"

eval "$(starship init zsh)"
