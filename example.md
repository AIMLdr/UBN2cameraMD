## Device: /dev/video0

### Detailed Information
```
Driver Info:
	Driver name      : uvcvideo
	Card type        : HP Wide Vision FHD Camera: HP W
	Bus info         : usb-0000:04:00.3-5.2
	Driver version   : 6.8.12
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : HP Wide Vision FHD Camera: HP W
	Serial           : 200901010001
	Bus info         : usb-0000:04:00.3-5.2
	Media version    : 6.8.12
	Hardware revision: 0x00000012 (18)
	Driver version   : 6.8.12
Interface Info:
	ID               : 0x03000002
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : HP Wide Vision FHD Camera: HP W
	Function         : V4L2 I/O
	Flags            : default
	Pad 0x01000007   : 0: Sink
	  Link 0x02000013: from remote pad 0x100000a of entity 'Extension 6' (Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
	Width/Height      : 640/480
	Pixel Format      : 'YUYV' (YUYV 4:2:2)
	Field             : None
	Bytes per Line    : 1280
	Size Image        : 614400
	Colorspace        : sRGB
	Transfer Function : Rec. 709
	YCbCr/HSV Encoding: ITU-R 601
	Quantization      : Default (maps to Limited Range)
	Flags             : 
Crop Capability Video Capture:
	Bounds      : Left 0, Top 0, Width 640, Height 480
	Default     : Left 0, Top 0, Width 640, Height 480
	Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 640, Height 480, Flags: 
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 640, Height 480, Flags: 
Streaming Parameters Video Capture:
	Capabilities     : timeperframe
	Frames per second: 30.000 (30/1)
	Read buffers     : 0

User Controls

                     brightness 0x00980900 (int)    : min=-64 max=64 step=1 default=0 value=0
                       contrast 0x00980901 (int)    : min=0 max=100 step=1 default=50 value=50
                     saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=100 max=500 step=1 default=300 value=300
                           gain 0x00980913 (int)    : min=0 max=128 step=1 default=0 value=0
           power_line_frequency 0x00980918 (menu)   : min=0 max=3 default=2 value=2 (60 Hz)
				0: Disabled
				1: 50 Hz
				2: 60 Hz
				3: Auto
      white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=10 default=4600 value=4600 flags=inactive
                      sharpness 0x0098091b (int)    : min=0 max=100 step=1 default=50 value=50
         backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
				1: Manual Mode
				3: Aperture Priority Mode
         exposure_time_absolute 0x009a0902 (int)    : min=10 max=2046 step=1 default=255 value=255 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
```

### Supported Formats
```
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture

	[0]: 'MJPG' (Motion-JPEG, compressed)
		Size: Discrete 640x360
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 176x144
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 320x240
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 352x288
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 640x480
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 1280x720
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 1920x1080
			Interval: Discrete 0.033s (30.000 fps)
	[1]: 'YUYV' (YUYV 4:2:2)
		Size: Discrete 640x360
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 176x144
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 320x240
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 352x288
			Interval: Discrete 0.033s (30.000 fps)
		Size: Discrete 640x480
			Interval: Discrete 0.033s (30.000 fps)
```

### Testing Device with ffplay

Terminal Output:
```
ffplay version 4.4.2-0ubuntu0.22.04.1 Copyright (c) 2003-2021 the FFmpeg developers
  built with gcc 11 (Ubuntu 11.2.0-19ubuntu1)
  configuration: --prefix=/usr --extra-version=0ubuntu0.22.04.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libmfx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
  libavutil      56. 70.100 / 56. 70.100
  libavcodec     58.134.100 / 58.134.100
  libavformat    58. 76.100 / 58. 76.100
  libavdevice    58. 13.100 / 58. 13.100
  libavfilter     7.110.100 /  7.110.100
  libswscale      5.  9.100 /  5.  9.100
  libswresample   3.  9.100 /  3.  9.100
  libpostproc    55.  9.100 / 55.  9.100
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
Input #0, video4linux2,v4l2, from '/dev/video0':
  Duration: N/A, start: 56714.361290, bitrate: 147456 kb/s
  Stream #0:0: Video: rawvideo (YUY2 / 0x32595559), yuyv422, 640x480, 147456 kb/s, 30 fps, 30 tbr, 1000k tbn, 1000k tbc
Failed to open file '/dev/video0' or configure filtergraph

```

## Device: /dev/video1

### Detailed Information
```
Driver Info:
	Driver name      : uvcvideo
	Card type        : HP Wide Vision FHD Camera: HP W
	Bus info         : usb-0000:04:00.3-5.2
	Driver version   : 6.8.12
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : HP Wide Vision FHD Camera: HP W
	Serial           : 200901010001
	Bus info         : usb-0000:04:00.3-5.2
	Media version    : 6.8.12
	Hardware revision: 0x00000012 (18)
	Driver version   : 6.8.12
Interface Info:
	ID               : 0x03000005
	Type             : V4L Video
Entity Info:
	ID               : 0x00000004 (4)
	Name             : HP Wide Vision FHD Camera: HP W
	Function         : V4L2 I/O
Priority: 2
Format Metadata Capture:
	Sample Format   : 'UVCH' (UVC Payload Header Metadata)
	Buffer Size     : 10240
```

### Supported Formats
```
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture

```

### Testing Device with ffplay

