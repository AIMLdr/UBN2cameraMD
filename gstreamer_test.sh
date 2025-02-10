#!/bin/bash

echo "Testing GStreamer pipeline with different sinks..."

# Function to test pipeline
test_pipeline() {
    local SINK=$1
    echo "Testing with $SINK..."
    timeout 10s gst-launch-1.0 \
        v4l2src device=/dev/video0 ! \
        video/x-raw,width=640,height=480 ! \
        videoconvert ! \
        $SINK
    echo "Exit code: $?"
    sleep 2
}

# Test different sinks
test_pipeline "ximagesink"
test_pipeline "glimagesink"
test_pipeline "autovideosink"

# Test MJPEG pipeline
echo "Testing MJPEG pipeline..."
gst-launch-1.0 \
    v4l2src device=/dev/video0 ! \
    image/jpeg,width=1280,height=720 ! \
    jpegdec ! \
    videoconvert ! \
    ximagesink
