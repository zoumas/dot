-- Minimal, keyboard-driven Hyprland config.
-- See https://wiki.hypr.land/Configuring/Start/ for the full option reference.

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "desc:Dell Inc. DELL U2724DE",
    mode     = "2560x1440@120",
    position = "auto",
    scale    = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local menu        = "hyprlauncher"
local fileManager = "dolphin"
local browser     = "zen-browser"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("wayle shell")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 1,

        col = {
            active_border   = "rgba(888888ee)",
            inactive_border = "rgba(59595955)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding = 4,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = -1,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us,gr",

        follow_mouse  = 1,
        sensitivity   = 0,
        repeat_rate   = 50,
        repeat_delay  = 200,
    },
})

hl.device({
    name         = "logitech-mx-master-3-1",
    accel_profile = "flat",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R",      hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + W",      hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + SPACE",  hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { locked = true })
hl.bind(mod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + Q",      hl.dsp.window.close())
hl.bind(mod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F",      hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mod .. " + T",      hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())

-- Move focus: mod + hjkl
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window: mod + shift + hjkl
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Resize window: mod + ctrl + hjkl
local resizeStep = 40
hl.bind(mod .. " + CTRL + H", hl.dsp.window.resize({ x = -resizeStep, y = 0,           relative = true }))
hl.bind(mod .. " + CTRL + L", hl.dsp.window.resize({ x = resizeStep,  y = 0,           relative = true }))
hl.bind(mod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,           y = -resizeStep, relative = true }))
hl.bind(mod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,           y = resizeStep,  relative = true }))

-- Workspaces: mod + [0-9], move window to workspace: mod + shift + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB drag
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots via hyprshot
local screenshotDir = "~/Pictures/Screenshots"
hl.bind(mod .. " + S",        hl.dsp.exec_cmd("hyprshot -m region -o " .. screenshotDir))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m output -o " .. screenshotDir))
hl.bind(mod .. " + CTRL + S", hl.dsp.exec_cmd("hyprshot -m window -m active -o " .. screenshotDir))

-- Media / volume keys (SUPER + F-row; the Glove80 has no XF86 multimedia keys)
hl.bind(mod .. " + F1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),               { repeating = true })
hl.bind(mod .. " + F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),                { repeating = true })
hl.bind(mod .. " + F3", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),           { repeating = true })
hl.bind(mod .. " + F7", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mod .. " + F8", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mod .. " + F9", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mod .. " + F10", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
