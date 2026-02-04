# Claude Instructions

## Hardlink Strategy

This repo backs up dotfiles using **hardlinks** to `~/.config/`. Files are hardlinked (not copied) so edits to either location stay in sync.

### When editing config files

1. Edit the file in `~/.config/` (the active config location)
2. Changes automatically reflect in this repo via hardlink
3. Commit and push from this repo

### When files get out of sync

If files have different inodes, they're copies not hardlinks. Fix with:

```bash
# Check inodes (should match if hardlinked)
ls -i ~/.config/path/to/file ~/sys-backups/path/to/file

# Re-create hardlink (from active config to backup)
rm ~/sys-backups/path/to/file
ln ~/.config/path/to/file ~/sys-backups/path/to/file
```

### Adding new files to backup

```bash
# Move file to sys-backups, then hardlink back to config
mv ~/.config/app/file.conf ~/sys-backups/app/file.conf
ln ~/sys-backups/app/file.conf ~/.config/app/file.conf
```

### Repo structure

All config directories are hardlinked to their `~/.config/` counterparts:
- `hypr/` ↔ `~/.config/hypr/`
- `waybar/` ↔ `~/.config/waybar/`
- `kitty/` ↔ `~/.config/kitty/`
- `rofi/` ↔ `~/.config/rofi/`
- `dunst/` ↔ `~/.config/dunst/`
- `fastfetch/` ↔ `~/.config/fastfetch/`
- `zsh/` ↔ `~/.config/zsh/`
- `hyde/` ↔ `~/.config/hyde/`
- `workflows/` ↔ `~/.config/hypr/workflows/`

Non-hardlinked (repo-only):
- `scripts/` - custom scripts
- `README.md`, `CLAUDE.md`

## Keybinding Documentation

**Important:** Every new keybinding added to any config file must be documented in `README.md` under the appropriate section. The README serves as the single source of truth for all system shortcuts.
