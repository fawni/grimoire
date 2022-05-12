local apps = {
    terminal = "kitty", 
    launcher = "sh /home/parndt/.config/rofi/launch.sh", 
    switcher = require("widgets.alt-tab"), 
    xrandr = "lxrandr", 
    screenshot = "scrot -e 'echo $f'", 
    volume = "pavolume", 
    appearance = "lxappearance", 
    browser = "firefox", 
    fileexplorer = "thunar",
    settings = "code /home/obs/awesome/"
}

user = {
    terminal = "kitty", 
    floating_terminal = "kitty"
}

return apps
