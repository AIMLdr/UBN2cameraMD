#!/bin/bash

# Output file
OUTPUT_FILE="video_devices_info.md"

# Remove output file if it exists
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# Check if v4l-utils and ffmpeg are installed
if ! command -v v4l2-ctl &> /dev/null; then
    echo "v4l2-ctl could not be found. Please install v4l-utils package."
    exit 1
fi

if ! command -v ffplay &> /dev/null; then
    echo "ffplay could not be found. Please install ffmpeg package."
    exit 1
fi

# Loop through video devices 0 to 3
for i in {0..3}; do
    DEVICE="/dev/video$i"
    if [ -e "$DEVICE" ]; then
        echo "## Device: $DEVICE" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        echo "### Detailed Information" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        v4l2-ctl -d "$DEVICE" --all >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        echo "### Supported Formats" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        v4l2-ctl -d "$DEVICE" --list-formats-ext >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Attempt to test the device with ffplay
        echo "### Testing Device with ffplay" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo 'Terminal Output:' >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"

        # Run ffplay for a short duration (e.g., 5 seconds) and capture output
        ffplay -f v4l2 -i "$DEVICE" -t 5 -loglevel info -autoexit -nodisp &>> "$OUTPUT_FILE"

        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    else
        echo "$DEVICE does not exist."
    fi
done

echo "Output written to $OUTPUT_FILE"
