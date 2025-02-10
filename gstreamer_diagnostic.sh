#!/bin/bash
# gstreamer_diagnostic.sh (c) 2025 drAIML BANKON license 

echo "=== GStreamer Webcam Diagnostic ==="

# Function to test pipeline
test_pipeline() {
    echo "Testing: $1"
    echo "Command: $2"
    eval "$2"
    echo "---"
    sleep 2
}

# Check GStreamer installation
echo "GStreamer version:"
gst-launch-1.0 --version
echo "---"

# Check available video devices
echo "Video devices:"
ls -l /dev/video*
echo "---"

# Check v4l2 capabilities
echo "v4l2 device capabilities:"
v4l2-ctl --list-formats-ext
echo "---"

# Test different pipelines
test_pipeline "Basic pipeline" "timeout 5 gst-launch-1.0 v4l2src device=/dev/video0 ! videoconvert ! ximagesink"

test_pipeline "YUYV pipeline" "timeout 5 gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,format=YUY2,width=640,height=480 ! videoconvert ! ximagesink"

test_pipeline "MJPEG pipeline" "timeout 5 gst-launch-1.0 v4l2src device=/dev/video0 ! image/jpeg,width=640,height=480 ! jpegdec ! videoconvert ! ximagesink"

# Check environment
echo "Environment checks:"
echo "DISPLAY: $DISPLAY"
echo "XDG_SESSION_TYPE: $XDG_SESSION_TYPE"
echo "---"

# Check GStreamer plugins
echo "Installed GStreamer plugins:"
dpkg -l | grep gstreamer1.0-plugins
echo "---"

echo "=== Diagnostic Complete ==="
