#!/bin/bash
# ubn2cameramd (c) 2025 drAIML BANKON license

# Output file
OUTPUT_FILE="video_diagnostics_report.md"

# Remove output file if it exists
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# Function to check if required commands are installed
function check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 could not be found. Please install the required package."
        exit 1
    fi
}

# Check for required commands
REQUIRED_CMDS=("v4l2-ctl" "ffplay" "gst-launch-1.0" "fuser" "lsof")
for cmd in "${REQUIRED_CMDS[@]}"; do
    check_command "$cmd"
done

# Collect kernel messages related to video devices
echo "# Kernel Messages Related to Video Devices" >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
dmesg | grep -i -E 'uvc|video|camera|usb|error' >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Verify user permissions
echo "# User Permissions and Group Membership" >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
echo "User: $USER" >> "$OUTPUT_FILE"
echo "Groups:" >> "$OUTPUT_FILE"
groups "$USER" >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Loop through video devices
for device in /dev/video*; do
    if [ -e "$device" ]; then
        # Get device number
        DEVICE_NUM=$(echo "$device" | grep -o '[0-9]*$')

        echo "## Device: $device" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Check for processes using the device
        echo "### Processes Using $device" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        PIDS=$(fuser "$device" 2>/dev/null)
        if [ -z "$PIDS" ]; then
            echo "No processes using $device" >> "$OUTPUT_FILE"
        else
            fuser -v "$device" 2>&1 >> "$OUTPUT_FILE"
            lsof "$device" 2>&1 >> "$OUTPUT_FILE"
        fi
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Detailed Information
        echo "### Detailed Information" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        v4l2-ctl -d "$device" --all >> "$OUTPUT_FILE" 2>&1
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Supported Formats
        echo "### Supported Formats" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        v4l2-ctl -d "$device" --list-formats-ext >> "$OUTPUT_FILE" 2>&1
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Testing with ffplay
        echo "### Testing Device with ffplay" >> "$OUTPUT_FILE"

        # Get list of supported formats
        FORMATS=$(v4l2-ctl -d "$device" --list-formats | awk -F"'" '/Pixel Format/{print $2}')

        for format in $FORMATS; do
            # Determine the input_format parameter for ffplay
            case "$format" in
                "YUYV")
                    INPUT_FORMAT="yuyv422"
                    ;;
                "MJPG")
                    INPUT_FORMAT="mjpeg"
                    ;;
                *)
                    INPUT_FORMAT=""
                    ;;
            esac

            # Get supported resolutions for the format
            RESOLUTIONS=$(v4l2-ctl -d "$device" --list-framesizes="$format" | awk '/Size: Discrete/ {print $3}')

            for resolution in $RESOLUTIONS; do
                echo "**Testing with format $format and resolution $resolution**" >> "$OUTPUT_FILE"
                echo '```' >> "$OUTPUT_FILE"
                ffplay -f v4l2 -input_format "$INPUT_FORMAT" -video_size "$resolution" -i "$device" -t 5 -loglevel info -autoexit -nodisp &>> "$OUTPUT_FILE"
                echo '```' >> "$OUTPUT_FILE"
                echo "" >> "$OUTPUT_FILE"
            done
        done

        # Testing with GStreamer
        echo "### Testing Device with GStreamer" >> "$OUTPUT_FILE"

        # Test with each supported format
        for format in $FORMATS; do
            # Get supported resolutions for the format
            RESOLUTIONS=$(v4l2-ctl -d "$device" --list-framesizes="$format" | awk '/Size: Discrete/ {print $3}')

            for resolution in $RESOLUTIONS; do
                WIDTH=$(echo "$resolution" | cut -d'x' -f1)
                HEIGHT=$(echo "$resolution" | cut -d'x' -f2)
                echo "**Testing with format $format and resolution $resolution**" >> "$OUTPUT_FILE"
                echo '```' >> "$OUTPUT_FILE"

                if [ "$format" = "YUYV" ]; then
                    gst-launch-1.0 -v v4l2src device="$device" ! "video/x-raw,format=YUY2,width=$WIDTH,height=$HEIGHT,framerate=30/1" ! videoconvert ! fakesink &>> "$OUTPUT_FILE"
                elif [ "$format" = "MJPG" ]; then
                    gst-launch-1.0 -v v4l2src device="$device" ! "image/jpeg,width=$WIDTH,height=$HEIGHT,framerate=30/1" ! jpegdec ! videoconvert ! fakesink &>> "$OUTPUT_FILE"
                else
                    echo "Unsupported format $format for GStreamer testing." >> "$OUTPUT_FILE"
                fi

                echo '```' >> "$OUTPUT_FILE"
                echo "" >> "$OUTPUT_FILE"
            done
        done

    else
        echo "$device does not exist." >> "$OUTPUT_FILE"
    fi
done

echo "Output written to $OUTPUT_FILE"
