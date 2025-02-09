# UBN2cameraMD
bash script diagnostic to test video drivers specific to Ubuntu Linux / debian based OS

UBN2cameraMD is a simple yet effective webcam diagnostic tool designed for Ubuntu 22.04 LTS. It scans connected video devices, retrieves detailed information, lists supported formats, and tests each device's functionality. The results are compiled into a Markdown file (`video_devices_info.md`) for easy review and sharing

## Features

- **Device Detection**: Identifies up to four connected webcam devices (`/dev/video0` to `/dev/video3`)
- **Detailed Information**: Retrieves comprehensive details of each detected webcam using `v4l2-ctl`
- **Supported Formats**: Lists all supported video formats and resolutions for each device
- **Functionality Testing**: Tests each webcam by attempting to capture a short video stream with `ffplay`
- **Markdown Reporting**: Compiles all diagnostics into a structured Markdown file (`video_devices_info.md`)

## Prerequisites

Before using UBCameraMD, ensure your system meets the following requirements:

- **Operating System**: Ubuntu 22.04 LTS / Debian based OS
- **Dependencies**:
```bash
sudo apt install v4l-utils ffmpeg
```

- **Permission Issues**
  - **Symptom**: Errors accessing video devices
  - **Solution**: Run the script with `sudo`:
    ```bash
    sudo ./ubcameramd.sh
    ```

- **ffplay Errors**
  - **Symptom**: Issues when running `ffplay` on a device
  - **Solution**: Ensure the device is not being used by another application. Verify device compatibility
 
  After execution, the script generates a video_devices_info.md file containing:

Device Sections: Each detected device (/dev/video0 to /dev/video3) has its own section<br />
Detailed Information: Comprehensive details about the device configuration and capabilities<br />
Supported Formats: Lists all supported video formats and resolutions<br />
Testing Results: Captures the terminal output from attempting to run ffplay on the device<br />

```bash
chmod +x ubn2cameramd.sh
```
```bash
./ubn2cameramd.sh
```
