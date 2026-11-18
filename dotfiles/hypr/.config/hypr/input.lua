-- Variables for programs used
local terminal = 'kitty --hold -e fastfetch'
local filemanager = 'thunar'
local browser = 'zen-browser'

-- Input
-- See: https://wiki.hypr.land/configuring/core/config-options/#input
hl.config({
    input = {
        kb_layout = "se",

        follow_mouse = 2,
        sensitivity = 0,
        accel_profile = "flat",
    }
})

-- Binds
-- See: https://wiki.hypr.land/configuring/core/binds/
hl.bind("SUPER + C", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(filemanager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))

hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle"} ))

hl.bind("SUPER + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/close.sh"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind("SUPER + K", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("dms ipc call notepad open"))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("dms ipc powermenu toggle"))

hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER" .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER" .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with arrow keys
hl.bind("SUPER + ALT + left", hl.dsp.focus({ workspace = "r-1"}))
hl.bind("SUPER + ALT + right", hl.dsp.focus({ workspace = "r+1"}))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshot a window
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a region
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))