-- Minimal, keyboard-driven Hyprland config.
-- See https://wiki.hypr.land/Configuring/Start/ for the full option reference.

------------------
---- MONITORS ----
------------------

-- Desktop: forced 120Hz, matched by description so it survives being
-- replugged into a different port.
hl.monitor({
	output = "desc:Dell Inc. DELL U2724DE",
	mode = "2560x1440@120",
	position = "auto",
	scale = 1,
})

-- Laptop panel. Native pixels; Hyprland's auto-detected 1.5 was too large.
hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "0x0",
	scale = 1,
})

-- Laptop-docked Dell, mounted physically above the laptop panel. Centered
-- over the 1920px-wide panel: x = (1920 - 2560) / 2 = -320, y = -1440.
hl.monitor({
	output = "desc:Dell Inc. DELL U2520D 9Y7S823",
	mode = "2560x1440@59.95",
	position = "-320x-1440",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local menu = "hyprlauncher"
local fileManager = "dolphin"
local browser = "zen-browser"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("wayle shell")
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd("wl-paste --watch cliphist store")
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
		gaps_in = 4,
		gaps_out = 8,
		border_size = 1,

		col = {
			active_border = "rgba(888888ee)",
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
			size = 3,
			passes = 1,
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

		follow_mouse = 1,
		sensitivity = 0,
		repeat_rate = 50,
		repeat_delay = 200,
	},
})

hl.device({
	name = "logitech-mx-master-3-1",
	accel_profile = "flat",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { locked = true })
hl.bind(mod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | hyprlauncher -m | cliphist decode | wl-copy"))
hl.bind(mod .. " + PERIOD", hl.dsp.exec_cmd("rofimoji --selector wofi --action type"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + T", hl.dsp.layout("togglesplit"))
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

-- Monitors: there are only ever two, and workspaces are not duplicated across
-- them, so a single "go to the other screen" key beats directional binds.
local function otherMonitor()
	local active = hl.get_active_monitor()
	for _, m in ipairs(hl.get_monitors()) do
		if m.id ~= active.id then
			return m
		end
	end
	return active
end

-- Focus other monitor: mod + tab
hl.bind(mod .. " + Tab", function()
	hl.dispatch(hl.dsp.focus({ monitor = otherMonitor().id }))
end)

-- Send window to other monitor: mod + shift + tab
hl.bind(mod .. " + SHIFT + Tab", function()
	hl.dispatch(hl.dsp.window.move({ monitor = otherMonitor().id }))
end)

-- Resize window: mod + ctrl + hjkl
local resizeStep = 40
hl.bind(mod .. " + CTRL + H", hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }))
hl.bind(mod .. " + CTRL + L", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }))
hl.bind(mod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }))
hl.bind(mod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }))

-- Workspaces: mod + [0-9], move window to workspace: mod + shift + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB drag
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots via hyprshot
local screenshotDir = "~/Pictures/Screenshots"
hl.bind(mod .. " + S", hl.dsp.exec_cmd("hyprshot -m region -o " .. screenshotDir))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m output -o " .. screenshotDir))
hl.bind(mod .. " + CTRL + S", hl.dsp.exec_cmd("hyprshot -m window -m active -o " .. screenshotDir))

-- Media / volume. Bound twice, to the same commands:
--   * SUPER + F-row, because the desktop's Glove80 has no XF86 media keys.
--   * The XF86 keys themselves, which the laptop keyboard does have.
-- Binding a key the current keyboard never emits is harmless, so both
-- machines share one set.
local mute = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
local volumeDown = hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
local volumeUp = hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
local micMute = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
local playPrev = hl.dsp.exec_cmd("playerctl previous")
local playPause = hl.dsp.exec_cmd("playerctl play-pause")
local playNext = hl.dsp.exec_cmd("playerctl next")

hl.bind(mod .. " + F1", mute, { repeating = true })
hl.bind(mod .. " + F2", volumeDown, { repeating = true })
hl.bind(mod .. " + F3", volumeUp, { repeating = true })
hl.bind(mod .. " + F7", playPrev)
hl.bind(mod .. " + F8", playPause)
hl.bind(mod .. " + F9", playNext)
hl.bind(mod .. " + F10", micMute)

hl.bind("XF86AudioMute", mute, { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", volumeDown, { repeating = true, locked = true })
hl.bind("XF86AudioRaiseVolume", volumeUp, { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", micMute, { locked = true })
hl.bind("XF86AudioPrev", playPrev, { locked = true })
hl.bind("XF86AudioPlay", playPause, { locked = true })
hl.bind("XF86AudioNext", playNext, { locked = true })