Terminal Output:
```
ffplay version 4.4.2-0ubuntu0.22.04.1 Copyright (c) 2003-2021 the FFmpeg developers
  built with gcc 11 (Ubuntu 11.2.0-19ubuntu1)
  configuration: --prefix=/usr --extra-version=0ubuntu0.22.04.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libmfx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
  libavutil      56. 70.100 / 56. 70.100
  libavcodec     58.134.100 / 58.134.100
  libavformat    58. 76.100 / 58. 76.100
  libavdevice    58. 13.100 / 58. 13.100
  libavfilter     7.110.100 /  7.110.100
  libswscale      5.  9.100 /  5.  9.100
  libswresample   3.  9.100 /  3.  9.100
  libpostproc    55.  9.100 / 55.  9.100
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
[video4linux2,v4l2 @ 0x7aef98000cc0] ioctl(VIDIOC_G_INPUT): Inappropriate ioctl for device
/dev/video1: Inappropriate ioctl for device

```

## Device: /dev/video2

### Detailed Information
```
Driver Info:
	Driver name      : uvcvideo
	Card type        : HP Wide Vision FHD Camera: HP I
	Bus info         : usb-0000:04:00.3-5.2
	Driver version   : 6.8.12
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : HP Wide Vision FHD Camera: HP I
	Serial           : 200901010001
	Bus info         : usb-0000:04:00.3-5.2
	Media version    : 6.8.12
	Hardware revision: 0x00000012 (18)
	Driver version   : 6.8.12
Interface Info:
	ID               : 0x03000002
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : HP Wide Vision FHD Camera: HP I
	Function         : V4L2 I/O
	Flags            : default
	Pad 0x01000007   : 0: Sink
	  Link 0x02000013: from remote pad 0x100000a of entity 'Extension 10' (Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 11: ok)
Format Video Capture:
	Width/Height      : 340/340
	Pixel Format      : 'YUYV' (YUYV 4:2:2)
	Field             : None
	Bytes per Line    : 680
	Size Image        : 231200
	Colorspace        : sRGB
	Transfer Function : Rec. 709
	YCbCr/HSV Encoding: ITU-R 601
	Quantization      : Default (maps to Limited Range)
	Flags             : 
Crop Capability Video Capture:
	Bounds      : Left 0, Top 0, Width 340, Height 340
	Default     : Left 0, Top 0, Width 340, Height 340
	Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 340, Height 340, Flags: 
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 340, Height 340, Flags: 
Streaming Parameters Video Capture:
	Capabilities     : timeperframe
	Frames per second: 30.000 (30/1)
	Read buffers     : 0
```

### Supported Formats
```
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture

	[0]: 'YUYV' (YUYV 4:2:2)
		Size: Discrete 340x340
			Interval: Discrete 0.033s (30.000 fps)
```

### Testing Device with ffplay

Terminal Output:
```
ffplay version 4.4.2-0ubuntu0.22.04.1 Copyright (c) 2003-2021 the FFmpeg developers
  built with gcc 11 (Ubuntu 11.2.0-19ubuntu1)
  configuration: --prefix=/usr --extra-version=0ubuntu0.22.04.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libmfx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
  libavutil      56. 70.100 / 56. 70.100
  libavcodec     58.134.100 / 58.134.100
  libavformat    58. 76.100 / 58. 76.100
  libavdevice    58. 13.100 / 58. 13.100
  libavfilter     7.110.100 /  7.110.100
  libswscale      5.  9.100 /  5.  9.100
  libswresample   3.  9.100 /  3.  9.100
  libpostproc    55.  9.100 / 55.  9.100
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
Input #0, video4linux2,v4l2, from '/dev/video2':
  Duration: N/A, start: 56714.902781, bitrate: 55488 kb/s
  Stream #0:0: Video: rawvideo (YUY2 / 0x32595559), yuyv422, 340x340, 55488 kb/s, 30 fps, 30 tbr, 1000k tbn, 1000k tbc
Failed to open file '/dev/video2' or configure filtergraph

```

## Device: /dev/video3

### Detailed Information
```
Driver Info:
	Driver name      : uvcvideo
	Card type        : HP Wide Vision FHD Camera: HP I
	Bus info         : usb-0000:04:00.3-5.2
	Driver version   : 6.8.12
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : HP Wide Vision FHD Camera: HP I
	Serial           : 200901010001
	Bus info         : usb-0000:04:00.3-5.2
	Media version    : 6.8.12
	Hardware revision: 0x00000012 (18)
	Driver version   : 6.8.12
Interface Info:
	ID               : 0x03000005
	Type             : V4L Video
Entity Info:
	ID               : 0x00000004 (4)
	Name             : HP Wide Vision FHD Camera: HP I
	Function         : V4L2 I/O
Priority: 2
Format Metadata Capture:
	Sample Format   : 'UVCH' (UVC Payload Header Metadata)
	Buffer Size     : 10240
```

### Supported Formats
```
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture

```

### Testing Device with ffplay

Terminal Output:
```
ffplay version 4.4.2-0ubuntu0.22.04.1 Copyright (c) 2003-2021 the FFmpeg developers
  built with gcc 11 (Ubuntu 11.2.0-19ubuntu1)
  configuration: --prefix=/usr --extra-version=0ubuntu0.22.04.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libmfx --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
  libavutil      56. 70.100 / 56. 70.100
  libavcodec     58.134.100 / 58.134.100
  libavformat    58. 76.100 / 58. 76.100
  libavdevice    58. 13.100 / 58. 13.100
  libavfilter     7.110.100 /  7.110.100
  libswscale      5.  9.100 /  5.  9.100
  libswresample   3.  9.100 /  3.  9.100
  libpostproc    55.  9.100 / 55.  9.100
    nan    :  0.000 fd=   0 aq=    0KB vq=    0KB sq=    0B f=0/0   
[video4linux2,v4l2 @ 0x7d80b4000cc0] ioctl(VIDIOC_G_INPUT): Inappropriate ioctl for device
/dev/video3: Inappropriate ioctl for device

```
