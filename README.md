# Calendar Tracking  

## Why track your time?  
Have you ever asked yourself where your time goes? Or have you ever wished you could remember what you were doing on a specific day? What about remembering the last time you meet up with a friend or relative? Or the name of the restaurant with the great desert you visited last year when you were on a business trip?

Back in 2012 I had similar questions and wanted to get to the bottom of how I spend my 10,080 minutes per week. So I decided to start tracking my life in a calendar. Specifically I wanted to:
- outsource memories
- remember past events
- learn more about myself
- become a better planner
- increase my productivity
- change personal behaviour
- have a visualization of my life
<br />
<br />

## Who does that?  
Here are some great people that track their life with the help of a calendar.
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
* [What I Learned After Analyzing Every Minute of My Life for 30 Days](https://zapier.com/blog/time-tracking-tutorial/) (Erin Greenawald)
<br />
<br />

## How does this work?  
It's simple - log events in a calendar via a computer or a mobile phone. Utilise a calendar service such as [Apple Calendar](https://www.icloud.com/calendar/) or [Google Calendar](https://calendar.google.com/) that acts as central storage hub and automatically sync events between different devices such as your mobile phone or home computer. Analyse the data!
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Setup.png" width="740"></p>
<br />
<br />

## What setup do you use?  
I have an Apple iMac and use the default [macOS Calendar](http://support.apple.com/guide/calendar/welcome/mac) app.
<br />
<br />
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Overview.png" width="740"></p>
<br />
<br />

I have different calendars, such as Education, Employment, Errands, Entertainment, Food, Health, Housework, Hygiene, Projects, Rest, Socialising, Sports, and Transportation. For convenience, I shortened their names to 3 letters: 
* EDU  
* EMP   
* ENT  
* ERR  
* FOO  
* HEA  
* HOU  
* HYG  
* PRO  
* RES  
* SOC  
* SPO  
* TRA   
* …  
<br />
<br />

Each event has a different event title with more details:
* EMP - Work
* EMP - Meeting
* EMP - Interview 
* ENT - Computer
* ENT - Television
* TRA - Walk  
* TRA - Bus  
* TRA - Car  
* …
<br />
<br />

The smallest event duration logged is 5 minutes. Here are some event example events where I also include additional details in the 'Notes' section:
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_001.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_002.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_003.png" width="250">
</p>
<br />
<br />


## What tools do you use to log events?  
### At my computer
I log events directly on my iMac, mostly cloning existing events from the previous days via copy ⌘C and paste ⌘V. I also log events via a simple button-press on my [Streamdeck](https://www.elgato.com/en/stream-deck) that connects to [macOS Shortcuts](https://support.apple.com/en-gb/guide/shortcuts-mac/apdf22b0444c/mac) ([Examples](https://github.com/107208579/calendar-tracking/blob/main/shortcuts/README.md)).

<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_StreamDeck_Setup.png" width="740"></p>
<br />
<br />

### On the go
When being mobile I log events on my iPhone via one-touch [iOS shortcuts](https://support.apple.com/en-sg/guide/shortcuts/welcome/ios) ([Examples](https://github.com/107208579/calendar-tracking/blob/main/shortcuts/README.md)).
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_iOS14_Shortcuts.png" width="250"></p>
<br />
<br />

### Around the home
Around my house I also use another setup that includes Zigbee switches that allow me to log events via a simple physical button press. Zigbee switches are cheap physical buttons that run on a coin cell battery and when pressed send a wireless signal to a server which creates a calendar event.

The setup is a bit more complicated as I run a dedicated [Nextcloud](http://nextcloud.com/) server to keep my calendar data in sync between my devices. I assume that [Apple Calendar](https://www.icloud.com/calendar/) or [Google Calendar](https://calendar.google.com/) might be a suitable options but I have no experience.

I've written up a tutorial on what hardware is required and how to setup a Raspberry Pi installation to make things work, which can be [found here](https://github.com/107208579/calendar-tracking/blob/main/switches/README.md).
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup.png" width="740"></p>
<br />
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Zigbee.png" width="740"></p>
<br />
<br />

### Other options
If the above options are not enough for your event logging needs, I've documented [various alternative options](https://github.com/107208579/calendar-tracking/blob/main/options/README.md).
