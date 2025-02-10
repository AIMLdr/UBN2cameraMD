#!/bin/bash

# Set environment variables
export GST_DEBUG=4
export GST_DEBUG_FILE=gstreamer_debug.log
export GST_DEBUG_DUMP_DOT_DIR=/tmp
export G_DEBUG=fatal-warnings

# Function to check system state
check_system() {
    echo "System Information:"
    echo "==================="
    echo "Display Server: $XDG_SESSION_TYPE"
    echo "Graphics Driver:"
    glxinfo | grep "OpenGL vendor"
    echo "Video Devices:"
    ls -l /dev/video*
    echo "==================="
}

# Function to check webcam
check_webcam() {
    echo "Webcam Information:"
    echo "==================="
    v4l2-ctl --all
    echo "==================="
}

# Main test
check_system
check_webcam

echo "Testing GStreamer Pipeline..."
gst-launch-1.0 -v \
    v4l2src device=/dev/video0 \
    ! video/x-raw,width=320,height=240,framerate=15/1 \
    ! videoconvert \
    ! ximagesink sync=false \
    2>&1 | tee pipeline_output.log

echo "Debug information saved to gstreamer_debug.log and pipeline_output.log"
