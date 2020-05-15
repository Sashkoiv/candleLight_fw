# https://wiki.linklayer.com/index.php/CandleLightFirmware
sudo dfu-util --dfuse-address -d 0483:df11 -c 1 -i 0 -a 0 -s 0x8000000 -D gsusb_canable_a8a0757.bin