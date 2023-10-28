# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

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
c.colors.completion.fg = ["#9cc4ff", "white", "white"]
c.colors.completion.category.bg = (
    "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #111)"
)

c.colors.completion.odd.bg = "#000"
c.colors.completion.even.bg = "#0a0a0a"
c.colors.completion.category.fg = "#1688f0"
c.colors.completion.category.border.top = "#1a1a1a"
c.colors.completion.category.border.bottom = "#1a1a1a"
c.colors.completion.item.selected.fg = "#000"
c.colors.completion.item.selected.bg = "#1688f0"
c.colors.completion.item.selected.match.fg = "#fff"
c.colors.completion.match.fg = "#1688f0"
c.colors.completion.scrollbar.fg = "white"
c.colors.downloads.bar.bg = "#000"
c.colors.downloads.error.bg = "#ff6c6b"
c.colors.hints.fg = "#282c34"
c.colors.hints.match.fg = "#98be65"
c.colors.messages.info.bg = "#000"
c.colors.statusbar.normal.bg = "#000"
c.colors.statusbar.insert.fg = "white"
c.colors.statusbar.insert.bg = "#1688f0"
c.colors.statusbar.passthrough.bg = "#34426f"
c.colors.statusbar.command.bg = "#000"
c.colors.statusbar.url.warn.fg = "yellow"
c.colors.tabs.bar.bg = "#000"
c.colors.tabs.odd.bg = "#000"
c.colors.tabs.even.bg = "#0a0a0a"
c.colors.tabs.selected.odd.bg = "#1688f0"
c.colors.tabs.selected.even.bg = "#1688f0"
c.colors.tabs.pinned.odd.bg = "seagreen"
c.colors.tabs.pinned.even.bg = "darkseagreen"
c.colors.tabs.pinned.selected.odd.bg = "#1688f0"
c.colors.tabs.pinned.selected.even.bg = "#1688f0"

# Font
c.fonts.default_family = '"FiraCode Nerd Font"'
c.fonts.default_size = "8pt"
c.fonts.completion.entry = '8pt "FiraCode Nerd Font"'
c.fonts.debug_console = '8pt "FiraCode Nerd Font"'
c.fonts.prompts = "default_size sans-serif"
c.fonts.statusbar = '8pt "FiraCode Nerd Font"'

# Dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")

# General
c.zoom.default = "80%"
c.downloads.location.directory = "~/Downloads"
c.tabs.show = "multiple"

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
c.aliases = {"q": "quit", "w": "session-save", "x": "quit --save", "o": "open -t"}

# Keybindings
# config.bind('o', 'spawn --userscript dmenu-open')
# config.bind('O', 'spawn --userscript dmenu-open --tab')
config.bind("xv", "hint links spawn mpv {hint-url}")
config.bind("xV", "hint links spawn st -e youtube-dl {hint-url}")
config.bind("t", "cmd-set-text -s :open -t")
config.bind("xs", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind("xx", "tab-close")

