#!/bin/bash

TARGET_SSID = "Students"
TARGET_PASSWORD = "0123456789"

# --- Optional Configuration ---
MAX_RETRIES=3     # How many times to check for the network
RETRY_DELAY=10    # Seconds to wait between checks
# -------------------------------

# Give NetworkManager and the Wi-Fi card a few seconds to initialize on startup
sleep 5

# Check if we are already connected to the target network
# `iwgetid -r` prints the current SSID, or nothing if not connected.
echo "Checking current connection..."
CURRENT_SSID=$(iwgetid -r)

if [ "$CURRENT_SSID" == "$TARGET_SSID" ]; then
    echo "Already connected to '$TARGET_SSID'. Exiting."
    # Optionally send a notification that you're already connected
    # notify-send -u low -i network-wireless "Wi-Fi" "Already connected to $TARGET_SSID"
    exit 0
fi

echo "Not connected to target. Will attempt to connect to '$TARGET_SSID'..."

# Loop a few times to see if the network becomes available
for ((i=1; i<=$MAX_RETRIES; i++)); do
    echo "Scan attempt $i/$MAX_RETRIES..."
    
    # Use nmcli to scan and grep for the target SSID.
    # `nmcli -t` = terse mode for scripting
    # ` -f SSID` = show only the SSID field
    # `dev wifi list` = list available Wi-Fi networks
    # `grep -q "^$TARGET_SSID$"` = quietly check for an exact match
    if nmcli -t -f SSID dev wifi list | grep -q "^$TARGET_SSID$"; then
        echo "Network '$TARGET_SSID' is visible."
        echo "Attempting to connect..."
        
        # Try to connect.
        # This command will create a new connection profile if one doesn't exist,
        # or use an existing one.
        nmcli device wifi connect "$TARGET_SSID" password "$TARGET_PASSWORD"
        
        # Check the exit status of the connect command
        if [ $? -eq 0 ]; then
            echo "Successfully connected to '$TARGET_SSID'."
            # Send a notification via dunst
            notify-send -u low -i network-wireless "Wi-Fi Connected" "Successfully joined $TARGET_SSID"
            exit 0 # Success!
        else
            echo "Connection command failed."
            # We'll let the loop retry if it failed
        fi
    else
        echo "Network '$TARGET_SSID' not found in scan."
    fi

    # Don't try again if this was the last attempt
    if [ $i -lt $MAX_RETRIES ]; then
        echo "Waiting $RETRY_DELAY seconds before next scan..."
        sleep $RETRY_DELAY
    fi
done

echo "Failed to connect to '$TARGET_SSID' after $MAX_RETRIES attempts."
# Send a failure notification so you know it didn't work
notify-send -u normal -i network-wireless-disconnected "Wi-Fi Failed" "Could not connect to $TARGET_SSID"
exit 1
