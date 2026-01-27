# Use your plugin system here

# return 1 # <--- Comment this line to disable HyDE's oh-my-zsh plugins and use the zinit examples below

#! This file will not load, remove the return 1 line above to enable this file.
#? Below is an example of how to set up Zsh plugins using Zinit

# ================================================================

# Zinit plugin manager setup
# This section ensures zinit is installed and sourced, which allows you to manage plugins efficiently.
# Zinit is fast, flexible, and supports loading plugins, snippets, and more from GitHub and other sources.

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Custom prompt (load immediately)
zinit snippet $ZDOTDIR/prompt.zsh

# Turbo mode: plugins load after prompt appears (wait"0" = immediate after prompt)
# lucid = suppress loading messages

# Autosuggestions - load fast, needed early
zinit ice wait"0" lucid atload"ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(deselect-forward-char); _zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting - load after autosuggestions
zinit ice wait"0" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# Completions - can wait a bit
zinit ice wait"1" lucid
zinit light zsh-users/zsh-completions

# History substring search
zinit ice wait"1" lucid
zinit light zsh-users/zsh-history-substring-search

# fzf-tab - enhances tab completion
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

# z - directory jumping
zinit ice wait"2" lucid
zinit light rupa/z

# Autopair - auto-close brackets
zinit ice wait"2" lucid
zinit light hlissner/zsh-autopair

# Alias tips
zinit ice wait"2" lucid
zinit light djui/alias-tips

# Git plugin
zinit ice wait"2" lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

# Misc functions
zinit ice wait"2" lucid
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/
