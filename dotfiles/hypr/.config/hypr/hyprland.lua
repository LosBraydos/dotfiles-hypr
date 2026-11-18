-- Loads modules
require("lookandfeel")
require("input")
require("programs")
require("autostart")

-- Monitors
-- See: https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- ENV
-- See: https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("VDPAU_DRIVER", "radeonsi")

hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "24")
hl.env("XCURSORS_SIZE", "24")

hl.env("HYPRSHOT_DIR", "/home/brayd/Pictures/Screenshots/")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- hl.env("SDL_VIDEODRIVER","wayland")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Misc. variables
-- See https://wiki.hypr.land/configuring/core/config-options/#misc
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_splash_rendering = true, -- If true disables the random hyprland logo / anime girl background. :(
		vrr = 1,
	},
})

-- Windowrules for workspaces
-- See https://wiki.hypr.land/configuring/core/rules/window-rules/
hl.window_rule({
	name = "vesktop-on-2",
	match = { class = "vesktop" },
	workspace = { 2, "silent" },
})

hl.window_rule({
	name = "steam-on-3",
	match = { class = "steam" },
	workspace = { 3, "silent" },
})

hl.window_rule({
	name = "Gaming",
	match = { class = "^(?i)steam_app_.* ^(?i)gamescope$*" },
	workspace = { "special:Gaming" },
})

hl.window_rule({
	name = "vesktop-on-2",
	match = { class = "vesktop" },
	workspace = { 2, "silent" },
})

-- From example config
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)
