# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

from time import localtime, strftime

config.load_autoconfig()

# Cookies
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")

# User agent
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://docs.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://drive.google.com/*",
)

# Permissions
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")

config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# Colors
accent = "#1688f0"
black = "#000000"
white = "#dddddd"
red = "#dd2206"
green = "#4ec00a"
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
c.colors.tabs.pinned.even.bg = green
c.colors.tabs.pinned.odd.bg = green
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

# Dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")

# General
terminal = "foot"
editor = "nvim"

c.zoom.default = "80%"
c.downloads.location.directory = "~/Downloads"
c.tabs.show = "multiple"
c.editor.command = [terminal, "-e", editor, "{}"]
c.auto_save.session = True

# Home page
c.url.default_page = "https://2kabhishek.github.io/links"
c.url.start_pages = "https://2kabhishek.github.io/links"

# Search engines
c.url.auto_search = "naive"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "am": "https://www.amazon.com/s?k={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "gg": "https://www.google.com/search?q={}",
    "re": "https://www.reddit.com/r/{}",
    "wk": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
}

# Aliases
c.aliases = {"q": "quit", "Q": "close", "w": "session-save", "x": "quit --save"}

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

leader = " "
screenshots_dir = "~/Pictures/Screenshots/"
time = strftime("-%Y-%m-%d-%H-%M-%S", localtime())
screenshot_file = screenshots_dir + "qute" + time + ".png"

config.bind(leader + "c", "config-edit")
config.bind(leader + "C", "cmd-set-text -s :set -t")
config.bind(leader + "d", "devtools")
config.bind(leader + "D", "devtools-focus")
config.bind(leader + "e", "edit-text")
config.bind(leader + "E", "cmd-edit")
config.bind(leader + "h", "help")
config.bind(leader + "m", "bookmark-list")
config.bind(leader + "q", "tab-close")
config.bind(leader + "Q", "close")
config.bind(leader + "r", "config-source")
config.bind(leader + "s", "screenshot " + screenshot_file)
config.bind(leader + "S", "view-source --edit")
config.bind(leader + "u", "undo")
config.bind(leader + "v", "hint links spawn mpv {hint-url}")
config.bind(leader + "V", "hint links spawn " + terminal + "-e youtube-dl {hint-url}")
config.bind(leader + "x", "quit --save")
