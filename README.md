# Calendar Tracking  
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Overview.png" width="800">
<br />
<br />

## Why track your time?  
Have you ever asked yourself where your time goes? Or have you ever wished you could remember what you were doing on a specific day in the past? How do you spend your 10,080 minutes in a week? 

I've been tracking my life since 2012, mainly to:
- remember past events
- learn about myself
- plan better for the future
- change personal behaviour
- leave a legacy

Here are some great people that also track their life via a calendar:
* [Lifelogging](https://david.achkar.com/qssv-lifelog-talk/) (David Achkar)
* [Every Step I Take](https://www.youtube.com/watch?v=MazwAPVO70Y) (Nicholas Feltron)
* [Productivity Hacking](http://www.jamesmaa.com/2012/12/02/james-maas-productivity-hacking-guide/) (James Maa)
* [Keeping Track of Time](https://vimeo.com/57823452) (Awais Hussain)
* [Tracking My Time Spent](https://blog.usejournal.com/quantified-self-tracking-my-time-spent-1fdb97652595) (Stephanie Rogers)
* [How and Why I Create a Quantified Self](https://www.jacksondame.com/blog/lifelogging-how-and-why-i-create-a-quantified-self) (Jackson Dame)
* [I Tracked Every Minute Of My Life For 7 Days](https://www.youtube.com/watch?v=FLLiFl1m9I4)  (Nathaniel Drew)
* [I Tracked Every Minute Of My Life For 3 Months](https://www.youtube.com/watch?v=LUjTvPy_UAg) (Matt D'Avella)
* [I Tracked Every Minute Of My Life For One Week](https://www.youtube.com/watch?v=CtyJR2e1Fco) (Antonia)
* [How Six Months of Tracking Everything Increased my Awareness](https://vimeo.com/78020552) (David Achkar)
<br />
<br />

## How does this all work?  
The easiest way is to create events in a calendar. Use a calendar service such as [Apple iCloud](https://www.icloud.com/calendar/) or [Google Calendar](https://calendar.google.com/) that acts as a central storage and allows all your calendar apps to connect and synchronise events.

<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Setup.png" width="800"> 
<br />
<br />


## What calendar apps can be used?
Literally any calendar you are comfortable with. Below you find a small list of servers and applications that support CalDAV and allow for easy synchronisation of events between different devices, such as your computer, laptop, and mobile phone.  
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

* **Clients**  
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
     * [Apple Event Script](https://github.com/107208579/applescript2event) - event creation via AppleScript
   * iOS
     * iOS Shortcuts - event creation with shortcuts
     * iOS Shortcuts + [NFC Tags](https://www.matthewcassinelli.com/nfc-tags-siri-shortcuts/) - event creation with shortcuts and NFC tags
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
     * [Keyboard](https://www.apple.com/sg/shop/product/MLA22ZA/A/magic-keyboard-us-english) + [Keyboard Shortcuts](https://support.apple.com/en-gb/guide/mac-help/mchlp2271/11.0/mac/11.0) + [Apple Event Script](https://github.com/107208579/applescript2event)
     * [Keyboard](https://www.apple.com/sg/shop/product/MLA22ZA/A/magic-keyboard-us-english) + [KeyBoardMaestro](https://www.keyboardmaestro.com) + [Apple Event Script](https://github.com/107208579/applescript2event)
     * [Flic Button](https://flic.io/) + [macOS Flic App](https://flic.io/mac-app) + [Flic Shell Plugin](https://github.com/MikeDocker/Flic-Plugin) + [Apple Event Script](https://github.com/107208579/applescript2event)
     * [StreamDeck](https://www.elgato.com/en/gaming/stream-deck) + [macOS StreamDeck App](https://www.elgato.com/en/gaming/downloads) + [Apple Event Script](https://github.com/107208579/applescript2event)
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


## How do you personally track your time?  
I run a self-hosted [Nextcloud](http://nextcloud.com/) server which keeps my iPhone, iPad, and iMac calendars in sync via CalDAV. I also log calendar events via a simple button press.

* [Zigbee Buttons](https://www.zigbee2mqtt.io/information/supported_devices.html) + [Zigbee Receiver](https://www.zigbee2mqtt.io/information/supported_adapters.html) + Linux Server + [zigbee2mqtt](https://www.zigbee2mqtt.io) + [mqtt2caldav](https://github.com/107208579/mqtt2caldav)

My calendar separates life categories with different colour-coded calendars, such as Education, Employment, Entertainment, Food, Housework, Hygiene, Rest, Sports, Transportation, etc
* EDU   
* EMP   
* ENT   
* FOO  
* HOU  
* HYG  
* RES  
* SPO  
* TRA  
* …

Each calendar has a different event title that allows me to have additional details:
* ENT - Book  
* ENT - Computer  
* ENT - Game  
* ENT - Television  
* HOU - Cleaning  
* HOU - Laundry  
* HOU - Maintenance    
* TRA - Walk  
* TRA - Bus  
* TRA - Car  
* TRA - Walk  
* …

Here are some examples:
<p float="left">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_001.png" width="300">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_002.png" width="300">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_003.png" width="300">
</p>
<br />
<br />
