---@module 'hl'
local settings = require("settings")

-- monitor settings

hl.monitor({
    output   = settings.monitorA,
    mode     = "preferred@highrr",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = settings.monitorB,
    mode     = "preferred@highrr",
    position = "1920x0",
    scale    = 1,
    transform = 1,
})

--monitor=Unknown-1,disable
-- environment variables

hl.env("GTK_THEME", "Fluent-Dark")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)

hl.env("GDK_DEBUG", "portals")

hl.env("HYPRCURSOR_THEME", "Adwaita")

hl.env("HYPRCURSOR_SIZE", 24)

hl.env("XDG_MENU_PREFIX", "plasma-")

hl.config({
    input = {
        kb_layout = "us",
        repeat_delay = 200,
        repeat_rate = 30,
        accel_profile = "adaptive",
        follow_mouse = 1,
        mouse_refocus = false,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2,
            disable_while_typing = false,
            middle_button_emulation = false,
            tap_to_click = false,
        },
        sensitivity = 0,
        -- -1.0 - 1.0, 0 means no modification.
    },
})

hl.device({
    name = "tpps/2-ibm-trackpoint",
    sensitivity = -0.2,
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        layout = "dwindle",
        allow_tearing = false,
        col = {
            active_border = "rgba(" .. settings.activeBorder .. ")",
            inactive_border = "rgba(" .. settings.border .. ")",
        },
    },
})

