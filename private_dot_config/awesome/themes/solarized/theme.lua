---------------------------
-- Solarized awesome theme --
---------------------------
local shape = require("gears.shape")
local surface = require("gears.surface")
local beautiful = require("beautiful")
local theme_assets = beautiful.theme_assets
local xresources = beautiful.xresources
local dpi = xresources.apply_dpi
local cur_theme_path = beautiful.theme_path

-- {{{ Get svg function
local cairo = require("lgi").cairo
local gears = require("gears")

local get_svg = function(filename, color)
    local img = gears.surface.load_uncached(filename)
    local cr = cairo.Context(img)
    cr:set_source_rgba(gears.color.parse_color(color))
    cr:mask(cairo.Pattern.create_for_surface(img), 0, 0)
    return img
end
-- }}}

local theme = {}
theme.font = "Ubuntu 10"

theme.colors = {}
theme.colors.base3   = "#002b36bb"
theme.colors.base2   = "#073642bb"
theme.colors.base1   = "#586e75bb"
theme.colors.base0   = "#657b83bb"
theme.colors.base00  = "#839496bb"
theme.colors.base01  = "#93a1a1bb"
theme.colors.base02  = "#eee8d5bb"
theme.colors.base03  = "#fdf6e3bb"
theme.colors.yellow  = "#b58900bb"
theme.colors.orange  = "#cb4b16bb"
theme.colors.red     = "#dc322fbb"
theme.colors.magenta = "#d33682bb"
theme.colors.violet  = "#6c71c4bb"
theme.colors.blue    = "#268bd2bb"
theme.colors.cyan    = "#2aa198bb"
theme.colors.green   = "#859900bb"

theme.wallpaper = cur_theme_path.."background.png"

-- {{{ Colors
theme.fg_normal  = theme.colors.base01 -- "#93a1a1bb"
theme.fg_focus   = theme.colors.base03 -- "#fdf6e3bb"
theme.fg_urgent  = theme.colors.base3 -- "#002b36bb"

theme.bg_normal  = theme.colors.base3 -- "#002b36bb"
theme.bg_systray = theme.bg_normal
theme.bg_focus   = theme.colors.base1 -- "#586e75bb"
theme.bg_urgent  = theme.colors.red
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.colors.base1 -- "#586e75bb"
theme.titlebar_bg_normal = theme.colors.base2 -- "#002b36bb"
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_fg_focus = theme.bg_focus
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = surface.load_from_shape(taglist_square_size, taglist_square_size, function(cr, width, height)
    shape.transform(shape.pie):translate(width*-1, height*-1)(cr, width*2, height*2)
end, theme.fg_normal)
theme.taglist_squares_unsel = surface.load_from_shape(taglist_square_size, taglist_square_size, function(cr, width, height)
    shape.transform(shape.arc):translate(width*-1, height*-1)(cr, width*2, height*2, dpi(1))
end, theme.fg_normal)
-- }}}

-- {{{ Borders
theme.border_width  = dpi(2)
theme.useless_gap   = 0
theme.border_normal = theme.colors.base2 -- "#002b36bb"
theme.border_focus  = theme.colors.green
theme.border_marked = theme.colors.red
-- }}}

-- {{{ Menu
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Notifications
theme.notification_font = "Fira Code 14"
theme.notification_bg = theme.colors.base3 -- "#002b36bb"
theme.notification_fg = theme.colors.base03 -- "#fdf6e3bb"
theme.notification_border_width	= dpi(2)
theme.notification_border_color	= theme.colors.green
theme.notification_shape = function(cr, width, height)
   shape.partially_rounded_rect(cr, width, height, true, false, true, true, 10)
end
-- }}}

-- {{{ Tooltips
theme.tooltip_border_color = theme.colors.green
theme.tooltip_bg = theme.colors.base3 -- "#002b36bb"
theme.tooltip_fg = theme.colors.base03 -- "#fdf6e3bb"
theme.tooltip_font = "Fira Code 12"
theme.tooltip_border_width = dpi(1)
-- }}}

-- {{{ Titlebar icons
theme.titlebar_close_button_normal = get_svg(cur_theme_path.."titlebar/window-close.svg", theme.fg_normal)
theme.titlebar_close_button_focus  = get_svg(cur_theme_path.."titlebar/window-close.svg", theme.fg_focus)

theme.titlebar_minimize_button_normal = cur_theme_path.."titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = cur_theme_path.."titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = cur_theme_path.."titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = cur_theme_path.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = cur_theme_path.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = cur_theme_path.."titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = cur_theme_path.."titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = cur_theme_path.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = cur_theme_path.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = cur_theme_path.."titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = cur_theme_path.."titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = cur_theme_path.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = cur_theme_path.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = cur_theme_path.."titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = cur_theme_path.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = cur_theme_path.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = cur_theme_path.."titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = cur_theme_path.."titlebar/maximized_focus_active.png"
-- }}}

-- {{{ Layout icons
theme.layout_cornerne = cur_theme_path.."layouts/cornerne.png"
theme.layout_cornernw = cur_theme_path.."layouts/cornernw.png"
theme.layout_cornerse = cur_theme_path.."layouts/cornerse.png"
theme.layout_cornersw = cur_theme_path.."layouts/cornersw.png"
theme.layout_dwindle = cur_theme_path.."layouts/dwindle.png"
theme.layout_fairh = cur_theme_path.."layouts/fairh.png"
theme.layout_fairv = cur_theme_path.."layouts/fairv.png"
theme.layout_floating  = cur_theme_path.."layouts/floating.png"
theme.layout_fullscreen = cur_theme_path.."layouts/fullscreen.png"
theme.layout_magnifier = cur_theme_path.."layouts/magnifier.png"
theme.layout_max = cur_theme_path.."layouts/max.png"
theme.layout_spiral  = cur_theme_path.."layouts/spiral.png"
theme.layout_tile = cur_theme_path.."layouts/tile.png"
theme.layout_tilebottom = cur_theme_path.."layouts/tilebottom.png"
theme.layout_tileleft   = cur_theme_path.."layouts/tileleft.png"
theme.layout_tiletop = cur_theme_path.."layouts/tiletop.png"
-- }}}

-- {{{ Misc icons
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
theme.menu_submenu_icon = get_svg(cur_theme_path.."angle-right.svg", theme.fg_normal)
theme.menu_bg_normal = theme.bg_normal
theme.menu_fg_normal = theme.fg_normal
theme.menu_bg_focus = theme.bg_focus
theme.menu_fg_focus = theme.fg_focus
theme.menu_border_color = theme.colors.green
theme.menu_border_width = dpi(2)
-- }}}

-- {{{ Prompt
theme.prompt_bg = theme.bg_normal
theme.prompt_fg = theme.colors.green
theme.prompt_bg_cursor = string.sub(theme.colors.cyan, 1, 7)
theme.prompt_fg_cursor = string.sub(theme.bg_normal, 1, 7)
theme.prompt_font = "Ubuntu Mono 16"
-- }}}

-- {{{ Calendar
theme.calendar_style = {}
theme.calendar_style.padding = dpi(10)
theme.calendar_focus_border_color = theme.colors.green
theme.calendar_font = "Ubuntu 14"
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
