# 🎨 Arch Linux Hyprland Configuration

A beautiful and functional Arch Linux setup featuring Hyprland with the **Catppuccin Frappe** theme. This configuration prioritizes aesthetics, performance, and productivity with carefully curated applications and custom configurations.

![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)
![Catppuccin](https://img.shields.io/badge/Catppuccin-Frappe-F5C2E7?style=for-the-badge)

> **Inspiration**: This configuration draws inspiration from popular Arch Linux + Hyprland setups on GitHub, particularly those using Catppuccin theming, while adding personal customizations and workflow optimizations.

## ✨ Features

### 🖥️ Core System
- **Window Manager**: [Hyprland](https://hyprland.org/) - Dynamic tiling Wayland compositor with smooth animations
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) - Highly customizable Wayland bar
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) - GPU-accelerated terminal emulator
- **Application Launcher**: [Tofi](https://github.com/philj56/tofi) - Minimal dmenu/rofi replacement
- **Alternative Launcher**: [Rofi](https://github.com/davatorium/rofi) - Window switcher and application launcher
- **File Manager**: [Nautilus](https://wiki.gnome.org/Apps/Files) - GNOME Files (GUI)
- **Browser**: Firefox with Wayland support
- **Notifications**: [Dunst](https://dunst-project.org/) - Lightweight notification daemon

### 🎨 Theming & Appearance
- **Theme**: Catppuccin Frappe (Rosewater accent)
- **Cursor**: catppuccin-mocha-rosewater-cursors
- **Icons**: Configured via GTK/Qt settings
- **Qt Theme**: Kvantum with Catppuccin Frappe Rosewater
- **GTK Theme**: Consistent Catppuccin styling
- **System Info**: [Fastfetch](https://github.com/fastfetch-cli/fastfetch) with custom configuration

### 🔐 System Tools
- **Screen Lock**: [Hyprlock](https://github.com/hyprwm/hyprlock) - Hyprland's native screen locker
- **Idle Management**: [Hypridle](https://github.com/hyprwm/hypridle) - Idle daemon for Hyprland
- **Wallpaper**: [Hyprpaper](https://github.com/hyprwm/hyprpaper) + [SWWW](https://github.com/LGFae/swww) for dynamic wallpapers
- **Power Menu**: [Wlogout](https://github.com/ArtsyMacaw/wlogout) with Catppuccin theme
- **Clipboard Manager**: [Cliphist](https://github.com/sentriz/cliphist) - Wayland clipboard manager
- **Color Picker**: [Hyprpicker](https://github.com/hyprwm/hyprpicker)
- **Screenshots**: [Grimblast](https://github.com/hyprwm/contrib) - Hyprland-aware screenshot tool
- **Emoji Picker**: Rofimoji

### 🎵 Media & Utilities
- **Audio Visualizer**: [Cava](https://github.com/karlstav/cava) with custom shaders
- **Audio Control**: [Pamixer](https://github.com/cdemoulins/pamixer) - PulseAudio mixer
- **Media Control**: [Playerctl](https://github.com/altdesktop/playerctl)
- **Brightness Control**: [brightnessctl](https://github.com/Hummer12007/brightnessctl)
- **Music Player**: Spotify support
- **IDE**: IntelliJ IDEA (custom launcher)

### 🔧 System Integration
- **Authentication Agent**: polkit-kde-authentication-agent-1
- **Network Manager**: nm-applet with GUI support
- **Bluetooth Manager**: blueman-applet
- **Audio Server**: PipeWire with WirePlumber (configured via systemd)

## 🎯 Key Highlights

### Custom Animations
Smooth, performant animations using custom bezier curves:
- **Windows**: Dynamic slide animations with wind effect
- **Workspaces**: Smooth workspace transitions
- **Borders**: Animated gradient borders with 45° angle

### Smart Window Rules
- Opacity settings for different application types
- Floating rules for system dialogs and utilities
- Custom configurations for development tools

### Optimized Keybindings
- **Super Modifier**: System-level actions (lock, logout, power menu)
- **Alt Modifier**: Window management and application launching
- **Media Keys**: Full support for volume, brightness, and playback controls

### Multiple Color Variants
Wlogout includes 13 color variants matching different Catppuccin accents:
- Blue, Flamingo, Green, Lavender, Maroon, Mauve
- Peach, Pink, Red, Rosewater, Sapphire, Sky, Teal, Yellow

## 📦 Installation

### Prerequisites
```bash
# Core Hyprland ecosystem
sudo pacman -S hyprland hyprpaper hypridle hyprlock waybar

# Terminal and shell
sudo pacman -S kitty starship

# Application launchers
sudo pacman -S tofi rofi

# System utilities
sudo pacman -S dunst libnotify fastfetch nautilus firefox

# Media and audio
sudo pacman -S pamixer playerctl brightnessctl cava

# Wayland tools
sudo pacman -S cliphist wl-clipboard grim slurp

# Network and Bluetooth
sudo pacman -S nm-applet blueman

# Qt/GTK theming
sudo pacman -S qt6ct kvantum nwg-look

# Authentication and system
sudo pacman -S polkit-kde-agent

# Fonts (recommended)
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd
```

### AUR Packages
```bash
# Using your preferred AUR helper (yay/paru)
yay -S swww grimblast-git hyprpicker-git wlogout rofimoji
```

### Configuration Setup
```bash
# Clone this repository
git clone <your-repo-url> ~/dotfiles

# Backup existing configs (IMPORTANT!)
mkdir -p ~/.config-backup
cp -r ~/.config/{hypr,waybar,kitty,dunst,rofi,tofi} ~/.config-backup/

# Copy configurations
cp -r ~/dotfiles/* ~/.config/

# Make scripts executable
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/waybar/scripts/*.sh
```

## 🎨 Theme Customization

### Changing Colors
The configuration uses Catppuccin Frappe with Rosewater accent. To change the accent color:

1. **Hyprland Borders** (`~/.config/hypr/hyprland.conf`):
```conf
col.active_border = rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg
```

2. **Waybar** (`~/.config/waybar/style.css`):
Modify color variables at the top of the file

3. **Wlogout**:
Switch between color variants by symlinking different CSS files

### Wallpaper
```bash
# Add your wallpapers to
~/Pictures/wallpapers/

# Update in hyprland.conf:
exec-once = swww img ~/Pictures/wallpapers/your-wallpaper.jpg
```

## ⌨️ Keybindings

| Keybind | Action |
|---------|--------|
| `Alt + Return` | Launch terminal (Kitty) |
| `Alt + Space` | Application launcher (Tofi) |
| `Alt + E` | File manager (Nautilus) |
| `Alt + F` | Web browser (Firefox) |
| `Alt + W` | Close active window |
| `Alt + L` | Logout |
| `Alt + M` | Toggle Waybar / Launch Spotify |
| `Alt + G` | Screenshot selection |
| `Alt + Print` | Screenshot active window |
| `Alt + S` | Wallpaper switcher |
| `Alt + I` | IntelliJ IDEA |
| `Super + L` | Lock screen (Hyprlock) |
| `Super + Escape` | Power menu (Wlogout) |
| `Super + V` | Clipboard history |
| `Super + P` | Color picker |
| `Super + E` | Emoji picker |
| `Print` | Screenshot entire screen |
| `Alt + 1-5` | Switch to workspace 1-5 |
| `Alt + Shift + 1-5` | Move window to workspace 1-5 |
| `Alt + Arrows` | Move focus |
| `Alt + Shift + Arrows` | Resize active window |
| `Alt + Z` | Move window (drag) |
| `Alt + X` | Resize window (drag) |

### Media Keys
- **Volume**: XF86AudioRaiseVolume, XF86AudioLowerVolume, XF86AudioMute
- **Playback**: XF86AudioPlay/Pause, XF86AudioNext, XF86AudioPrev
- **Brightness**: XF86MonBrightnessUp, XF86MonBrightnessDown

## 🎛️ Configuration Structure

```
~/.config/
├── hypr/
│   ├── hyprland.conf       # Main Hyprland configuration
│   ├── hypridle.conf       # Idle daemon settings
│   ├── hyprlock.conf       # Lock screen configuration
│   ├── hyprpaper.conf      # Static wallpaper config
│   └── scripts/
│       ├── connect_wifi.sh
│       └── wallpaper.sh
├── waybar/
│   ├── config.jsonc        # Waybar module configuration
│   ├── style.css           # Waybar styling
│   └── scripts/
│       ├── launch.sh
│       └── wallpaper.sh
├── kitty/
│   ├── kitty.conf          # Terminal configuration
│   └── theme.conf          # Catppuccin theme
├── dunst/
│   └── dunstrc            # Notification daemon config
├── rofi/
│   └── config.rasi        # Rofi launcher styling
├── tofi/
│   └── configV            # Tofi launcher config
├── wlogout/
│   ├── layout             # Power menu layout
│   ├── *.css              # Color variant stylesheets
│   └── icons/             # Catppuccin-themed icons
├── cava/
│   ├── config             # Audio visualizer config
│   ├── shaders/           # Custom GLSL shaders
│   └── themes/            # Color themes
├── fastfetch/
│   └── config.jsonc       # System info display
├── gtk-3.0/
│   └── settings.ini       # GTK3 theme settings
├── gtk-4.0/
│   └── settings.ini       # GTK4 theme settings
├── qt6ct/
│   ├── qt6ct.conf         # Qt6 configuration
│   └── style-colors.conf  # Qt color scheme
├── Kvantum/
│   └── catppuccin-frappe-rosewater#/
├── systemd/user/          # User systemd services (PipeWire)
└── starship.toml          # Shell prompt configuration
```

## 🔍 Customization Tips

### Adding Opacity to Applications
Edit `~/.config/hypr/hyprland.conf`:
```conf
windowrule = match:class ^your-app-class$, opacity 0.80 0.80
```

### Adding Workspace-Specific Rules
```conf
windowrulev2 = workspace 2, class:^(firefox)$
windowrulev2 = workspace 3, class:^(Code)$
```

### Modifying Gaps and Borders
```conf
general {
    gaps_in = 5          # Inner gaps between windows
    gaps_out = 5         # Outer gaps from screen edges
    border_size = 2      # Border thickness
}
```

### Waybar Module Customization
Edit `~/.config/waybar/config.jsonc` to:
- Reorder modules (left, center, right)
- Add new modules (temperature, custom scripts, etc.)
- Adjust update intervals

## 🚀 Performance Tips

1. **GPU Acceleration**: Kitty uses GPU acceleration by default
2. **Animation Settings**: Adjust bezier curves in hyprland.conf for smoother/faster animations
3. **Blur Performance**: Reduce blur passes or disable for better performance on older hardware
4. **VRR**: Variable Refresh Rate is disabled by default (`vrr = 0`)

## 🐛 Troubleshooting

### Hyprland Won't Start
```bash
# Check logs
cat ~/.local/share/hyprland/hyprland.log

# Verify Wayland session
echo $XDG_SESSION_TYPE  # Should output "wayland"
```

### Waybar Not Showing
```bash
# Kill and restart
killall waybar
waybar &

# Check for errors
waybar --log-level debug
```

### Clipboard Not Working
```bash
# Restart clipboard services
killall wl-paste cliphist
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
```

### Network/Bluetooth Applets Missing
```bash
# Restart applets
killall nm-applet blueman-applet
nm-applet &
blueman-applet &
```

## 📸 Screenshots

> Add your screenshots here showing:
> - Desktop overview
> - Waybar close-up
> - Wlogout power menu
> - Fastfetch output
> - Application workspace

## 🙏 Credits & Inspiration

This configuration was inspired by the incredible Arch Linux and Hyprland community, particularly:
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin) - Beautiful pastel color palette
- Various Arch Linux Hyprland dotfile repositories on GitHub
- The Hyprland community for excellent documentation and support

Special thanks to the developers of all the amazing tools that make this setup possible!

## 📄 License

Feel free to use and modify this configuration for your own setup. If you share it, attribution is appreciated but not required.

## 🤝 Contributing

Found a bug or have a suggestion? Feel free to:
- Open an issue
- Submit a pull request
- Share your customizations

## 📞 Support

If you need help with this configuration:
1. Check the [Hyprland Wiki](https://wiki.hyprland.org/)
2. Review the [Arch Wiki](https://wiki.archlinux.org/)
3. Ask in the Hyprland Discord or subreddit

---

**Enjoy your beautiful Arch Linux setup! 🎨✨**
