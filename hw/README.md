# [CandleLightFirmware](https://wiki.linklayer.com/index.php/CandleLightFirmware)

# Flashing candleLight
* Flashing requires the dfu-util tool. On Ubuntu, this can be installed with `sudo apt install dfu-util`.
* Disconnect the USB connector from the board, short the BOOT pins, then reconnect the USB connector. The device should enumerate as "STM32 BOOTLOADER".
* Flash the device with: `sudo dfu-util --dfuse-address -d 0483:df11 -c 1 -i 0 -a 0 -s 0x08000000 -D gsusb_cantact_8b2b2b4.bin`
* Disconnect the USB connector, un-short the BOOT pins, and reconnect. The device is now flashed!

# Using candleLight
* Ensure the gs_usb kernel module is enabled: `sudo modprobe gs_usb`
* Configure the device: `sudo ip link set can0 type can bitrate 500000`. Replace can0 with the name of your device, and 500000 with the desired bitrate.
* Bring the device up: `sudo ifconfig can0 up`
* Use the device with SocketCAN. For example, `candump can0`. See SocketCAN for more information.

# Test
```sh
sudo ip link set can0 type can bitrate 500000
sudo ifconfig can0 up
candump can0
```
```sh
sudo ip link set can1 type can bitrate 500000
sudo ifconfig can1 up
cansend can1 123#DEADBEEF
```
