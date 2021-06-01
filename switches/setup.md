# Calendar Tracking (Zigbee Switches)
<br />


## Functionality
When a Zigbee switch/button is pressed, a wireless signal is sent. The Zigbee signal is received by a Zigbee receiver ([Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick)) that is connected to a Linux server ([Raspberry Pi Zero W](https://www.raspberrypi.org)). The server receives and converts the Zigbee signal to an MQTT message (via [zigbee2mqtt](https://www.zigbee2mqtt.io)) which is used to create a calendar event via a user-defined event template (via [mqtt2caldav](https://github.com/107208579/mqtt2caldav)). The calendar event is sent to a CalDAV server for event storage and synchronisation with other CalDAV clients.
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Detail.png" width="740"> 
</p>
<br />
<br />

https://user-images.githubusercontent.com/6289141/120297608-d7eac800-c2fb-11eb-97d8-41e60def8116.mov

<br />
<br />



## Requirements
• Zigbee Switches ([Overview](https://www.zigbee2mqtt.io/information/supported_devices.html))<br />
• Zigbee Adapter ([Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick/))<br />
• Linux Server ([Raspberry Pi](https://www.raspberrypi.org))<br />
• CalDAV server ([Apple Calendar](https://www.icloud.com/calendar/), [Google Calendar](http://calendar.google.com), etc

<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Zigbee.png" width="740">    
</p>
<br />
<br />


## Disclaimer
The below information requires a fundamental understanding of Linux and the use of a command line terminal. Any information may be incomplete, incorrect, outdated, obsolete. Use at your own risk.
<br />
<br />



## Install Raspberry Pi OS
→ Get the Raspberry Pi Imager to write the Raspberry Pi OS image to an SD card<br />
https://www.raspberrypi.org/downloads/

→ NOTE: The following steps are performed via macOS<br />

→ For SSH connectivity add the following file to the root of the SD card<br />
`touch /Volumes/boot/ssh`

→ For WiFi connectivity add the following file to the root of the SD card<br /><br />
`vi /Volumes/boot/wpa_supplicant.conf`

    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    country=CA
    
    network={
    ssid="<your_network_name>"
    scan_ssid=1
    psk="<your_password>"
    }

→ The WiFi configuration can later be edited again with the following command<br />
`sudo vi /etc/wpa_supplicant/wpa_supplicant.conf`

→ Eject the SD Card<br />
`hdiutil eject /Volumes/boot/`

→ Transfer the SD Card to your Raspberry Pi and start the server
<br />
<br />



## Logon to the Raspberry Pi
→ Locate your Raspberry Pi network address<br />
`arp -a | grep -ia b8:27:eb`

→ Connect to your Raspberry Pi remotley via 'ssh'<br />
`ssh pi@xxx.xxx.xxx.xxx`<br />
• username: pi<br />
• password: raspberry
<br />
<br />



## Change Default Passwords
→ Change the default password for user 'pi'<br />
`passwd`

→ Change the default password for user 'root'<br />
` sudo passwd root`
<br />
<br />



## Deactivate Radio Antennas
→ If possible, disable Bluetooth to avoid interference with Zigbee

	dtoverlay=disable-bt

→ If possible, connect over Ethernet and disable Wifi to avoid interference with Zigbee

	dtoverlay=disable-wifi
<br />
<br />



## Update Raspberry Pi OS 
→ Check your operating system<br />
` uname -a`

→ Update your system's package list<br />
`sudo apt-get update`

→ Upgrade installed packages to their latest version<br />
`sudo apt-get dist-upgrade`

→ Remove downloaded .deb packages from /var/cache/apt/archives/<br />
`sudo apt-get clean`<br />
`sudo apt-get --purge -y autoremove`
<br />
<br />



## Reboot Raspberry Pi OS
   → Update the crontab if you want to reboot your server weekly<br />
`crontab -e`

	# .---------------- minute       (0 - 59)
	# |  .------------- hour         (0 - 23)
	# |  |  .---------- day of month (1 - 31)
	# |  |  |  .------- month        (1 - 12) OR (jan,feb,mar,apr..)
	# |  |  |  |  .---- day of week  (0 - 6) (Sunday=0 or 7) OR (sun,mon,tue,wed,thu,fri,sat)
	# |  |  |  |  |
	# *  *  *  *  *  command to be executed
	# Reboot Every Sunday 04:00
	0 4 * * 0 /sbin/shutdown -r now
<br />
<br />



## Check Log Files for Errors
→ Always check the start-up logfile for any potential errors<br />
`dmesg`

→ Check the boot.log file<br />
`less /var/log/boot.log`
<br />
<br />



## Get a Zigbee Adapter
→ The Zigbee adapter used here is an [Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick) but [others](https://www.zigbee2mqtt.io/information/supported_adapters.html) should work too.
<br />
<br />



## Flash the Zigbee Adapter
→ Follow the instructions for flashing the CC2652 chip<br />
https://www.zigbee2mqtt.io/information/supported_adapters.html<br />
https://electrolama.com/radio-docs/#step-3-flash-the-firmware-on-your-stick<br />

→ NOTE: The following steps outlined are for flashing the CC2652 chip under macOS<br />

→ Connect the Zigbee adapter via USB and check if it was detected<br />
`sudo dmesg | grep AppleUSBCH`<br />
*[1458325.212772]: IOUserSerial::AppleUSBCHCOM::<private>: 127 0x600002c9c058*
*[1458325.213170]: DK: AppleUSBCHCOM-0x100048d92::start(IOUSBHostInterface-0x100048d90) ok*

→ Install python3 and pip<br />
`xcode-select --install`<br />
`brew install python3`
 
→ Upgrade 'pip' and install the following packages<br />
https://github.com/JelmerT/cc2538-bsl
`sudo pip3 install --upgrade pip`<br />
`pip3 install pyserial intelhex python-magic`

→ Download the boot loader<br />
`wget -O cc2538-bsl.zip https://codeload.github.com/JelmerT/cc2538-bsl/zip/master && unzip cc2538-bsl.zip`

→ Look for the latest 'Electrolama zzh' firmware
https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin
*CC2652R_coordinator_20210120.zip*

→ Check the exact device location the CC2652 is connected to<br />
`ls -l /dev/tty.usbserial-*`
*/dev/tty.usbserial-1460*

→ Remove the Zigbee adapter from the USB port
→ Whilst removed, press the reset button on the board<br />
→ Keep pressing while plugging the device back into the USB port<br />
→ Release the button after 3 seconds<br />

→ Run the following command (note the device location)<br />
`./cc2538-bsl.py -p /dev/tty.usbserial-1460 -evw CC26X2R1_20201026.hex`<br />
*Opening port /dev/tty.usbserial-1460, baud 500000*<br />
*Reading data from CC26X2R1_20201026.hex*<br />
*Your firmware looks like an Intel Hex file*<br />
*Connecting to target...*<br />
*CC1350 PG2.0 (7x7mm): 352KB Flash, 20KB SRAM, CCFG.BL_CONFIG at 0x00057FD8*<br />
*Primary IEEE Address: 00:12:4B:00:21:B7:77:5E*<br />
*Performing mass erase*<br />
*Erasing all main bank flash sectors*<br />
*Erase done*<br />
*Writing 360448 bytes starting at address 0x00000000*<br />
*Write 104 bytes at 0x00057F980*<br />
*Write done*<br />
*Verifying by comparing CRC32 calculations.*<br />
*Verified (match: 0x0a0682b4)*<br />

→ Remove the flashed Zigbee adapter from the macOS USB port
<br />
<br />

	
	
## Connect the Zigbee Adapter 
→ Connect the flashed Zigbee adapter to the Raspberry Pi USB port<br />
→ Ideally use an USB extension cable to physically distance the adapter from the Raspberry Pi<br />
→ Determine the device location<br />
`ls -l /dev/serial/by-id`<br />
*lrwxrwxrwx 1 root 13 Dec  4 20:34 usb-1a86_USB_Serial-if00-port0 -> ../../ttyUSB0*<br />

`ls -l /dev/ttyUSB0`<br />
*crw-rw---- 1 root 188, 0 Dec  4 20:34 /dev/ttyUSB0*<br />

→ For troubleshooting run any of the following commands<br />
`sudo lsusb`<br /><br />
*Bus 001 Device 002: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter*<br />
*Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub*<br />

`sudo lsusb -v`<br />
*idVendor           0x1a86 QinHeng Electronics*<br />
*idProduct          0x7523 HL-340 USB-Serial adapter*<br />
*...*<br />

`sudo less /var/log/messages | grep ch341`<br />
*[   17.901271] usbcore: registered new interface driver ch341*<br />
*[   17.901432] usbserial: USB Serial support registered for ch341-uart*<br />
*[   17.901604] ch341 1-1:1.0: ch341-uart converter detected*<br />
*[   17.992707] usb 1-1: ch341-uart converter now attached to ttyUSB0*<br />

`dmesg | tail -100`<br />
*[   18.410939] usbcore: registered new interface driver ch341*<br />
*[   18.411103] usbserial: USB Serial support registered for ch341-uart*<br />
*[   18.411294] ch341 1-1:1.0: ch341-uart converter detected*<br />
*[   18.474904] usb 1-1: ch341-uart converter now attached to ttyUSB0*<br />
<br />
<br />

	
	
## Install  MQTT (Mosquitto)
→ Install the Mosquitto broker and clients<br />
https://randomnerdtutorials.com/how-to-install-mosquitto-broker-on-raspberry-pi/<br />
`sudo apt install -y mosquitto mosquitto-clients`<br />
`sudo systemctl enable mosquitto.service`

→ Check the running Mosquitto version<br />
`mosquitto -v`<br />
*1604153551: mosquitto version 1.5.7 starting*<br />
*1604153551: Using default config.*<br />
*1604153551: Opening ipv4 listen socket on port 1883.*<br />
*1604153551: Error: Address already in use*
<br />
<br />



## Secure MQTT (Mosquitto)
→ Set a user and password<br />
`sudo mosquitto_passwd -c /etc/mosquitto/passwd mqtt`<br />
• User		mqtt<br />
• Pass		<your_password>

→ Update the config file and add the following section<br />
`sudo vi /etc/mosquitto/mosquitto.conf`

    password_file /etc/mosquitto/passwd
    allow_anonymous false

→ Restart Mosquitto with the new configuration file changes<br />
`sudo mosquitto -c /etc/mosquitto/mosquitto.conf`

→ Verify the user and the password<br />
→ An empty line will be shown if the connection is successul<br />
`mosquitto_sub -h localhost -v -t '#' -p 1883 -u mqtt -P <your_password>`

→ Incorrect access will send an error message<br />
*Connection Refused: not authorised.*
<br />
<br />



## Install Zigbee2MQTT 
→ Zigbee2MQTT converts the Zigbee signal to an MQTT event<br />

→ Look for the latest Zigbee2MQTT installation<br />
https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html<br />
`sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -`

→ If you receive an error message as below:<br />
*## You appear to be running on ARMv6 hardware. Unfortunately this is not*<br />
*currently supported by the NodeSource Linux distributions. Please use the*<br />
*'linux-armv6l' binary tarballs available directly from nodejs.org for*<br />
*Node.js 4 and later.*

→ Check your ARM architecture version<br />
`uname -m`<br />
*armv6l*

→ Or use this command<br />
`cat /proc/cpuinfo`<br />
*model name	: ARMv6-compatible processor rev 7 (v6l)*

→ Manually download and install an unoffical NodeJS version<br />
https://unofficial-builds.nodejs.org/download/release/<br />
`wget https://unofficial-builds.nodejs.org/download/release/v12.9.1/node-v12.9.1-linux-armv6l.tar.xz`<br />
`tar -xvf node-v12.9.1-linux-armv6l.tar.xz`<br />
`sudo cp -R node-v12.9.1-linux-armv6l/* /usr/local/`<br />
`rm -rf node-v12.9.1-linux-armv6l node-v12.9.1-linux-armv6l.tar.xz`<br />

→ Check if the download was successful<br />
`node -v`<br />
*v12.9.1*

→ Check if the download was successful (this may take a bit)<br />
`npm -v`<br />
*6.10.2*

→ Install git, gcc, and g++<br />
`sudo apt-get install -y git make g++ gcc`

→ Clone the Zigbee2MQTT repository<br />
`sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt`

→ Change permissions to your local user<br />
`udo chown -R pi:pi /opt/zigbee2mqtt`

→ Change into the Zigbee directory<br />
`cd /opt/zigbee2mqtt`

→ Install dependencies (this may take ~20 minutes on a Rasperry Pi Zero)<br />
`npm ci --production`<br />
*[..................] | extractTree: verb extractTree extracting dependencies to node_modules/*<br />
*[ .................] | extractTree: sill extract ms@2.0.0 extracted to /opt/zigbee2mqtt/node_modules/ms (5844ms)*<br />
*[  ................] - extractTree: sill extract jest-util@26.3.0 extracted to /opt/zigbee2mqtt/node_modules/jest-util (15625ms)*<br />
*[        ..........] / extractTree: sill extract path-dirname@1.0.2 extracted to /opt/zigbee2mqtt/node_modules/path-dirname (11930ms)*<br />
*[         .........] \ reify:@babel/code-frame: timing reify:loadBundles Completed in 0ms*<br />
*[          ........] \ reify:has-values: http fetch GET 200 https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.2.1.tgz 276431ms*<br />
*[           .......] \ reify:parse-json: timing reifyNode:node_modules/path-type Completed in 386566ms*<br />
*[            ......] \ reify:define-property: timing reifyNode:node_modules/once Completed in 392704ms*<br />
*[             .....] | reify:jest-environment-jsdom: timing reifyNode:node_modules/jest-environment-node Completed in 432610ms*<br />
*[              ....] / reify:has-flag: timing reifyNode:node_modules/graceful-fs Completed in 471319ms*<br />
*[              ....] / reify:has-flag: timing reifyNode:node_modules/graceful-fs Completed in 471319ms*<br />
*[               ...] | reify:ms: timing reifyNode:node_modules/eslint-config-google Completed in 506123ms*<br />
*[                ..] \ reify:concat-stream: http fetch GET 200 https://registry.npmjs.org/acorn-walk/-/acorn-walk-7.2.0.tgz 363501ms*<br />
*[                 .] - reify:@jest/globals: timing reifyNode:node_modules/@jest/source-map Completed in 567117ms*<br />
*[                  ] - reify:@typescript-eslint/types: http fetch GET 200 https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz 408920ms*<br />
*...*<br />
*...*<br />

→ Verify that your final output line is similar to this:<br />
*gyp info ok*<br />
*added 827 packages in 352.324s*
<br />
<br />



## Configure Zigbee2MQTT<br />
→ Basic configuration as shown below - further details underneath<br />
`vi /opt/zigbee2mqtt/data/configuration.yaml`<br />

    serial:
      port: /dev/ttyUSB0
    permit_join: true
    homeassistant: false
    mqtt:
      base_topic: mqtt
      server: 'mqtt://localhost'
      user: mqtt
      password: <your_password>
    advanced:
      network_key: GENERATE
      pan_id: 0x1a62
      elapsed: false
      timestamp_format: 'YYYY/MM/DD HH:mm:ss'

→ Configure Zigbee2MQTT for the correct USB device location<br />

    serial:
      port: /dev/ttyUSB0

→ Secure your Zigbee2MQTT network to run with a key<br />
https://www.zigbee2mqtt.io/information/configuration.html
https://www.zigbee2mqtt.io/how_tos/how_to_secure_network.html

    advanced:
        network_key: GENERATE

→ And add the user and the password to connect to Mosquitto<br />

    user: 'user'
    password: '<your_password>'

→ And change the base topic to the correct name<br />

    base_topic: mqtt

→ Change the default ID if more than one network should run in parallel<br />
→ The default PAN ID for Zigbee2MQTT is set to '0x1a62' (which is 6754 in decimal)<br />
→ PAN IDs can be any value in the range of 0×0000 – 0xFFFE<br />
https://www.zigbee2mqtt.io/information/configuration.html

    advanced:
      network_key: GENERATE
      pan_id: 0x1a62

→ Quickly check if your node started up and runs correctly<br />
`cd /opt/zigbee2mqtt`<br />
`npm start `<br />
*zigbee2mqtt@1.15.0 start /opt/zigbee2mqtt*<br />
*node index.js*<br />
*<br />*
*Zigbee2MQTT:info  2020-10-31 22:30:23: Logging to console and directory: '/opt/zigbee2mqtt/data/log/2020-10-31.22-30-22' filename: log.txt*<br />
*Zigbee2MQTT:info  2020-10-31 22:30:28: Starting Zigbee2MQTT version 1.15.0 (commit #ed8b4e5)*<br />
*...*<br />
*Zigbee2MQTT:info  2020-10-31 22:30:38: Connecting to MQTT server at mqtt://localhost*<br />
*Zigbee2MQTT:info  2020-10-31 22:30:40: Connected to MQTT server*<br />
*  ...<br />

→ Check the journal <br />
`sudo journalctl -u zigbee2mqtt.service -f`
*zigbee2mqtt@1.18.1 start /opt/zigbee2mqtt*

→ Configure Zigbee2MQTT to run as daemon in the background<br />
`sudo vi /etc/systemd/system/zigbee2mqtt.service`

    [Unit]
    Description=zigbee2mqtt
    After=network.target
    
    [Service]
    ExecStart=/usr/local/bin/npm start
    WorkingDirectory=/opt/zigbee2mqtt
    StandardOutput=inherit
    StandardError=inherit
    Restart=always
    User=pi
    
    [Install]
    WantedBy=multi-user.target

→ Start Zigbee2MQTT<br />
`sudo systemctl restart zigbee2mqtt`

→ Check if Zigbee2MQTT is running<br />
`systemctl status zigbee2mqtt.service`<br />
`systemctl | egrep 'zigbee2mqtt'`<br />
`sudo journalctl -u zigbee2mqtt.service -f`

→ Start Zigbee2MQTT upon system boot<br />
`sudo systemctl enable zigbee2mqtt.service`
<br />
<br />



## Upgrade Zigbee2MQTT<br />
→ Stop Zigbee2MQTT<br />
`sudo systemctl stop zigbee2mqtt`
`cd /opt/zigbee2mqtt`

→ Backup configuration<br />
`cp -R data data-backup`

→ Update<br />
`git checkout HEAD -- npm-shrinkwrap.json`<br />
`git pull`<br />
`npm ci`

→ Restore configuration<br />
`cp -R data-backup/* data`<br />
`rm -rf data-backup`
<br />
<br />

	
	
## Roll back Zigbee2MQTT<br />
→ Find the version to rollback to<br /> 
https://github.com/Koenkk/zigbee2mqtt/tags

→ Roll back<br />
`cd /opt/zigbee2mqtt`<br />
`git checkout 99274c7`

→ Reconfigure 'npm'<br />
`npm ci --production`<br />
`npm start`
<br />
<br />

	

## Zigbee and WiFi Interference 
→ Verify that Zigbee and WiFi run on different channels to avoid signal interference
https://www.zigbee2mqtt.io/how_tos/how_to_improve_network_range_and_stability.html
https://www.digi.com/resources/documentation/digidocs/90001537/references/r_channels_zigbee.htm
https://support.metageek.com/hc/en-us/articles/203845040-Zigbee-and-WiFi-Coexistence
• Zigbee operates on 2.4 Ghz with 16 channels between 11 and 26<br />
• Zigbee channels 25 and 26 might not be supported by all hardware<br />

→ Interference happens with the following setups<br />
• Wifi Channel 01 interferes with Zigbee channels 11, 12, 13, 14, 15, 16, 17<br />
• Wifi Channel 06 interferes with Zigbee channels 13, 14, 15, 16, 17, 18, 19, 20, 21, 22<br />
• Wifi Channel 11 interferes with Zigbee channels 19, 20, 21, 22, 23, 24<br />

→ Ideally both networks are being set on opposing ends of the channel spectrum<br />
→ Make sure you don't have a 'smart' WiFi router which automatically changes channels<br />
• Wifi Channel 01 with Zigbee channels 19, 20, 21, 22, 23, 24<br />
• Wifi Channel 11 with Zigbee channels 11, 12, 13, 14, 15, 16, 17<br />

→ Check the last log entry to figure out which channel Zigbee uses <br />
`less /opt/zigbee2mqtt/data/log/*/log.txt | grep channel | awk -F\network\"\: '{print $2}'`<br />
*{"channel":11,"extendedPanID":"0xdddddddddddddddd","panID":6754},"permit_join":true,"version":"1.15.0"}'*<br />

→ Check your devices' wireless network connection and look for 'Frequency'<br />
`iwconfig wlan0`<br />
*wlan0     IEEE 802.11  ESSID:"INTERNET"*<br />
*Mode:Managed  Frequency:2.462 GHz  Access Point: E2:63:DA:1C:53:C6*<br />

→ Scan your network to compare the frequency with the channel<br />
`sudo iwlist wlan0 scan | grep 'Frequency' | sort | uniq -c | sort -n`<br />
• 1  Frequency:2.437 GHz (Channel 6)<br />
• 2  Frequency:2.417 GHz (Channel 2)<br />
• 2  Frequency:2.442 GHz (Channel 7)<br />
• 3  Frequency:2.462 GHz (Channel 11)<br />

→ Ideally use an USB extension to physically distance the Zigbee antenna from the server
<br />
<br />

	

## Change Zigbee Channel 
→ In order to change the default Zigbee channel edit the configuration.yaml<br />
→ Use a 'Zigbee Light Link' channel to avoid problems: 11, 15, 20<br />
→ IMPORTANT: Change of channel requires re-pairing of all devices<br />
https://www.zigbee2mqtt.io/information/configuration.html

`vi /opt/zigbee2mqtt/data/configuration.yaml`<br />

    advanced:
      channel: 15

→ Restart the service<br />
`sudo systemctl restart zigbee2mqtt`
<br />
<br />


	
## Zigbee and BlueTooth Interference<br />
→ Bluetooth signals are a potential source of interference for ZigBee and WiFi networks<br />
https://www.zigbee2mqtt.io/how_tos/how_to_improve_network_range_and_stability.html

→ Check if Bluetooth as a service is running<br />
`sudo service bluetooth status`<br />
`hciconfig -a`

→ Permanently disable Bluetooth<br />
`sudo vi /boot/config.txt`

    # Uncomment to enable Bluetooth
    dtoverlay=disable-bt

→ Restart your server for the changes to take effect<br /> 
`sudo reboot`

→ Ideally us an USB extension to physically distance the Zigbee adapter from the server<br />
<br />
<br />



## Pair Switches with the ZigBee Adapter
→ Check that your configuration.yaml allows to join new devices<br />
`less /opt/zigbee2mqtt/data/configuration.yaml`

    permit_join: true

→ Subscribe with the Mosquitto client to all topics<br />
`mosquitto_sub -u mqtt -P <your_password> -h localhost -p 1883 -v -t '#'`

→ Example: Ikea Tradfri E1524/E1810 (Round Remote Control)<br />
https://www.zigbee2mqtt.io/devices/E1524_E1810.html
→ Press connect button inside casing 4 times in short order

→ You should see an output similar to this:<br />
*zigbee2mqtt/bridge/state online*<br />
*zigbee2mqtt/bridge/config {"commit":"ed8b4e5","coordinator":{"meta":{"maintrel":3,"majorrel":2,"minorrel":6,"product":0,"revision":20190608,"transportrev":2},"type":"zStack12"},"log_level":"info","network":{"channel":11,"extendedPanID":"0xdddddddddddddddd","panID":6754},"permit_join":true,"version":"1.15.0"}*<br />
*zigbee2mqtt/bridge/log {"message":"announce","meta":{"friendly_name":"0xbc33acfffed4ed8b"},"type":"device_announced"}*<br />

→ Alternatively check the systems journald log files<br />
`sudo journalctl -u zigbee2mqtt.service -f`

→ Here are the button press options<br />
*Single Left		mqtt/Ikea_Round_Remote_Control {"action":"arrow_left_click","linkquality":60,"update_available":false}*<br />
*Single Press Right 	mqtt/Ikea_Round_Remote_Control {"action":"arrow_right_click","linkquality":42,"update_available":false}*<br />
*Single Press Up	mqtt/Ikea_Round_Remote_Control {"action":"brightness_up_click","linkquality":73,"update_available":false}*<br />
*Single Press Down	mqtt/Ikea_Round_Remote_Control {"action":"brightness_down_click","linkquality":76,"update_available":false}*<br />
*Single Press Center	mqtt/Ikea_Round_Remote_Control {"action":"toggle","linkquality":81,"update_available":false}*<br />
*Long Press Left	mqtt/Ikea_Round_Remote_Control {"action":"arrow_left_hold","linkquality":28,"update_available":false}*<br />
			mqtt/Ikea_Round_Remote_Control {"action":"arrow_left_release","duration":2.811,"linkquality":78,"update_available":false}*<br />
*Long Press Right	mqtt/Ikea_Round_Remote_Control {"action":"arrow_right_hold","linkquality":70,"update_available":false}*<br />
			mqtt/Ikea_Round_Remote_Control {"action":"arrow_right_release","duration":1.875,"linkquality":86,"update_available":false}*<br />
*Long Press Up		mqtt/Ikea_Round_Remote_Control {"action":"brightness_up_hold","linkquality":63,"update_available":false}*<br />
			mqtt/Ikea_Round_Remote_Control {"action":"brightness_up_release","linkquality":92,"update_available":false}*<br />
*Long Press Down	mqtt/Ikea_Round_Remote_Control {"action":"brightness_down_hold","linkquality":92,"update_available":false}*<br />
			mqtt/Ikea_Round_Remote_Control {"action":"brightness_down_release","linkquality":68,"update_available":false}*<br />
*Long Press Center	mqtt/Ikea_Round_Remote_Control {"action":"toggle","linkquality":84,"update_available":false}*<br />
			mqtt/Ikea_Round_Remote_Control {"action":"toggle_hold","linkquality":86,"update_available":false}*<br />
<br />
<br />

	
	
→ Example: Sonoff SNZB-01 (Square Button)<br />
https://www.zigbee2mqtt.io/devices/SNZB-01.html<br />
→ Long press reset button for 5 seconds until the LED indicator flashes three times, which means the device has entered pairing mode<br />

→ Here are the button press options<br />
*Single Press		mqtt/0x00124b001f8ab0cd {"action":"single","linkquality":13}'*<br />
*Double Press		mqtt/0x00124b001f8ab0cd {"action":"double","linkquality":13}'*<br />
*Long Press		mqtt/0x00124b001f8ab0cd {"action":"long","linkquality":15}'*<br />
<br />

→ Example:XiaoMi Aqara WXKG01LM (Round Button)<br />
https://www.zigbee2mqtt.io/devices/WXKG01LM.html

→ Press and hold the reset button on the device for 5 seconds until the blue light starts blinking<br />

→ Here are the button press options
*Single Press		mqtt/XiaoMi_Test_1 {"action":"single","battery":100,"linkquality":86,"voltage":3052}'*<br />
*Double Press		mqtt/XiaoMi_Test_1 {"action":"double","battery":100,"linkquality":94,"voltage":3052}'*<br />
*Triple Press		mqtt/XiaoMi_Test_1 {"action":"triple","battery":100,"linkquality":102,"voltage":3052}'*<br />
*Quadruple Press	mqtt/XiaoMi_Test_1 {"action":"quadruple","battery":100,"linkquality":102,"voltage":3052}'*<br />
*Many (4+)		mqtt/XiaoMi_Test_1 {"action":"many","battery":100,"linkquality":92,"voltage":3052}'*<br />
*Long Hold		mqtt/XiaoMi_Test_1 {"action":"hold","battery":100,"linkquality":94,"voltage":3052}'*<br />
*Release		mqtt/XiaoMi_Test_1 {"action":"release","battery":100,"duration":2417,"linkquality":86,"voltage":3052}'*<br />

→ Check your configuration file again and see if all devices have been added successfully<br />
`less /opt/zigbee2mqtt/data/configuration.yaml`

    devices:
      '0x00158d000403091a':
        friendly_name: '0x00158d000403091a'
        legacy: false
      '0x00124b001f8ab0cd':
        friendly_name: '0x00124b001f4ab0cd'

→ Give your devices a nicer name by editing the 'friendly_name'<br />

    devices:
      '0x00158d000403091a':
        friendly_name: 'XiaoMi_Test_1'
        legacy: false
      '0x00124b001f4ab0cd':
        friendly_name: 'Sonoff_Test_1'

→ Set 'permit_join' to 'false' AFTER all devices have been paired<br />
`vi /opt/zigbee2mqtt/data/configuration.yaml`

    permit_join: false

→ Restart the service for the changes to take effect<br />
`sudo systemctl start zigbee2mqtt1`
<br />
<br />



## Add a Cheat Sheet 
→ Add the following cheat file to your servers home directory<br />
`vi readme.txt`

    ===== CC2652 ===========================================================
    sudo lsusb
    sudo lsusb -v
    sudo less /var/log/messages | grep ch341
    ls -l /dev/serial/by-id
    ls -l /dev/ttyUSB0
    
    ===== ZIGBEE2MQTT ======================================================
    sudo systemctl start zigbee2mqtt
    sudo systemctl stop zigbee2mqtt
    sudo systemctl restart zigbee2mqtt
    ------------------------------------------------------------------------
    tail -f /opt/zigbee2mqtt/data/log/*/log.txt
    sudo journalctl -u zigbee2mqtt.service -f
    tail -f mqtt2caldav/logs/mqtt2caldav.log
    ------------------------------------------------------------------------
    sudo vi /etc/systemd/system/zigbee2mqtt.service
    ------------------------------------------------------------------------
    vi /opt/zigbee2mqtt/data/configuration.yaml
    less /opt/zigbee2mqtt/data/configuration.yaml

    ===== LINUX ============================================================
    sudo iftop
    watch -n 1 netstat -t
    watch -n 5 'sudo iptables -nvL | grep -v "0     0"'
    sudo netstat -aeptcnl | egrep -via '192.168.2.100|0 0.0.0.0|:::2'

    ===== MOSQUITTO ========================================================
    sudo tail -f /var/log/mosquitto/mosquitto.log
    mosquitto_sub -h localhost -p 1883 -u mqtt -P <your_password> -v -t '#'
    mosquitto_sub -h localhost -p 1883 -u mqtt -P <your_password> -v -t '#' -F %X
    mosquitto_sub -h localhost -p 1883 -u mqtt -P <your_password> -v -t 'zigbee2mqtt/Ikea_Square_Button'

    ===== IPTABLES =========================================================
    sudo iptables -L -nvx --line-numbers
    less /etc/iptables/rules.v4
    #sudo iptables -F (flush all rules temporary)

    ===== PASSWORD UPDATE ==================================================
    mosquitto       sudo mosquitto_passwd -c /etc/mosquitto/passwd mqtt
    zigbee2mqtt     vi /opt/zigbee2mqtt/data/configuration.yaml
    mqtt2caldav     vi mqtt2caldav/config/config.json
<br />
<br />

	
	
## How To Read MQTT Logs
→ Mosquitto Server
`sudo tail -f /var/log/mosquitto/mosquitto.log`<br />
*1605857209: New connection from ::1 on port 1883.*<br />
*1605857209: New client connected from ::1 as mosqsub|812-BTN (c1, k60).*<br />
*1605857255: Socket error on client mosqsub|812-BTN, disconnecting.*<br />

→ Mosquitto Subscriber Client<br />
https://mosquitto.org/man/mosquitto_sub-1.html

`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -t '#'`<br />
*mqtt/Ikea_Square_Button {"action":"on","linkquality":92}*<br />

`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -t '#' | xargs -d$'\n' -L1 sh -c 'date "+%D %T $0"'`<br />
*11/20/20 15:26:51 mqtt/Ikea_Square_Button {"action":"on","linkquality":49}*<br />

`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -d -t '#'`<br />
*Client mosqsub|809-BTN received PUBLISH (d0, q0, r0, m0, 'mqtt/Ikea_Round_Remote_Control', ... (71 bytes))*<br />
*mqtt/Ikea_Round_Remote_Control {"action":"arrow_left_click","linkquality":60,"update_available":false}*<br />

→ The Mosquitto client allows to format the data output - see some examples below<br />
→ Check the manual pages via 'man mosquitto_sub'<br />
`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -t '#' -F %X`<br />
*7B22616374696F6E223A22746F67676C65222C226C696E6B7175616C697479223A38362C227570646174655F617661696C61626C65223A66616C73657D*<br />

`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -t '#' -F "%I_%t_%x"`<br />
*2020-11-20T16:28:41+0800_mqtt/Ikea_Square_Button_7b22616374696f6e223a226f6e222c2262617474657279223a3130302c226c696e6b7175616c697479223a39347d*<br />

`mosquitto_sub -u mqtt -P ???????? -h localhost -p 1883 -v -t 'mqtt/Ikea_Square_Button'`<br />
*mqtt/Ikea_Square_Button {"action":"on","linkquality":84}*

→ Linux Journal Daemon<br />
https://man7.org/linux/man-pages/man1/journalctl.1.html<br />
`sudo journalctl -u zigbee2mqtt.service -f`<br />
*Nov 20 15:26:51 BTN npm[677]: Zigbee2MQTT:info  2020-11-20 15:26:51: MQTT publish: topic 'mqtt/Ikea_Square_Button {"action":"on","linkquality":49}'*<br />

→ Zigbee2MQTT Log Files<br />
`tail -f /opt/zigbee2mqtt/data/log/*/log.txt`<br />
*info  2020-11-20 15:26:51: MQTT publish: topic 'mqtt/Ikea_Square_Button {"action":"on","linkquality":49}'*<br />
<br />
<br />

	

## Install mqtt2caldav <br />
→ mqtt2caldav converts the MQTT event to a CalDAV event<br />

→ Check installed Python 3 version<br />
`python3 --version`

→ Install 'pip'<br />
`sudo apt-get -y install python3-pip`

→ Upgrade 'setuptools'<br />
`pip3 install --upgrade setuptools`

→ Install 'libxml'<br />
`sudo apt-get install python3-lxml`

→ Install 'pytz'<br />
`pip3 install pytz`

→ Install 'caldav' (this may take a while)<br />
`pip3 install caldav`

→ If you need to install an older version use the following command<br />
`pip3 install caldav==0.7.1`

→ Install 'paho-mqtt'<br />
`pip3 install paho-mqtt`

→ Download 'mqtt2caldav' to your servers home directory<br />
https://github.com/107208579/mqtt2caldav

→ Read the [README.md](https://github.com/107208579/mqtt2caldav#readme)<br />

→ Configure 'config.json'<br />
`vi mqtt2caldav/config/config.json`

    {
      "MQTT_SERVER":{
        "MQTT_SERVER_ADDRESS": "localhost",
        "MQTT_SERVER_PORT": "1883",
        "MQTT_USERNAME": "mqtt",
        "MQTT_PASSWORD": "<your_password>"
      },
    
      "CALDAV_SERVER":{
        "CALDAV_SERVER_ADDRESS": "https://server.com/remote.php/dav/calendars/user",
        "CALDAV_USERNAME": "user",
        "CALDAV_PASSWORD": "<your_password>"
      },
    
      "TRIGGERS": [
        {
          "MQTT_TOPIC": "mqtt/OPP_BTN_SQR_601",
          "MQTT_EVENT": {"action":"button_1_single"},
          "EVENT_CALENDAR": "https://server.com/remote.php/dav/calendars/user/entertainment",
          "EVENT_SUMMARY": "ENT - Computer",
          "EVENT_LOCATION": "",
          "EVENT_GEO": "",
          "EVENT_CATEGORIES": "",
          "EVENT_URL": "",
          "EVENT_DESCRIPTION": "",
          "EVENT_TRANSP": "TRANSPARENT",
          "EVENT_TIMEZONE": "Asia/Singapore",
          "EVENT_TRIGGER": "",
          "EVENT_SECONDS": "False",
          "EVENT_ROUNDING": "5",
          "EVENT_DURATION": "5"
        }
      ]
    }
<br />

→ Manually run the program to check for errors<br />
`python3 main.py`

→ Or automatically start the script upon system boot<br />
`crontab -e`
        
    # Run mqtt2caldav upon boot
    @reboot sleep 30 && python3 /home/pi/mqtt2caldav/main.py
<br />
<br />


