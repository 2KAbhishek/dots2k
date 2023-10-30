# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

from time import localtime, strftime

# Reassign to avoid lsp(ruff_lsp) errors
config = config  # noqa: F821
c = c  # noqa: F821

config.load_autoconfig()

# Variables
leader = " "
screenshots_dir = "~/Pictures/Screenshots/"
timestamp = strftime("%Y-%m-%d-%H-%M-%S", localtime())  # updates on every config-source
terminal = "foot"
editor = "nvim"

# General
c.editor.command = [terminal, "-e", editor, "{}"]
c.downloads.location.directory = "~/Downloads"
c.zoom.default = "80%"
c.tabs.show = "multiple"
c.auto_save.session = True
c.url.auto_search = "naive"

# Dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")

# Colors
accent = "#1688f0"
blue = "#0f1d91"
black = "#000000"
white = "#dddddd"
red = "#dd2206"
green = "#3ed500"
yellow = "#f1c200"
purple = "#390d91"

c.colors.completion.category.bg = (
    "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #111)"
)

c.colors.completion.category.border.bottom = accent
c.colors.completion.category.border.top = accent
c.colors.completion.category.fg = accent
c.colors.completion.even.bg = black
c.colors.completion.fg = white
c.colors.completion.item.selected.bg = accent
c.colors.completion.item.selected.fg = black
c.colors.completion.item.selected.match.fg = white
c.colors.completion.match.fg = accent
c.colors.completion.odd.bg = black
c.colors.completion.scrollbar.fg = white
c.colors.downloads.bar.bg = black
c.colors.downloads.error.bg = red
c.colors.hints.bg = black
c.colors.hints.fg = white
c.colors.hints.match.fg = green
c.colors.messages.info.bg = black
c.colors.statusbar.command.bg = black
c.colors.statusbar.insert.bg = accent
c.colors.statusbar.insert.fg = white
c.colors.statusbar.normal.bg = black
c.colors.statusbar.passthrough.bg = purple
c.colors.statusbar.private.bg = yellow
c.colors.statusbar.url.fg = accent
c.colors.statusbar.url.warn.fg = yellow
c.colors.tabs.bar.bg = black
c.colors.tabs.even.bg = black
c.colors.tabs.odd.bg = black
c.colors.tabs.pinned.even.bg = blue
c.colors.tabs.pinned.odd.bg = blue
c.colors.tabs.pinned.selected.even.bg = accent
c.colors.tabs.pinned.selected.odd.bg = accent
c.colors.tabs.selected.even.bg = accent
c.colors.tabs.selected.odd.bg = accent

# Font
c.fonts.default_family = '"FiraCode Nerd Font"'
c.fonts.default_size = "8pt"
c.fonts.completion.entry = '8pt "FiraCode Nerd Font"'
c.fonts.hints = '8pt "FiraCode Nerd Font"'
c.fonts.debug_console = '8pt "FiraCode Nerd Font"'
c.fonts.prompts = "default_size sans-serif"
c.fonts.statusbar = '8pt "FiraCode Nerd Font"'

# Home page
c.url.default_page = "https://2kabhishek.github.io/links"
c.url.start_pages = "https://2kabhishek.github.io/links"

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "am": "https://www.amazon.com/s?k={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "gg": "https://www.google.com/search?q={}",
    "re": "https://www.reddit.com/r/{}",
    "rp": "https://www.github.com/2kabhishek/{}",
    "tx": "https://springhealth.atlassian.net/browse/{}",
    "wk": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
}

# Aliases
c.aliases = {
    "o": "open",
    "q": "quit",
    "Q": "close",
    "w": "session-save",
    "x": "quit --save",
}

# Keybindings
config.bind("t", "cmd-set-text -s :open -t")
config.bind("s", "hint")
config.bind("a", "mode-enter insert")

config.bind("K", "back")
config.bind("J", "forward")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")

config.bind("xs", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")

config.bind(leader + "c", "config-edit")
config.bind(leader + "C", "cmd-set-text -s :set -t")
config.bind(leader + "d", "devtools")
config.bind(leader + "D", "devtools-focus")
config.bind(leader + "e", "edit-text")
config.bind(leader + "E", "cmd-edit")
config.bind(leader + "h", "help")
config.bind(leader + "m", "bookmark-list")
config.bind(leader + "p", "tab-pin")
config.bind(leader + "P", "cmd-set-text -s :tab-move")
config.bind(leader + "q", "tab-close")
config.bind(leader + "Q", "close")
config.bind(leader + "r", "config-source")
config.bind(leader + "R", "restart")
config.bind(
    leader + "s", "screenshot " + screenshots_dir + "qute-" + timestamp + ".png"
)
config.bind(leader + "S", "view-source --edit")
config.bind(leader + "u", "undo")
config.bind(leader + "v", "hint links spawn mpv {hint-url}")
config.bind(leader + "V", "hint links spawn " + terminal + "-e youtube-dl {hint-url}")
config.bind(leader + "x", "quit --save")
