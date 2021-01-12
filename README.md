
# Calendar Tracking  
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Overview.png" width="800">


## Why track your time?  
Have you ever asked yourself where your time goes? Or have you ever wished you could remember what you were doing on a specific day in the past? How do you spend your 10,080 minutes in a week? Aren't we what we remember?

I've been tracking 
- To remember past events
- To learn about myself
- To change my behavior
- To leave a legacy

Here are some great people that track their life via a calendar:
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
The easiest way is to use a calendar service such as [Apple iCloud](https://www.icloud.com/calendar/) or [Google Calendar](https://calendar.google.com/) which allows all your calendar apps to independently connect and synchronise events. In my case, I run a self-hosted [Nextcloud](http://nextcloud.com) server  which uses CalDAV to keep all my events updated across my iPhone, iPad, and iMac calendar.

<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Setup.png" width="800"> 
 

My calendar separates life categories into different calendars - each with a single color:  
* EDU (Education)  
* EMP (Employment)  
* ENT (Entertainment)  
* FOO (Food)  
* HOU (Housework)  
* HYG (Hygiene)  
* RES (Rest)  
* SPO (Sports)  
* TRA (Transportation)  
* …
<br />
<br />

Each calendar has a different event title that allows me to log more event details:
* TRA - Walk  
* TRA - Bus  
* TRA - Car  
* TRA - Walk  
* ENT - Book  
* ENT - Computer  
* ENT - Game  
* ENT - Television  
* HOU - Cleaning  
* HOU - Laundry  
* …
<br />
<br />

Here are some examples:
<p float="left">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_001.png" width="300">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_002.png" width="300">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_003.png" width="300">
</p>
<br />
<br />


## What calendar apps can be used?
Literally any calendar you are comfortable with. Below you find a small list of applications that support CalDAV and allow for easy synronisation of events between different devices, such as your computer with your mobile phone.  
* **Clients** (to add, update, delete calendar events)  
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
  
* **Servers**  (to sync calendar events via CalDAV)  
  * Cloud Hosted
    * [iCloud Calendar](https://www.icloud.com/calendar/) 
    * [Google Calendar](http://calendar.google.com)
    * [Yahoo Calendar](http://calendar.yahoo.com)
   * Self Hosted
     * [Baïkal](http://www.baikal-server.com)
     * [Nextcloud](http://nextcloud.com) 
     * [Radicale](http://radicale.org)
<br />
<br />

## What tools can add events?  
Apart from manually typing events into a calendar there are many other applications and options
 * **Via Application**  
   * macOS
     * [Apple Event Script](https://github.com/107208579/applescript2event) - event creation via AppleScript
     * [KeyBoardMaestro](https://www.keyboardmaestro.com) + [Apple Event Script](https://github.com/107208579/applescript2event)
   * iOS
     * iOS Shortcuts
     * iOS Shortcuts + NFC Tags
     * [Duplicator](https://apps.apple.com/app/id863270136) - event duplication of existing events
     * [Calendar Paste](https://apps.apple.com/app/id581693524) - event creation via pre-defined templates 
     * [Week Calendar](https://apps.apple.com/app/id381059732) - event creation via pre-defined templates 
   * Android
	    * [Add Your Template](https://play.google.com/store/apps/details?id=streim.de.quickaddroidpro) - event creation via pre-defined templates 
	    * [Calendar Helper](https://play.google.com/store/apps/details?id=net.noople.calendarhelper) - event creation via pre-defined templates
	    * [CalenGoo](https://play.google.com/store/apps/details?id=com.calengoo.android) - event creation via pre-defined templates
<br />
  
 * **Via GPS Location**
   * iOS
     * [Geofency](https://apps.apple.com/app/id615538630) - event creation based on GPS location  
     * [Tyme](https://apps.apple.com/app/id1461456813) - event creation based on GPS location  
<br />  
  
 * **Via Bluetooth Location**  
   * iOS  
     * [Geofency](https://apps.apple.com/app/id615538630) + iBeacon  
   * Self-Hosted  
     * [monitor](https://github.com/andrewjfreyer/monitor) + [mqtt2caldav](https://github.com/107208579/mqtt2caldav)  
<br />  

 * **Via Button Press**  
   * macOS
     * [Flic Button](https://flic.io/) + [macOS Flic App](https://flic.io/mac-app) + [Flic Shell Plugin](https://github.com/MikeDocker/Flic-Plugin) + [AppleScript](https://github.com/107208579/applescript2event)
     * [StreamDeck](https://www.elgato.com/en/gaming/stream-deck) + [macOS StreamDeck App](https://www.elgato.com/en/gaming/downloads) + [AppleScript](https://github.com/107208579/applescript2event)
   * iOS 
     * [Flic Button](https://flic.io/) + [iOS Flic App](https://apps.apple.com/app/id977593793) + [IFTTT (iOS Calendar)](https://ifttt.com/ios_calendar) / [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Android
     * [Flic Button](https://flic.io/) + [Android Flic App](https://play.google.com/store/apps/details?id=io.flic.app) + [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Cloud Hosted
     * [Flic Hub](https://flic.io/) + [Flic Button](https://flic.io/) + [IFTTT (iOS Calendar)](https://ifttt.com/ios_calendar) / [IFTTT (Google Calendar)](https://ifttt.com/google_calendar)
   * Self-Hosted
     * [mqtt2caldav](https://github.com/107208579/mqtt2caldav)
<br />
<br />

## What other tools can help to track?  
 * iOS  
   * [Arc App](https://apps.apple.com/app/id1063151918) - tracks which locations you have been to and for how long  
   * [Geofency](https://apps.apple.com/app/id615538630) - tracks which locations you have been to and for how long  
   * [Geofy](https://apps.apple.com/app/id894390468) - tracks which locations you have been to and for how long  
   * [Life Cycle](https://apps.apple.com/app/id1064955217) - tracks which locations you have been to and for how long  
   * [Tyme](https://apps.apple.com/app/id1461456813) - tracks which locations you have been to and for how long  
<br />
<br />

## How can events be exported?  
* macOS  
  * [Export Calendars Pro](http://apps.apple.com/app/id663835623)  
  * [TimeTable](https://apps.apple.com/app/id1191331765)  
<br />
<br />

## How can events be analysed?  
 * [Tableau](https://www.tableau.com)  
<br />
<br />
