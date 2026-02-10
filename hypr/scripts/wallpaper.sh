#!/usr/bin/env bash
# random-wall.sh — simple non-repeating random wallpaper setter

WALL_DIR="$HOME/Pictures/wallpapers"
CACHE="$HOME/.cache/wallpapers_shown.txt"

mkdir -p "$(dirname "$CACHE")"

# Get list of all images
mapfile -t ALL_WALLS < <(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort)

# Reset cache if all wallpapers are already used or cache doesn't exist
if [ ! -f "$CACHE" ] || [ "$(wc -l < "$CACHE")" -ge "${#ALL_WALLS[@]}" ]; then
    > "$CACHE"
fi

# Filter out used ones
mapfile -t UNUSED < <(comm -23 <(printf "%s\n" "${ALL_WALLS[@]}") <(sort "$CACHE"))

# Pick one random unused wallpaper
if [ "${#UNUSED[@]}" -eq 0 ]; then
    echo "No wallpapers found in $WALL_DIR"
    exit 1
fi
RANDOM_WALL="${UNUSED[RANDOM % ${#UNUSED[@]}]}"

# Apply with swww wipe transition
swww img "$RANDOM_WALL" --transition-type wipe --transition-duration 2

# Record the wallpaper as used
echo "$RANDOM_WALL" >> "$CACHE"
