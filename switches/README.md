
# Calendar Tracking (Zigbee Switches)

## Overview
When a Zigbee switch/button is pressed, a wireless Zigbee signal is sent. The Zigbee signal is received by a Zigbee adapter ([Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick)) that is connected to a Linux server ([Raspberry Pi Zero W](https://www.raspberrypi.org)). The server receives the Zigbee signal, converts it to an MQTT message (via [zigbee2mqtt](https://www.zigbee2mqtt.io)) which is used to create a calendar event from a user-defined template (via [mqtt2caldav](https://github.com/107208579/mqtt2caldav)). The calendar event is sent to a CalDAV server for storage and synchronisation with other connected CalDAV calendar applications.
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Detail.png" width="740"> 
</p>
<br />
<br />

Here's a short video that shows a button press that generates a new event and syncs it to two calendars in a few seconds. 

https://user-images.githubusercontent.com/6289141/120297608-d7eac800-c2fb-11eb-97d8-41e60def8116.mov

<br />
<br />



## Requirements
• CalDAV Server ([Apple iCloud Calendar](https://www.icloud.com/calendar/), [Google Calendar](http://calendar.google.com), [NextCloud](https://nextcloud.com), etc)<br />
• Linux Server ([Raspberry Pi Zero W 1](https://www.raspberrypi.org)  ~10 USD)<br />
• Zigbee Switch ([Supported Switches](https://www.zigbee2mqtt.io/information/supported_devices.html) ~10 USD)<br />
• Zigbee Adapter ([Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick/) ~30 USD)<br />
• USB Extension Cable ([UGreen OTG 2.0](https://uk.ugreen.com/products/ugreen-micro-usb-2-0-otg-adapter) ~5 USD)<br />

<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Zigbee.png" width="740"></p>
<br />
<br />



## Disclaimer
The below information explains a headless Raspberry Pi OS server installation on a Raspberry Pi Zero 1 and requires a fundamental understanding of Linux and the use of a command line. Information may be incomplete, incorrect, outdated, obsolete. Use at your own risk.
<br />
<br />



## Installation
### Get a Zigbee Adapter
→ The Zigbee adapter in this tutorial is an [Electrolama zzh! CC2652](https://www.tindie.com/products/electrolama/zzh-cc2652r-multiprotocol-rf-stick) but [other adapters](https://www.zigbee2mqtt.io/information/supported_adapters.html) should work too.
<br />
<br />
 
 
 
### Flash the Zigbee Adapter
→ Follow the instructions for flashing the CC2652<br />
https://www.zigbee2mqtt.io/information/supported_adapters.html<br />
https://electrolama.com/radio-docs/#step-3-flash-the-firmware-on-your-stick<br />

→ NOTE: The following steps outlined are for flashing the CC2652 via macOS as host system<br />

→ Connect the Zigbee adapter via USB to your macOS system and check if it was detected<br />
`sudo dmesg | grep AppleUSBCH`<br />
*[1458325.212772]: IOUserSerial::AppleUSBCHCOM::<private>: 127 0x600002c9c058*<br />
*[1458325.213170]: DK: AppleUSBCHCOM-0x100048d92::start(IOUSBHostInterface-0x100048d90) ok*

→ Install python3 and pip on your macOS system<br />
`xcode-select --install`<br />
`brew install python3`
 
→ Upgrade 'pip' and install the following packages<br />
https://github.com/JelmerT/cc2538-bsl<br />
`sudo pip3 install --upgrade pip`<br />
`pip3 install pyserial intelhex python-magic`

→ Download the latest boot loader<br />
`wget -O cc2538-bsl.zip https://codeload.github.com/JelmerT/cc2538-bsl/zip/master && unzip cc2538-bsl.zip`

→ Download the latest 'Electrolama zzh' firmware and unzip it<br />
https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin<br />
Example: CC26X2R1_20201026.hex<br />

→ Check the exact device location the CC2652 is connected to<br />
`ls -l /dev/tty.usbserial-*`<br />
*/dev/tty.usbserial-1460*<br />

→ Remove the CC2652 adapter from the USB port<br />
→ Press the reset button on the board<br />
→ Keep pressing the reset button while plugging the board back into the USB port<br />
→ Release the button after 1 second<br />

→ Run the following command (verify the device location)<br />
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

→ Remove the flashed Zigbee adapter from the USB port<br />
→ Connect the flashed Zigbee adapter to the Raspberry Pi<br />
→ Ideally use an USB extension cable to physically distance the adapter from the Raspberry Pi and the WiFi antenna<br />
<br />
<br />
 
 
 
### Install Raspbian
→ This tutorial includes the installation of an older version of Raspbian that is meant to run within a local network with mostly local network access only. In addition, the Raspbian version used in this example is a 'command line only' version with no graphical user interface.<br />

→ Download Raspbian Buster Lite [2020-02-13-raspbian-buster-lite.zip](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2020-02-14/2020-02-13-raspbian-buster-lite.zip) from the official repository.<br />

→ Use the [Raspberry Pi Imager](https://www.raspberrypi.org/downloads/) to write the Raspbian image to the SD card<br /><br />

→ For SSH connectivity add the following file to the root of the SD card<br />
`touch /Volumes/boot/ssh`

→ For WiFi connectivity add the following file to the root of the SD card<br />
→ Note that the Raspberry Pi Zero 1 only supports 2.4Ghz WiFi connectivity<br />
`vi /Volumes/boot/wpa_supplicant.conf`

    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    country=CA
    
    network={
    ssid="your_wifi_network"
    scan_ssid=1
    psk="your_password"
    }

→ The WiFi configuration can later be edited again with the following command<br />
`sudo vi /etc/wpa_supplicant/wpa_supplicant.conf`

→ Eject the SD Card<br />
`hdiutil eject /Volumes/boot/`

→ Transfer the SD Card to your Raspberry Pi and start the server
<br />
<br />



### Connect to the Raspberry Pi
→ Locate your Raspberry Pi network address<br />
` arp -a | egrep -ia 'b8:27:eb|dc:a6:32|e4:5f:01'`

→ Connect to your Raspberry Pi remotely via 'ssh'<br />
`ssh pi@xxx.xxx.xxx.xxx`<br />
• username: pi<br />
• password: raspberry
<br />
<br />



### Change Default Passwords
→ Change the default password for user 'pi'<br />
`passwd`

→ Change the default password for user 'root'<br />
`sudo passwd root`
<br />
<br />



### Configure Raspbian 
→ Check your operating system<br />
`uname -a`

→ Set GPU memory & disable Bluetooth<br />
`sudo vi /boot/config.txt`

    # Set GPU Memory
    gpu_mem=16
    # Disable Bluetooth 
	dtoverlay=disable-bt

→ Disable HDMI circuits<br />
`sudo vi /etc/rc.local`
	
	# Disable HDMI
	/usr/bin/tvservice -o

→ Disable WiFi controller power_safe for more consistent wireless connectivity<br />

	# Disable WiFi Controller Power Save
	/sbin/iw dev wlan0 set power_save off
	exit 0

→ Alternatively also disable Wifi if an Ethernet connection is used. Fewer radios ensure better Zigbee connectivity with less interference.<br />

	# Disable Wifi
	dtoverlay=disable-wifi

→ Update your system's package list to allow compatible but older software to be installed<br />
`sudo apt-get update --allow-releaseinfo-change`

→ Deactivate automatic daily check for updates<br />
`sudo systemctl disable apt-daily.timer`<br />
`sudo systemctl disable apt-daily.service`<br />
`sudo systemctl disable apt-daily-upgrade.timer`<br />
`sudo systemctl disable apt-daily-upgrade.service`

→ Reload the systemctl daemon for the changes to take effect<br />
`systemctl daemon-reload`

→ Update your ssh daemon configuration file<br />
`sudo vi /etc/ssh/sshd_config`

	LoginGraceTime 30
	PermitRootLogin no
	MaxAuthTries 5
	PermitEmptyPasswords no
	X11Forwarding no

→ Disable the following line by prefixing it with a '#'<br />
	
	#Subsystem   sftp   /usr/lib/openssh/sftp-server

→ Restart the service so that changes take effect<br />

`sudo service ssh restart`
<br />
<br />



### Reconnect WiFi On Lost Connection  
→ Create the WLAN reconnect script in /usr/local/bin<br />
`sudo vi /usr/local/bin/wlan_reconnect.sh`

	#!/bin/bash
	# https://gist.github.com/carry0987/372b9fefdd8041d0374f4e08fbf052b1
	SSID=$(/sbin/iwgetid --raw)
	
	if [ -z "$SSID" ]
	then
    echo "`date +"%Y-%m-%d %H:%M:%S"` [WLAN] Interface Disconnected" >> /var/log/wlan.log
	   sudo ifconfig wlan0 down
    sleep 30
    sudo ifconfig wlan0 up
    echo "`date +"%Y-%m-%d %H:%M:%S"` [WLAN] Interface Reconnected" >> /var/log/wlan.log
	fi

→ Change file permissions to be able to execute the script <br />
`sudo chmod +x /usr/local/bin/wlan_reconnect.sh`

→ Update the system crontab to run the script in the background every X minutes<br />
`sudo vi /etc/crontab`

	# Reconnect WLAN on connectivity loss
	*/15 * * * *    root    /usr/local/bin/wlan_reconnect.sh


→ Test if the script reconnects the WLAN within ~15 minutes<br />
`sudo ifconfig wlan0 down`

 → Check the log file for status entries<br />
`less /var/log/wlan.log`
<br />
<br />



### Install IPtables
→ Install 'iptables-persistent'<br />
`sudo apt-get install -y iptables-persistent`

→ Add the following rules to restrict access to the server. Access to RFC1918 IP ranges of 10.x, 172.16.x, and 192.168.x is permitted<br />
→ IMPORTANT: Replace ???.???.???.??? with the IP address of your CalDAV server<br />
`sudo iptables -A INPUT -i lo -j ACCEPT`<br />
`sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT`<br />
`sudo iptables -A INPUT -s 10.0.0.0/8 -j RETURN`<br />
`sudo iptables -A INPUT -s 172.16.0.0/12 -j RETURN`<br />
`sudo iptables -A INPUT -s 192.168.0.0/16 -j RETURN`<br />
`sudo iptables -A INPUT -s ???.???.???.??? -j RETURN`<br />
`sudo iptables -A INPUT -p udp --sport 53 -j ACCEPT`<br />
`sudo iptables -A INPUT -p tcp --sport 53 -j ACCEPT`<br />
`sudo iptables -A INPUT -p udp --sport 123 -j ACCEPT`<br />
`sudo iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT`<br />
`sudo iptables -A INPUT -j DROP`

`sudo iptables -A OUTPUT -o lo -j ACCEPT`<br />
`sudo iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT`<br />
`sudo iptables -A OUTPUT -d 10.0.0.0/8 -j RETURN`<br />
`sudo iptables -A OUTPUT -d 172.16.0.0/12 -j RETURN`<br />
`sudo iptables -A OUTPUT -d 192.168.0.0/16 -j RETURN`<br />
`sudo iptables -A OUTPUT -d ???.???.???.??? -j RETURN`<br />
`sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT`<br />
`sudo iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT`<br />
`sudo iptables -A OUTPUT -p udp --dport 123 -j ACCEPT`<br />
`sudo iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT`<br />
`sudo iptables -A OUTPUT -j DROP`

→ IMPORTANT: Test your rules before saving it permanently!<br />

→ Save iptable rules to configuration<br />
`sudo sh -c "iptables-save > /etc/iptables/rules.v4"`

→ Check if the rules have been added to the file<br />
`less /etc/iptables/rules.v4`

→ Flush all configured iptables rules temporarily next reboot<br />
`sudo iptables -F`
<br />
<br />



### Check the Zigbee Adapter 
→ Check the device location of the Zigbee adapter (should be called 'ttyUSB0')<br />
`ls -l /dev/serial/by-id`<br />
*lrwxrwxrwx 1 root 13 Dec  4 20:34 usb-1a86_USB_Serial-if00-port0 -> ../../ttyUSB0*<br />

`ls -l /dev/ttyUSB0`<br />
*crw-rw---- 1 root 188, 0 Dec  4 20:34 /dev/ttyUSB0*<br />

→ For troubleshooting run any of the following commands<br />
`sudo lsusb`<br />
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

	
	
### Install MQTT (Mosquitto)
→ Install the Mosquitto broker and clients<br />
`sudo apt install -y mosquitto=1.5.7-1+deb10u1`<br />
`sudo apt install -y mosquitto-clients=1.5.7-1+deb10u1`<br />
`sudo systemctl enable mosquitto.service`

→ Check the running Mosquitto version<br />
`mosquitto -v`<br />
*1604153551: mosquitto version 1.5.7 starting*<br />
*1604153551: Using default config.*<br />
*1604153551: Opening ipv4 listen socket on port 1883.*<br />
*1604153551: Error: Address already in use*
<br />
<br />



### Secure MQTT (Mosquitto)
→ Set a user and password<br />
`sudo mosquitto_passwd -c /etc/mosquitto/passwd mqtt`<br />
• User		mqtt<br />
• Pass		your_password

→ Update the config file and add the following section<br />
`sudo vi /etc/mosquitto/mosquitto.conf`

    password_file /etc/mosquitto/passwd
    allow_anonymous false

→ Restart Mosquitto with the new configuration file changes<br />
`sudo mosquitto -c /etc/mosquitto/mosquitto.conf`

→ Verify the user and the password<br />
→ An empty line will be shown if the connection is successul<br />
`mosquitto_sub -h localhost -v -t '#' -p 1883 -u mqtt -P your_password`

→ Incorrect access will send an error message<br />
*Connection Refused: not authorised.*
<br />
<br />



### Install Zigbee2MQTT 
→ Zigbee2MQTT converts the Zigbee signal to an MQTT event<br />

→ Manually download and install an unoffical NodeJS version<br />
https://unofficial-builds.nodejs.org/download/release/<br />
`wget --no-check-certificate https://unofficial-builds.nodejs.org/download/release/v12.9.1/node-v12.9.1-linux-armv6l.tar.xz`<br />
`tar -xvf node-v12.9.1-linux-armv6l.tar.xz`<br />
`sudo cp -R node-v12.9.1-linux-armv6l/* /usr/local/`<br />
`rm -rf node-v12.9.1-linux-armv6l node-v12.9.1-linux-armv6l.tar.xz`<br />

→ Check if the download was successful<br />
`node -v`<br />
*v12.9.1*

→ Check if the download was successful (this may take a bit)<br />
`npm -v`<br />
*6.10.2*

→ Install git<br />
`sudo apt-get install -y git`

→ Clone the Zigbee2MQTT repository<br />
`sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt`

→ Change permissions to your local user<br />
`sudo chown -R pi:pi /opt/zigbee2mqtt`

→ Change into the Zigbee directory<br />
`cd /opt/zigbee2mqtt`

→ Rollback to Zigbee2MQTT version 1.16.2<br />
`cd /opt/zigbee2mqtt`
`git checkout 04c15f7`

	> HEAD is now at 04c15f7f 1.16.2

→ Install dependencies (this may take ~5 minutes on a Rasperry Pi Zero 1)<br />
`npm ci --production`<br />
*[..................] | extractTree: verb extractTree extracting dependencies to node_modules/*<br />
*[  ................] | extractTree: sill extract ms@2.0.0 extracted to /opt/zigbee2mqtt/node_modules/ms (5844ms)*<br />
*[    ..............] - extractTree: sill extract jest-util@26.3.0 extracted to /opt/zigbee2mqtt/node_modules/jest-util (15625ms)*<br />
*[     .............] / extractTree: sill extract path-dirname@1.0.2 extracted to /opt/zigbee2mqtt/node_modules/path-dirname (11930ms)*<br />
*[       ...........] \ reify:@babel/code-frame: timing reify:loadBundles Completed in 0ms*<br />
*[         .........] \ reify:has-values: http fetch GET 200 https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.2.1.tgz 276431ms*<br />
*[          ........] \ reify:parse-json: timing reifyNode:node_modules/path-type Completed in 386566ms*<br />
*[           .......] \ reify:define-property: timing reifyNode:node_modules/once Completed in 392704ms*<br />
*[            ......] | reify:jest-environment-jsdom: timing reifyNode:node_modules/jest-environment-node Completed in 432610ms*<br />
*[             .....] / reify:has-flag: timing reifyNode:node_modules/graceful-fs Completed in 471319ms*<br />
*[               ...] / reify:has-flag: timing reifyNode:node_modules/graceful-fs Completed in 471319ms*<br />
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



### Configure Zigbee2MQTT<br />
→ Basic configuration as shown below - further details underneath<br />
`vi /opt/zigbee2mqtt/data/configuration.yaml`<br />

→ Configure Zigbee2MQTT for the correct USB device location<br />

    serial:
      port: /dev/ttyUSB0

→ Secure your Zigbee2MQTT network to run with a key<br />
https://www.zigbee2mqtt.io/information/configuration.html<br />
https://www.zigbee2mqtt.io/how_tos/how_to_secure_network.html

    advanced:
        network_key: GENERATE

→ And add the user and the password to connect to Mosquitto<br />

    user: 'user'
    password: 'your_password'

→ And change the base topic to the correct name<br />

    base_topic: mqtt

→ Change the default ID if more than one network should run in parallel<br />
→ The default PAN ID for Zigbee2MQTT is set to '0x1a62' (which is 6754 in decimal)<br />
→ PAN IDs can be any value in the range of 0×0000 – 0xFFFE<br />
https://www.zigbee2mqtt.io/information/configuration.html

    advanced:
      network_key: GENERATE
      pan_id: 0x1a62

→ A completed configuration file may look like this:
	
    serial:
      port: /dev/ttyUSB0
    permit_join: true
    homeassistant: false
    mqtt:
      base_topic: mqtt
      server: 'mqtt://localhost'
      user: mqtt
      password: secretpassword123
    advanced:
      network_key: GENERATE
      pan_id: 0x1a62
      elapsed: false
      timestamp_format: 'YYYY/MM/DD HH:mm:ss'


→ Save the 'configuration.yaml' and check if your node starts up and runs correctly<br />
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
*...*<br />

→ Check the journal via a second command terminal <br />
`sudo journalctl -u zigbee2mqtt.service -f`<br />
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

	

### Zigbee and WiFi Interference 
→ Verify that Zigbee and WiFi run on different channels to avoid signal interference
https://www.zigbee2mqtt.io/how_tos/how_to_improve_network_range_and_stability.html
https://www.digi.com/resources/documentation/digidocs/90001537/references/r_channels_zigbee.htm
https://support.metageek.com/hc/en-us/articles/203845040-Zigbee-and-WiFi-Coexistence<br />
• Zigbee operates on 2.4 Ghz with 16 channels between 11 and 26<br />
• Zigbee channels 25 and 26 might not be supported by all hardware<br />

→ Interference happens with the following setups<br />
• Wifi Channel 01 interferes with Zigbee channels 11, 12, 13, 14, 15, 16, 17<br />
• Wifi Channel 06 interferes with Zigbee channels 13, 14, 15, 16, 17, 18, 19, 20, 21, 22<br />
• Wifi Channel 11 interferes with Zigbee channels 19, 20, 21, 22, 23, 24<br />

→ Ideally both networks are being set on opposing ends of the channel spectrum<br />
• Wifi Channel 01 with Zigbee channels 19, 20, 21, 22, 23, 24<br />
• Wifi Channel 11 with Zigbee channels 11, 12, 13, 14, 15, 16, 17<br />

→ Make sure you don't have a 'smart' WiFi router which automatically changes channels<br />

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

	

### Change Zigbee Channel 
→ In order to change the default Zigbee channel edit the configuration.yaml<br />
→ Use a 'Zigbee Light Link' channel to avoid problems: 11, 15, 20<br />
→ IMPORTANT: Change of channel requires re-pairing of all connected Zigbee devices<br />
https://www.zigbee2mqtt.io/information/configuration.html

`vi /opt/zigbee2mqtt/data/configuration.yaml`<br />

    advanced:
      channel: 15

→ Restart the service<br />
`sudo systemctl restart zigbee2mqtt`
<br />
<br />


	
### Zigbee and BlueTooth Interference<br />
→ Bluetooth signals are a potential source of interference for ZigBee and WiFi networks<br />
https://www.zigbee2mqtt.io/how_tos/how_to_improve_network_range_and_stability.html

→ Check if Bluetooth as a service is running<br />
`sudo service bluetooth status`<br />
`hciconfig -a`

→ Permanently disable Bluetooth<br />
`sudo vi /boot/config.txt`

    dtoverlay=disable-bt

→ Restart your server for the changes to take effect<br /> 
`sudo reboot`

→ Ideally use an USB extension to physically distance the Zigbee adapter from the server<br />
<br />
<br />



### Pair Switches with the ZigBee Adapter
→ Check that your configuration.yaml allows to join new devices<br />
`less /opt/zigbee2mqtt/data/configuration.yaml`

    permit_join: true

→ Subscribe with the Mosquitto client to all topics to see incoming messages during the pairing process<br />
`mosquitto_sub -u mqtt -P your_password -h localhost -p 1883 -v -t '#'`

→ More information about device specific pairing steps can be found in the [Zigbee2MQTT supported devices list](https://www.zigbee2mqtt.io/information/supported_devices.html).

→ EXAMPLE: Ikea Tradfri E1524/E1810 (Round Remote Control)<br />
https://www.zigbee2mqtt.io/devices/E1524_E1810.html<br />
→ Press connect button inside casing 4 times in short order

→ You should see an output similar to this:<br />
*zigbee2mqtt/bridge/state online*<br />
*zigbee2mqtt/bridge/config {"commit":"ed8b4e5","coordinator":{"meta":{"maintrel":3,"majorrel":2,"minorrel":6,"product":0,"revision":20190608,"transportrev":2},"type":"zStack12"},"log_level":"info","network":{"channel":11,"extendedPanID":"0xdddddddddddddddd","panID":6754},"permit_join":true,"version":"1.15.0"}*<br />
*zigbee2mqtt/bridge/log {"message":"announce","meta":{"friendly_name":"0xbc33acfffed4ed8b"},"type":"device_announced"}*<br />

→ Alternatively check the systems journald log files<br />
`sudo journalctl -u zigbee2mqtt.service -f`

→ Here are the button press options<br />
|Button |Message|
|:------|:---   |
|Single Left		|{"action":"arrow_left_click","linkquality":60,"update_available":false}|
|Single Press Right 	|{"action":"arrow_right_click","linkquality":42,"update_available":false}|
|Single Press Up	|{"action":"brightness_up_click","linkquality":73,"update_available":false}|
|Single Press Down	|{"action":"brightness_down_click","linkquality":76,"update_available":false}|
|Single Press Center	|{"action":"toggle","linkquality":81,"update_available":false}|
|Long Press Left	|{"action":"arrow_left_hold","linkquality":28,"update_available":false}|
|			|{"action":"arrow_left_release","duration":2.811,"linkquality":78,"update_available":false}|
|Long Press Right	|{"action":"arrow_right_hold","linkquality":70,"update_available":false}|
|			|{"action":"arrow_right_release","duration":1.875,"linkquality":86,"update_available":false}|
|Long Press Up		|{"action":"brightness_up_hold","linkquality":63,"update_available":false}|
|			|{"action":"brightness_up_release","linkquality":92,"update_available":false}|
|Long Press Down	|{"action":"brightness_down_hold","linkquality":92,"update_available":false}|
|			|{"action":"brightness_down_release","linkquality":68,"update_available":false}|
|Long Press Center	|{"action":"toggle","linkquality":84,"update_available":false}|
|			|{"action":"toggle_hold","linkquality":86,"update_available":false}|
<br />
<br />

	
	
→ EXAMPLE: Sonoff SNZB-01 (Square Button)<br />
https://www.zigbee2mqtt.io/devices/SNZB-01.html<br />
→ Long press reset button for 5 seconds until the LED indicator flashes three times, which means the device has entered pairing mode<br />
→ Here are the button press options<br />
|Button |Message|
|:------|:---   |
|Single Press		|{"action":"single","linkquality":13}'|
|Double Press		|{"action":"double","linkquality":13}'|
|Long Press		|{"action":"long","linkquality":15}'|
<br />
<br />



→ EXAMPLE: XiaoMi Aqara WXKG01LM (Round Button)<br />
https://www.zigbee2mqtt.io/devices/WXKG01LM.html
→ Press and hold the reset button on the device for 5 seconds until the blue light starts blinking<br />
→ Here are the button press options
|Button |Message|
|:------|:---   |
|Single Press		|{"action":"single","battery":100,"linkquality":86,"voltage":3052}'|
|Double Press		|{"action":"double","battery":100,"linkquality":94,"voltage":3052}'|
|Triple Press		|{"action":"triple","battery":100,"linkquality":102,"voltage":3052}'|
|Quadruple Press	|{"action":"quadruple","battery":100,"linkquality":102,"voltage":3052}'|
|Many Presses (4+)	|{"action":"many","battery":100,"linkquality":92,"voltage":3052}'|
|Long Hold		|{"action":"hold","battery":100,"linkquality":94,"voltage":3052}'|
|Release		|{"action":"release","battery":100,"duration":2417,"linkquality":86,"voltage":3052}'|

→ Check your configuration file again and see if all devices have been added successfully<br />
`less /opt/zigbee2mqtt/data/configuration.yaml`

    devices:
      '0x00158d000403091a':
        friendly_name: '0x00158d000403091a'
        legacy: false
      '0x00124b001f8ab0cd':
        friendly_name: '0x00124b001f4ab0cd'

→ Give your devices a nicer name by editing the 'friendly_name' section<br />

    devices:
      '0x00158d000402091a':
        friendly_name: 'XiaoMi_Test_1'
        legacy: false
      '0x00124b001f4ac0cd':
        friendly_name: 'Sonoff_Test_1'

→ Set 'permit_join' to 'false' AFTER all devices have been paired<br />
`vi /opt/zigbee2mqtt/data/configuration.yaml`

    permit_join: false

→ Restart the service for the changes to take effect<br />
`sudo systemctl start zigbee2mqtt`
<br />
<br />



### Add a Cheat Sheet 
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

    ===== MOSQUITTO ========================================================
    sudo tail -f /var/log/mosquitto/mosquitto.log
    mosquitto_sub -h localhost -p 1883 -u mqtt -P your_password -v -t '#'
    mosquitto_sub -h localhost -p 1883 -u mqtt -P your_password -v -t '#' -F %X
    mosquitto_sub -h localhost -p 1883 -u mqtt -P your_password -v -t 'zigbee2mqtt/Ikea_Square_Button'

    ===== PASSWORD UPDATE ==================================================
    mosquitto       sudo mosquitto_passwd -c /etc/mosquitto/passwd mqtt
    zigbee2mqtt     vi /opt/zigbee2mqtt/data/configuration.yaml
    mqtt2caldav     vi mqtt2caldav/config/config.json
<br />
<br />

	
	
### How To Read Log Files
→ Mosquitto Server Logs<br />
`sudo tail -f /var/log/mosquitto/mosquitto.log`<br />
*1605857209: New connection from ::1 on port 1883.*<br />
*1605857209: New client connected from ::1 as mosqsub|812-BTN (c1, k60).*<br />
*1605857255: Socket error on client mosqsub|812-BTN, disconnecting.*<br />

→ Mosquitto Subscriber Logs<br />
`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -t '#'`<br />
*mqtt/Ikea_Square_Button {"action":"on","linkquality":92}*<br />

`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -t '#' | xargs -d$'\n' -L1 sh -c 'date "+%D %T $0"'`<br />
*11/20/20 15:26:51 mqtt/Ikea_Square_Button {"action":"on","linkquality":49}*<br />

`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -d -t '#'`<br />
*Client mosqsub|809-BTN received PUBLISH (d0, q0, r0, m0, 'mqtt/Ikea_Round_Remote_Control', ... (71 bytes))*<br />
*mqtt/Ikea_Round_Remote_Control {"action":"arrow_left_click","linkquality":60,"update_available":false}*<br />

→ The Mosquitto client allows to format the data output - see some examples below<br />
→ Check the manual pages via 'man mosquitto_sub'<br />
`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -t '#' -F %X`<br />
*7B22616374696F6E223A22746F67676C65222C226C696E6B7175616C697479223A38362C227570646174655F617661696C61626C65223A66616C73657D*<br />

`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -t '#' -F "%I_%t_%x"`<br />
*2020-11-20T16:28:41+0800_mqtt/Ikea_Square_Button_7b22616374696f6e223a226f6e222c2262617474657279223a3130302c226c696e6b7175616c697479223a39347d*<br />

`mosquitto_sub -u <username> -P <password> -h localhost -p 1883 -v -t 'mqtt/Ikea_Square_Button'`<br />
*mqtt/Ikea_Square_Button {"action":"on","linkquality":84}*

→ Linux Journal Daemon Logs<br />
https://man7.org/linux/man-pages/man1/journalctl.1.html<br />
`sudo journalctl -u zigbee2mqtt.service -f`<br />
*Nov 20 15:26:51 BTN npm[677]: Zigbee2MQTT:info  2020-11-20 15:26:51: MQTT publish: topic 'mqtt/Ikea_Square_Button {"action":"on","linkquality":49}'*<br />

→ Zigbee2MQTT Logs<br />
`tail -f /opt/zigbee2mqtt/data/log/*/log.txt`<br />
*info  2020-11-20 15:26:51: MQTT publish: topic 'mqtt/Ikea_Square_Button {"action":"on","linkquality":49}'*<br />
<br />
<br />

	

### Install mqtt2caldav<br />
→ mqtt2caldav converts the MQTT event to a CalDAV event<br />

→ Install 'pip'<br />
`sudo apt-get -y install python3-pip`

→ Install 'setuptools'<br />
`pip3 install --upgrade setuptools`

→ Install 'libxml'<br />
`sudo apt-get install python3-lxml`

→ Install 'pytz'<br />
`pip3 install pytz==2021.1`

→ Install 'caldav' (this may take a bit)<br />
`pip3 install caldav==0.7.1`

→ Install 'paho-mqtt'<br />
`pip3 install paho-mqtt==1.5.1`

→ Return to your home directory<br />
`cd`

→ Download 'mqtt2caldav' to your servers home directory<br />
https://github.com/107208579/mqtt2caldav<br />
`wget https://github.com/107208579/mqtt2caldav/archive/refs/heads/main.zip`<br />
`unzip mqtt2caldav-main.zip`<br />
`mv mqtt2caldav-main mqtt2caldav`<br />

→ Read the [README.md](https://github.com/107208579/mqtt2caldav#readme)<br />

→ Configure 'config.json'<br />
`vi mqtt2caldav/config/config.json`

    {
      "MQTT_SERVER":{
        "MQTT_SERVER_ADDRESS": "localhost",
        "MQTT_SERVER_PORT": "1883",
        "MQTT_USERNAME": "mqtt",
        "MQTT_PASSWORD": "your_password"
      },
    
      "CALDAV_SERVER":{
        "CALDAV_SERVER_ADDRESS": "https://server.com/remote.php/dav/calendars/user",
        "CALDAV_USERNAME": "user",
        "CALDAV_PASSWORD": "your_password"
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


→ Press a Zigbee button and check if the MQTT event has been received and has been matched<br />
`tail -f mqtt2caldav/logs/mqtt2caldav.log`<br />
*2021/06/13 14:47:29 [MQTT] Event Received | mqtt/OPP_BTN_SQR_601 | {"action":"button_1_single"}*<br />
*2021/06/13 14:47:29 [MQTT] Event Matched  | mqtt/OPP_BTN_SQR_601 | {"action":"button_1_single"}*<br />
*2021/06/13 14:59:47 [MQTT] Event Received | mqtt/OPP_BTN_SQR_601 | {"action":"button_3_single"}*<br />
*2021/06/13 14:59:47 [MQTT] Event Matched  | mqtt/OPP_BTN_SQR_601 | {"action":"button_3_single"}*<br />
*...*
<br />
<br />
