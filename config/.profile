# ~/.profile: Sourced by POSIX login shells and display managers (greetd, tuigreet)

# Source shared environment variables (TERMINAL, CLIPCOPY, CLIPPASTE, PATH, etc.)
if [ -f "$HOME/.config/shell/environment.sh" ]; then
    . "$HOME/.config/shell/environment.sh"
fi
