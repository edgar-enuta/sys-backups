# System Shortcuts Reference

## Window Management (Hyprland)

| Shortcut | Action |
|---|---|
| Super + Q | Close focused window |
| Alt + F4 | Close focused window |
| Super + W | Toggle floating |
| Super + G | Toggle group |
| Super + F11 | Toggle fullscreen |
| Super + J | Toggle split |
| Super + Shift + F | Toggle pin on focused window |
| Alt + Tab | Cycle focus |

### Focus

| Shortcut | Action |
|---|---|
| Super + Arrow keys | Move focus (left/right/up/down) |
| Super + Ctrl + H | Previous group window |
| Super + Ctrl + L | Next group window |

### Resize

| Shortcut | Action |
|---|---|
| Super + Shift + Arrow keys | Resize window (30px) |

### Move Window

| Shortcut | Action |
|---|---|
| Super + Shift + Ctrl + Arrow keys | Move window across workspace |
| Super + Mouse Left (hold) | Move window (mouse) |
| Super + Mouse Right (hold) | Resize window (mouse) |
| Super + Z (hold) | Move window (keyboard) |
| Super + X (hold) | Resize window (keyboard) |

## Workspace Navigation

| Shortcut | Action |
|---|---|
| Super + 1-9, 0 | Switch to workspace 1-10 |
| Super + Ctrl + Right/Left | Next/previous workspace |
| Super + Ctrl + Down | Nearest empty workspace |
| Super + Mouse scroll | Scroll through workspaces |

### Move Window to Workspace

| Shortcut | Action |
|---|---|
| Super + Shift + 1-9, 0 | Move window to workspace 1-10 |
| Super + Ctrl + Alt + Right/Left | Move window to relative workspace |
| Super + Alt + 1-9, 0 | Move window silently to workspace 1-10 |

### Scratchpad

| Shortcut | Action |
|---|---|
| Super + S | Toggle scratchpad |
| Super + Shift + S | Move window to scratchpad |
| Super + Alt + S | Move window to scratchpad (silent) |

## App Launching

| Shortcut | Action |
|---|---|
| Super + Enter | Terminal (Kitty) |
| Super + Shift + Enter | Floating dropdown terminal |
| Super + E | File explorer |
| Super + C | Text editor |
| Super + B | Web browser |
| Ctrl + Shift + Escape | System monitor |

### Rofi Menus

| Shortcut | Action |
|---|---|
| Super + A | Application finder |
| Super + Tab | Window switcher |
| Super + Shift + E | File finder |
| Super + / | Keybindings hint |
| Super + , | Emoji picker |
| Super + . | Glyph picker |
| Super + V | Clipboard |
| Super + Shift + V | Clipboard manager |
| Super + Shift + A | Rofi launcher selector |

## Terminal Text Editing (Zsh)

### Selection

| Shortcut | Action |
|---|---|
| Shift + Left/Right | Select characters |
| Ctrl + Shift + Left/Right | Select words |
| Ctrl + A | Select entire line |
| Right/Left (no modifier) | Deselect |

### Editing

| Shortcut | Action |
|---|---|
| Delete / Backspace | Delete selection (if active) |
| Ctrl + Z | Undo |
| Ctrl + Y | Redo |

### Navigation

| Shortcut | Action |
|---|---|
| Ctrl + Left/Right | Move by word |
| Home / End | Beginning/end of line |

### Copy/Paste

| Shortcut | Action |
|---|---|
| Ctrl + Shift + C | Copy (terminal) |
| Ctrl + Shift + V | Paste (terminal) |

## Terminal (Kitty)

Kitty modifier is set to **Alt** (`kitty_mod alt`) to free Ctrl+Shift for zsh word selection.

| Shortcut | Action |
|---|---|
| Shift + Enter | Send escape + return |
| Alt + S | Open scrollback in pager |
| Alt + F5 | Reload config |
| Alt + C / Alt + V | Copy / paste (via kitty_mod) |
| Ctrl + Shift + C / V | Copy / paste (explicit override) |

### Windows/Splits

