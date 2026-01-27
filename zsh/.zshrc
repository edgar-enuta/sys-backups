# this is the config file
# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added a config file for you to customize HyDE before loading zshrc
# Edit $ZDOTDIR/.user.zsh to customize HyDE before loading zshrc

#  Plugins 
# oh-my-zsh plugins are loaded  in $ZDOTDIR/.user.zsh file, see the file for more information

#  Aliases 
# Override aliases here in '$ZDOTDIR/.zshrc' (already set in .zshenv)

# # Helpful aliases
# alias c='clear'                                                        # clear terminal
 alias ls='eza -lh --icons=auto'                                         # long list
 alias l='eza -1a --icons=auto'                                          # short list
 alias la='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
 alias ld='eza -lhD --icons=auto'                                        # long list dirs
 alias lt='eza --icons=auto --tree'                                      # list folder as tree
# alias un='$aurhelper -Rns'                                             # uninstall package
# alias up='$aurhelper -Syu'                                             # update system/package/aur
# alias pl='$aurhelper -Qs'                                              # list installed package
# alias pa='$aurhelper -Ss'                                              # list available package
# alias pc='$aurhelper -Sc'                                              # remove unused cache
# alias po='$aurhelper -Qtdq | $aurhelper -Rns -'                        # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
# alias vc='code'                                                        # gui code editor
# alias fastfetch='fastfetch --logo-type kitty'

alias pcw='wakeonlan -i 192.168.1.255 -p 9 00:d8:61:e0:3b:86'

# Mermaid diagram viewer
alias viewmmd='f() { mmdc -i "$1" -o /tmp/mermaid-preview.png && chafa --size $(tput cols)x$(tput lines) /tmp/mermaid-preview.png }; f'

# # Directory navigation shortcuts
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
 alias mkdir='mkdir -p'

#  This is your file 
# Add your configurations here
# export EDITOR=nvim
export EDITOR=micro

# unset -f command_not_found_handler # Uncomment to prevent searching for commands not found in package manager

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
# End of lines configured by zsh-newuser-install

bindkey -e

# Ctrl+Arrow (move by word)
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5C' forward-word
bindkey '^[[5D' backward-word

# Home/End (move to start/end of line)
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line

export QT_QPA_PLATFORM=wayland
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

# ═══════════════════════════════════════════════════════════════════════════
# Text Editor-Style Selection Mode
# ═══════════════════════════════════════════════════════════════════════════

# --- Deselect widgets ---
# These are called by regular arrow keys to clear selection before moving.
# REGION_ACTIVE is zsh's built-in variable tracking if text is selected.
# Setting it to 0 clears the selection, then we call the normal movement.
deselect-forward-char()  { REGION_ACTIVE=0; zle forward-char }
deselect-backward-char() { REGION_ACTIVE=0; zle backward-char }
zle -N deselect-forward-char
zle -N deselect-backward-char

# --- Select widgets ---
# These start a selection (set-mark-command) if not already selecting,
# then move the cursor. The region between mark and cursor is selected.
select-char-right() { ((REGION_ACTIVE)) || zle set-mark-command; zle forward-char }
select-char-left()  { ((REGION_ACTIVE)) || zle set-mark-command; zle backward-char }
select-word-right() { ((REGION_ACTIVE)) || zle set-mark-command; zle forward-word }
select-word-left()  { ((REGION_ACTIVE)) || zle set-mark-command; zle backward-word }
zle -N select-char-right
zle -N select-char-left
zle -N select-word-right
zle -N select-word-left

# --- Select All (Ctrl+A) ---
# Moves to start, sets mark, moves to end. REGION_ACTIVE=1 ensures highlight.
select-all() {
  zle beginning-of-line
  zle set-mark-command
  zle end-of-line
  REGION_ACTIVE=1
}
zle -N select-all

# --- Delete/Backspace with selection awareness ---
# If text is selected (REGION_ACTIVE), kill-region deletes the selection.
# Otherwise, perform normal delete/backspace.
delete-selection-or-char() {
  if ((REGION_ACTIVE)); then
    zle kill-region
  else
    zle delete-char
  fi
}
zle -N delete-selection-or-char

backspace-selection-or-char() {
  if ((REGION_ACTIVE)); then
    zle kill-region
  else
    zle backward-delete-char
  fi
}
zle -N backspace-selection-or-char

# --- Keybindings ---
# Regular arrows: deselect then move (non-sticky selection)
bindkey '^[[C' deselect-forward-char   # Right arrow
bindkey '^[[D' deselect-backward-char  # Left arrow

# Shift+Arrow: select characters
bindkey '^[[1;2C' select-char-right    # Shift+Right
bindkey '^[[1;2D' select-char-left     # Shift+Left

# Ctrl+Shift+Arrow: select words
bindkey '^[[1;6C' select-word-right    # Ctrl+Shift+Right
bindkey '^[[1;6D' select-word-left     # Ctrl+Shift+Left

# Ctrl+A: select entire line
bindkey '^A' select-all

# Delete/Backspace: delete selection if active
bindkey '^[[3~' delete-selection-or-char  # Delete key
bindkey '^?' backspace-selection-or-char  # Backspace key

# Undo/Redo
bindkey '^Z' undo  # Ctrl+Z
bindkey '^Y' redo  # Ctrl+Y
