version = "0.15.0"
-- Show hidden files
xplr.config.general.show_hidden = true

-- Prompt
xplr.config.general.prompt.format = "❯ "

-- Icons
package.path = os.getenv("HOME") .. '/.config/xplr/xplr-icons.lua'
require"icons".setup()