| Shortcut | Action |
|---|---|
| Alt + Enter | New window/split |
| Alt + Shift + Up | Focus window above |
| Alt + Shift + Down | Focus window below |
| Alt + Shift + Left | Focus window left |
| Alt + Shift + Right | Focus window right |
| Alt + ] / Alt + [ | Next/previous window (cycles) |

### Tabs

| Shortcut | Action |
|---|---|
| Alt + T | New tab |
| Alt + Shift + T | Rename tab |
| Alt + Left / Alt + Right | Previous/next tab |

## Hardware Controls

### Audio

| Shortcut | Action |
|---|---|
| F10 / XF86AudioMute | Toggle mute |
| F11 / XF86AudioLowerVolume | Decrease volume |
| F12 / XF86AudioRaiseVolume | Increase volume |
| XF86AudioMicMute | Toggle microphone mute |

### Media

| Shortcut | Action |
|---|---|
| XF86AudioPlay/Pause | Play/pause media |
| XF86AudioNext | Next track |
| XF86AudioPrev | Previous track |

### Brightness

| Shortcut | Action |
|---|---|
| XF86MonBrightnessUp | Increase brightness |
| XF86MonBrightnessDown | Decrease brightness |

## Screenshot & Recording

| Shortcut | Action |
|---|---|
| Super + P | Snip screen (partial) |
| Super + Ctrl + P | Freeze and snip screen |
| Super + Alt + P | Screenshot current monitor |
| Print | Screenshot all monitors |
| Super + Shift + P | Color picker |

## Theming & Wallpaper

| Shortcut | Action |
|---|---|
| Super + Alt + Right/Left | Next/previous wallpaper |
| Super + Shift + W | Wallpaper selector |
| Super + Alt + Up/Down | Next/previous waybar layout |
| Super + Shift + R | Wallbash mode selector |
| Super + Shift + T | Theme selector |
| Super + Shift + Y | Animation selector |
| Super + Shift + U | Hyprlock layout selector |

## System

| Shortcut | Action |
|---|---|
| Super + L | Lock screen |
| Ctrl + Alt + Delete | Logout menu |
| Alt_R + Ctrl_R | Toggle waybar |
| Super + K | Toggle keyboard layout |
| Super + Alt + G | Game mode |
| Super + Shift + G | Game launcher |
| Super + H | Toggle hyprsunset (blue light filter) |

---

# Setup Instructions

## Browser Switcher

Opens links in whichever browser (Chrome/Brave) is currently running. If none or multiple are open, shows a rofi prompt.

**Script:** `scripts/browser-switcher`

### Setup

1. Create the `.desktop` file (adjust path to your sys-backups location):

```bash
cat > ~/.local/share/applications/browser-switcher.desktop << EOF
[Desktop Entry]
Name=Browser Switcher
Comment=Opens URLs in the currently running browser
Exec=$HOME/sys-backups/scripts/browser-switcher %u
Terminal=false
Type=Application
Categories=Network;WebBrowser;
MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
EOF
```

2. Update desktop database and set as default:

```bash
update-desktop-database ~/.local/share/applications/
xdg-settings set default-web-browser browser-switcher.desktop
```

3. Verify:

```bash
xdg-settings get default-web-browser  # should show browser-switcher.desktop
xdg-open https://example.com          # test it
```

### Customization

Edit `scripts/browser-switcher` to add/remove browsers in the `BROWSERS` array:

```bash
BROWSERS=(
    "process_name:executable"
    "chrome:google-chrome-stable"
    "brave:brave"
    "firefox:firefox"
)
```

## Dunst Notifications

Config: `dunst/dunst.conf` (hardlink to `~/.config/dunst/dunst.conf`)

Note: `dunstrc` is auto-generated by Hyde's wallbash and should not be backed up or edited directly. Edit `dunst.conf` then run `hyde-shell wallbash dunst` to regenerate.

### Hardlink Setup

```bash
ln -f ~/sys-backups/dunst/dunst.conf ~/.config/dunst/dunst.conf
```

## Kitty Terminal

Config: `kitty/kitty.conf` (hardlink to `~/.config/kitty/kitty.conf`)

### Hardlink Setup

```bash
ln -f ~/sys-backups/kitty/kitty.conf ~/.config/kitty/kitty.conf
```
