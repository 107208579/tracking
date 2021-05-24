# Calendar Tracking  
<br />

## Why track your time?  
Have you ever asked yourself where your time goes? Or have you ever wished you could remember what you were doing on a specific day in the past?

Back in 2012 I was very curious on how I spend my 10,080 minutes in a week and decided to track my life in calendar. I wanted to:
- easily remember past events
- learn more about myself
- plan better ahead
- have a visualization of my life
- increase my productivity
- change personal behaviour
- leave a digital legacy

Here are some other great people that track their life in a calendar:
* [Every Step I Take](https://www.youtube.com/watch?v=MazwAPVO70Y) (Nicholas Feltron)
* [Productivity Hacking](http://www.jamesmaa.com/2012/12/02/james-maas-productivity-hacking-guide/) (James Maa)
* [Keeping Track of Time](https://vimeo.com/57823452) (Awais Hussain)
* [Tracking My Time Spent](https://blog.usejournal.com/quantified-self-tracking-my-time-spent-1fdb97652595) (Stephanie Rogers)
* [Time blocking and time tracking](https://www.youtube.com/watch?v=X57gxhIHjBE) (Aparna Kher)
* [How and Why I Create a Quantified Self](https://www.jacksondame.com/blog/lifelogging-how-and-why-i-create-a-quantified-self) (Jackson Dame)
* [I Tracked Every Minute Of My Life For 7 Days](https://www.youtube.com/watch?v=FLLiFl1m9I4) (Nathaniel Drew)
* [I Tracked Every Minute Of My Life For 1 Week](https://www.youtube.com/watch?v=CtyJR2e1Fco) (Antoniya Ivanova)
* [I Tracked Every Minute Of My Life For 3 Months](https://www.youtube.com/watch?v=LUjTvPy_UAg) (Matt D'Avella)
* [How Six Months of Tracking Everything Increased my Awareness](https://vimeo.com/78020552) (David Achkar)
<br />
<br />

## How does this all work?  
The easiest way is to create events in a calendar. Use a calendar service such as [Apple iCloud](https://www.icloud.com/calendar/) or [Google Calendar](https://calendar.google.com/) that acts as a central storage and allows all your calendar apps to connect and automatically synchronise events with each other.
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Setup.png" width="600"> 
</p>
<br />
<br />


## What calendar apps can be used?
Literally any calendar you are comfortable with. Below you find a small list of services and applications that support CalDAV and allow for easy synchronisation of events between different devices (such as your computer, laptop, or mobile phone) and across different computer systems (such as Windows, macOS, iOS, Linux).

* **Servers**   
  * Cloud Hosted
    * [iCloud Calendar](https://www.icloud.com/calendar/) 
    * [Google Calendar](http://calendar.google.com)
    * [Yahoo Calendar](http://calendar.yahoo.com)
   * Self Hosted
     * [Baïkal](http://www.baikal-server.com)
     * [Nextcloud](http://nextcloud.com) 
     * [Radicale](http://radicale.org)
<br />  

* **Applications**  
  * Windows
     * [eM Client](http://www.emclient.com)
     * [One Calendar](https://www.onecalendar.nl)
     * [Thunderbird](https://www.thunderbird.net/en-US/calendar/)
  * Linux
    * [Evolution](https://wiki.gnome.org/Apps/Evolution) 
    * [Gnome Calendar](https://snapcraft.io/gnome-calendar)
    * [KOrganizer](https://apps.kde.org/en/korganizer)
  * macOS
    * [Apple Calendar](http://support.apple.com/guide/calendar/welcome/mac)
    * [BusyCal](https://www.busymac.com/busycal/)
    * [Fantastical](https://flexibits.com/)
  * iOS
    * [Apple Calendar](https://support.apple.com/guide/iphone/iph3d110f84/ios)
    * [BusyCal](https://apps.apple.com/us/app/id1035689743)
    * [Fantastical](https://apps.apple.com/app/id718043190)
  * Android
    * [Business Calendar 2](https://play.google.com/store/apps/details?id=com.appgenix.bizcal)
    * [CalenGoo](https://play.google.com/store/apps/details?id=com.calengoo.android)
    * [One Calendar](https://play.google.com/store/apps/details?id=biz.codespark.xcalendarapp)
<br />  
<br />  

## What tools can add events?  
Apart from manually adding events to a calendar there are many other options. Below is a list of different ways I have come across to create calendar events. 
 * **Via Application**  
   * macOS
     * [Apple Event Script](https://github.com/107208579/calendar-tracking/tree/main/applescript) - event creation via AppleScript
   * iOS
     * [iOS Shortcuts](https://support.apple.com/en-gb/guide/shortcuts/welcome/ios) - event creation with shortcuts
     * [iOS Shortcuts](https://support.apple.com/en-gb/guide/shortcuts/welcome/ios) + [NFC Tags](https://www.matthewcassinelli.com/nfc-tags-siri-shortcuts/) - event creation with shortcuts and NFC tags
     * [Duplicator](https://apps.apple.com/app/id863270136) - event duplication of existing events
     * [Calendar Paste](https://apps.apple.com/app/id581693524) - event creation via pre-defined templates 
     * [Week Calendar](https://apps.apple.com/app/id381059732) - event creation via pre-defined templates 
   * Android
	    * [Add Quick Event](https://play.google.com/store/apps/details?id=com.a3w4u.addquickeventfree) - event creation via shortcut text
	    * [Add Your Template](https://play.google.com/store/apps/details?id=streim.de.quickaddroidpro) - event creation via pre-defined templates 
	    * [Calendar Helper](https://play.google.com/store/apps/details?id=net.noople.calendarhelper) - event creation via pre-defined templates
	    * [CalenGoo](https://play.google.com/store/apps/details?id=com.calengoo.android) - event creation via pre-defined templates
<br />
  
 * **Via GPS Location**
   * iOS
     * [Geofency](https://apps.apple.com/app/id615538630) - automatic event creation based on GPS location  
     * [Tyme](https://apps.apple.com/app/id1461456813) - automatic event creation based on GPS location  
<br />  
  
 * **Via Bluetooth Location**  
   * iOS  
     * [Geofency](https://apps.apple.com/app/id615538630) + [Bluetooth Beacon](https://www.feasycom.com/product/Bluetooth-Beacon.html) - event creation based on Bluetooth beacon detection
   * Self-Hosted  
     * Linux Server + [monitor](https://github.com/andrewjfreyer/monitor) + [mqtt2caldav](https://github.com/107208579/mqtt2caldav)  
<br />  

 * **Via Physical Button Press**  
   * macOS
     * [Keyboard](https://www.apple.com/sg/shop/product/MLA22ZA/A/magic-keyboard-us-english) + [Keyboard Shortcuts](https://support.apple.com/en-gb/guide/mac-help/mchlp2271/11.0/mac/11.0) + [Apple Event Script](https://github.com/107208579/calendar-tracking/tree/main/applescript)
     * [Keyboard](https://www.apple.com/sg/shop/product/MLA22ZA/A/magic-keyboard-us-english) + [KeyBoardMaestro](https://www.keyboardmaestro.com) + [Apple Event Script](https://github.com/107208579/calendar-tracking/tree/main/applescript)
     * [Flic Button](https://flic.io/) + [macOS Flic App](https://flic.io/mac-app) + [Flic Shell Plugin](https://github.com/MikeDocker/Flic-Plugin) + [Apple Event Script](https://github.com/107208579/calendar-tracking/tree/main/applescript)
     * [StreamDeck](https://www.elgato.com/en/gaming/stream-deck) + [macOS StreamDeck App](https://www.elgato.com/en/gaming/downloads) + [Apple Event Script](https://github.com/107208579/calendar-tracking/tree/main/applescript)
   * iOS 
     * [Flic Button](https://flic.io/) + [iOS Flic App](https://apps.apple.com/app/id977593793) + [IFTTT (iOS Calendar)](https://ifttt.com/ios_calendar) / [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Android
     * [Flic Button](https://flic.io/) + [Android Flic App](https://play.google.com/store/apps/details?id=io.flic.app) + [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Cloud Hosted
     * [Flic Button](https://flic.io/) + [Flic Hub](https://flic.io/) + [IFTTT (iOS Calendar)](https://ifttt.com/ios_calendar) / [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Self-Hosted
     * [Zigbee Buttons](https://www.zigbee2mqtt.io/information/supported_devices.html) + [Zigbee Receiver](https://www.zigbee2mqtt.io/information/supported_adapters.html) + Linux Server + [zigbee2mqtt](https://www.zigbee2mqtt.io) + [mqtt2caldav](https://github.com/107208579/mqtt2caldav)
     * [Zigbee Buttons](https://www.zigbee2mqtt.io/information/supported_devices.html) + [Sonoff Zigbee Gateway](https://www.itead.cc/sonoff-zbbridge.html) - [flashed](https://www.digiblur.com/2020/07/how-to-use-sonoff-zigbee-bridge-with.html) + Linux Server + [mqtt2caldav](https://github.com/107208579/mqtt2caldav) 
     * [RF Buttons](https://www.amazon.com/s?k=433MHz+Button) + [Sonoff RF Gateway](https://sonoff.tech/product/accessories/433-rf-bridge) - [flashed](https://www.youtube.com/watch?v=o4Qa43c_shM) + Linux Server + [zigbee2mqtt](https://www.zigbee2mqtt.io) + [mqtt2caldav](https://github.com/107208579/mqtt2caldav)
   * Self-Built
     * [Onion Omega 2](https://onion.io/omega2/) - [guide](http://frederickvandenbosch.be/?p=2345) + [IFTTT (iOS Calendar)](https://ifttt.com/ios_calendar) / [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
<br />
<br />

## What other tools are helpful?  
 * iOS  
   * [Arc App](https://apps.apple.com/app/id1063151918) - tracks which locations you have been to and for how long  
   * [Geofency](https://apps.apple.com/app/id615538630) - tracks which locations you have been to and for how long  
   * [Geofy](https://apps.apple.com/app/id894390468) - tracks which locations you have been to and for how long  
   * [Life Cycle](https://apps.apple.com/app/id1064955217) - tracks which locations you have been to and for how long  
   * [Tyme](https://apps.apple.com/app/id1461456813) - tracks which locations you have been to and for how long  
 * macOS
   * [iCalBuddy](https://hasseg.org/icalBuddy/) - command line tool to query calendars
   * [iCalBuddy64](https://github.com/DavidKaluta/icalBuddy64) - command line tool to query calendars
* Self-Hosted
   * [http2mqtt](https://github.com/oliverlorenz/http2mqtt) - converts http requests to mqtt messages
   * [mqtt2caldav](https://github.com/107208579/mqtt2caldav) - converts mqtt messages to calendar events
<br />
<br />

## How can events be exported?  
* macOS  
  * [Export Calendars Pro](http://apps.apple.com/app/id663835623) - export events into spreadsheets
  * [TimeTable](https://apps.apple.com/app/id1191331765) - export events into spreadsheets
<br />
<br />

## How can events be analysed?  
 * [Tableau](https://www.tableau.com) - import spreadsheets and analyse data
<br />
<br />

## What setup do you use specifically?  
I have a [Nextcloud](http://nextcloud.com/) server running which keeps my iPhone, iPad, and iMac calendars via CalDAV in sync. On the go, I mostly log events on my iPhone via [iOS Shortcuts](https://support.apple.com/en-gb/guide/shortcuts/welcome/ios). At home I use Zigbee switches that allow me to log events via a simple button press. I also modify events in the [macOS Calendar](http://support.apple.com/guide/calendar/welcome/mac) app or via [BusyCal](https://www.busymac.com/busycal/) if really required.

<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup.png" width="600">    
</p>

My setup has different calendars, such as Employment, Entertainment, Transportation, etc
* EMP   
* ENT   
* TRA   
* …

Each event receives a different event title with more details:
* EMP - Work
* EMP - Meeting
* EMP - Interview 
* ENT - Computer
* ENT - Television
* TRA - Walk  
* TRA - Bus  
* TRA - Car  
* …

<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Overview.png" width="620">
</p>
<br />
<br />

The smallest event duration logged is 5 minutes. Here are some event example events:
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_001.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_002.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_003.png" width="250">
</p>
<br />
<br />

On my iPhone I have created one-touch [iOS Shortcut](https://support.apple.com/en-gb/guide/shortcuts/welcome/ios) bookmarks:
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_iOS14_Shortcuts.png" width="250">
</p>
<br />
<br />


At home I have several battery powered [Zigbee switches](https://www.zigbee2mqtt.io/information/supported_devices.html) that send a wireless signal upon a button press. The signal is received by a [Zigbee antenna](https://www.zigbee2mqtt.io/information/supported_adapters.html) and forwarded to a [Raspberry Pi Zero W](https://www.raspberrypi.org/) who creates a new calendar event on my central [Nextcloud](http://nextcloud.com/) server. From there, all events are sync'ed via CalDAV across all connected calendars.

I've written up a tutorial on how to get a Raspberry Pi OS [base installation](https://github.com/107208579/calendar-tracking/blob/main/setup_zigbee/1_setup_raspberrypi.txt) and how to setup Zigbee switches with all [required software](https://github.com/107208579/calendar-tracking/blob/main/setup_zigbee/2_setup_zigbee.txt).

<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Zigbee.png" width="600">    
</p>
<br />
<br />