hl.config({
    decoration = {
        rounding = 4,
        blur = {
            enabled = false,
        },
        shadow = {
            enabled = false,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
        -- animation = workspaces, 1, 1.5,  default
    },
})
hl.curve("custom", {
    type = "bezier",
    points = { { 0.13, 1 }, { 0.75, 1 } },
})
hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "custom", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "custom", style = "popin 30%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = false, speed = 0.1, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.5, bezier = "custom", style = "slide" })

hl.config({
    cursor = {
        inactive_timeout = 3,
        no_hardware_cursors = 0,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
        -- you probably want this
    },
})

hl.config({
    ecosystem = {
        no_update_news = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        -- Set to 0 to disable the anime mascot wallpapers
        disable_splash_rendering = true,
    },
})

-- window rules

--windowrule = center[on],floating:1 

--windowrule = float,class:^(xdg-desktop-portal-gtk)$

--windowrule = float,title:^(Picture-in-Picture)$

--windowrule = float,title:^(Open Folder)$

--windowrule = float,initialTitle:Sign in - Google Accounts — Mozilla Firefox

-- intellij

--windowrulev2 = tag +jb, class:^jetbrains-.$,floating:1

--windowrulev2 = stayfocused, tag:jb

--windowrulev2 = noinitialfocus, tag:jb

--windowrulev2 = focusonactivate,class:^jetbrains-(?!toolbox)

--windowrule = stayfocused,class:^jetbrains-.$,floating:1

-- workspaces

hl.workspace_rule({
    workspace = 1,
    monitor = settings.monitorA,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 2,
    monitor = settings.monitorB,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 3,
    monitor = settings.monitorA,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 4,
    monitor = settings.monitorB,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 5,
    monitor = settings.monitorA,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 6,
    monitor = settings.monitorB,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 7,
    monitor = settings.monitorA,
    default = true,
    persistent = true,
})

hl.workspace_rule({
    workspace = 8,
    monitor = settings.monitorB,
    default = true,
    persistent = true,
})

hl.bind(settings.modA .. " + " .. 1, hl.dsp.window.move({ workspace = 1 , follow = false}))

hl.bind(settings.modA .. " + " .. 2, hl.dsp.window.move({ workspace = 3 , follow = false}))

hl.bind(settings.modA .. " + " .. 3, hl.dsp.window.move({ workspace = 5 , follow = false}))

hl.bind(settings.modA .. " + " .. 4, hl.dsp.window.move({ workspace = 7 , follow = false}))

hl.bind(settings.modB .. " + " .. 1, hl.dsp.window.move({ workspace = 1 , follow = false}))

hl.bind(settings.modB .. " + " .. 2, hl.dsp.window.move({ workspace = 3 , follow = false}))

hl.bind(settings.modB .. " + " .. 3, hl.dsp.window.move({ workspace = 5 , follow = false}))

hl.bind(settings.modB .. " + " .. 4, hl.dsp.window.move({ workspace = 7 , follow = false}))

-- virtual desktops

hl.bind(settings.modB .. " + " .. "O", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh 1"))

hl.bind(settings.modB .. " + " .. "I", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh -1"))

hl.bind(settings.modA .. " + " .. "O", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh 1"))

hl.bind(settings.modA .. " + " .. "I", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh -1"))

-- TODO: manual review (unknown dispatcher: swapactiveworkspaces)
-- hl.bind(settings.modA .. " + " .. "BACKSLASH", hl.dsp.swapactiveworkspaces(settings.monitorA .. " " .. settings.monitorB))

-- TODO: manual review (unknown dispatcher: swapactiveworkspaces)
-- hl.bind(settings.modB .. " + " .. "BACKSLASH", hl.dsp.swapactiveworkspaces(settings.monitorA .. " " .. settings.monitorB))

-- lock

hl.bind(settings.modA .. " + " .. "L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))

hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))

-- TODO: manual review (unknown dispatcher: Reveal active window on top)
-- hl.bind("ALT + Tab", hl.dsp.Reveal active window on top("bringactivetotop"))

-- TODO: manual review (unknown dispatcher: Reveal active window on top)
-- hl.bind("ALT + SHIFT + Tab", hl.dsp.Reveal active window on top("bringactivetotop"))

hl.bind("F11", hl.dsp.window.fullscreen())

-- applications

hl.bind(settings.modA .. " + " .. "T", hl.dsp.exec_cmd("alacritty"))

hl.bind(settings.modC .. " + " .. "T", hl.dsp.exec_cmd("alacritty"))

hl.bind(settings.modA .. " + " .. "F", hl.dsp.exec_cmd("firefox"))

hl.bind(settings.modA .. " + " .. "G", hl.dsp.exec_cmd("firefox -private-window"))

hl.bind(settings.modB .. " + " .. "F", hl.dsp.exec_cmd("firefox"))

hl.bind(settings.modB .. " + " .. "G", hl.dsp.exec_cmd("firefox -private-window"))

hl.bind(settings.modA .. " + " .. "H", hl.dsp.exec_cmd("obsidian"))
hl.bind(settings.modB .. " + " .. "H", hl.dsp.exec_cmd("obsidian"))

hl.bind(settings.mainMod .. " + " .. "Q", hl.dsp.window.close())

hl.bind(settings.mainMod .. " + " .. "V", hl.dsp.window.float())

hl.bind(settings.mainMod .. " + " .. "Y", hl.dsp.layout("togglesplit"))

hl.bind(settings.modA .. " + " .. "K", hl.dsp.window.resize({ x = 40, y = 0, relative = true}), { repeating = true})

hl.bind(settings.modA .. " + " .. "J", hl.dsp.window.resize({ x = -40, y = 0, relative = true}), { repeating = true})

hl.bind(settings.modB .. " + " .. "K", hl.dsp.window.resize({ x = 40, y = 0, relative = true}), {repeating = true})

hl.bind(settings.modB .. " + " .. "J", hl.dsp.window.resize({ x = -40, y = 0, relative = true}), {repeating = true})

hl.bind(settings.mainMod .. " + " .. "B", hl.dsp.window.swap({ next = true }))
hl.bind("XF86Launch1", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))

-- rofi

hl.bind(settings.mainMod .. " + " .. "SPACE", hl.dsp.exec_cmd("~/.local/bin/launch_rofi.sh"))

-- powermenu

hl.bind("SUPER + CTRL + DELETE", hl.dsp.exec_cmd("~/.local/bin/powermenu.sh"))

hl.bind(settings.mainMod .. " + " .. 1, hl.dsp.window.move({ monitor = settings.monitorA }))

hl.bind(settings.mainMod .. " + " .. 2, hl.dsp.window.move({ monitor = settings.monitorB }))

hl.bind(settings.mainMod .. " + " .. "O", hl.dsp.exec_cmd("hyprctl dispatch focusmonitor " .. settings.monitorA .. " && hyprctl dispatch focusmonitor " .. settings.monitorB))

hl.bind(settings.mainMod .. " + " .. "I", hl.dsp.exec_cmd("hyprctl dispatch focusmonitor " .. settings.monitorB .. " && hyprctl dispatch focusmonitor " .. settings.monitorA))

-- media control

hl.bind(settings.modA .. " + " .. "D", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))

hl.bind(settings.modA .. " + " .. "E", hl.dsp.exec_cmd("playerctl --player=spotify previous"))

hl.bind(settings.modA .. " + " .. "R", hl.dsp.exec_cmd("playerctl --player=spotify next"))

hl.bind(settings.modB .. " + " .. "D", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))

hl.bind(settings.modB .. " + " .. "E", hl.dsp.exec_cmd("playerctl --player=spotify previous"))

hl.bind(settings.modB .. " + " .. "R", hl.dsp.exec_cmd("playerctl --player=spotify next"))

-- window rules

-- TODO: manual review: windowrulev = "float", "title:^(Picture-in-Picture)$"

-- TODO: manual review: windowrulev = "opacity 0.0 override", "class:^(xwaylandvideobridge)$"

-- TODO: manual review: windowrulev = "noinitialfocus", "class:^(xwaylandvideobridge)$"

-- TODO: manual review: windowrulev = "maxsize 1 1", "class:^(xwaylandvideobridge)$"

-- TODO: manual review: windowrulev = "noblur", "class:^(xwaylandvideobridge)$"

-- TODO: manual review: windowrulev = "nofocus", "class:^(xwaylandvideobridge)$"

-- audio control

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))

-- handle lid open and close

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/.local/bin/handle_lid.sh closed"), { locked = true })

hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("~/.local/bin/handle_lid.sh open"), { locked = true })

-- screenshots

hl.bind(settings.modA .. " + " .. "S", hl.dsp.exec_cmd("grimblast --freeze copy area"))

hl.bind(settings.modB .. " + " .. "S", hl.dsp.exec_cmd("grimblast --freeze copy area"))

-- move focus between windows

hl.bind(settings.mainMod .. " + " .. "J", hl.dsp.focus({ direction = "left" }))

hl.bind(settings.mainMod .. " + " .. "K", hl.dsp.focus({ direction = "right" }))

hl.bind(settings.mainMod .. " + " .. "U", hl.dsp.focus({ direction = "up" }))

hl.bind(settings.mainMod .. " + " .. "N", hl.dsp.focus({ direction = "down" }))

-- move and resize windows via mouse

hl.bind(settings.mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(settings.mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.local/bin/on_login.sh")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/hyprpolkitagent")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("swayosd-server --display=" .. settings.monitorA)
    hl.exec_cmd("source ~/.zshrc")
    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
    hl.exec_cmd("sway-audio-idle-inhibit")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("~/.local/bin/wallpaper.sh")
end)
