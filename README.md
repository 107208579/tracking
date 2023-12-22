# Calendar Tracking  
<br />
<br />

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
* [Productivity Hacking](https://jamesmaa.com/productivity_guide/time-management/) (James Maa)
* [Keeping Track of Time](https://vimeo.com/57823452) (Awais Hussain)
* [Tracking My Time Spent](https://blog.usejournal.com/quantified-self-tracking-my-time-spent-1fdb97652595) (Stephanie Rogers)
* [Time blocking and time tracking](https://www.youtube.com/watch?v=X57gxhIHjBE) (Aparna Kher)
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

I have different calendars to better categorise events:
<div align="center">

|CAL|Calendar|Used for|
|:--:|:--|:--|
|**EDU**|Education|Learning related activity, such as training, courses, etc|
|**EMP**|Employment|Work events, including work hours, meetings, interviews, etc|
|**ENT**|Entertainment|Time spent on a computer, television, with a book, etc|
|**ERR**|Errands|Shopping for groceries, clothing, electronics, etc|
|**FOO**|Food|Eating breakfast, lunch, dinner, or snacks|
|**HEA**|Health|Doctor visits for medical, dental, etc| 
|**HOU**|Housework|Cooking, cleaning, doing the laundry, etc|  
|**HYG**|Hygiene|Personal care such as showers, bathroom visits, haircuts, etc|
|**PRO**|Project|Personal interest projects|
|**RES**|Rest|Sleep hours|
|**SOC**|Social|Social activities, such as meeting friends, etc|
|**SPO**|Sport|Physical activity, including running, cycling, sailing, etc|
|**TRA**|Transportation|Time spent on the move via car, subway, walking, etc|

</div>
<br />
<br />

Each event has a different event title and event notes with more details. The smallest event duration logged is 5 minutes. Here are some event examples:
<p align="center">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_001.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_002.png" width="250">
<img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Event_003.png" width="250">
</p>
<br />
<br />


## What tools do you use to log events?  
### At my computer
I log events directly on my iMac, mostly cloning existing events from the previous days via copy ⌘C and paste ⌘V. I also log events via a simple button-press from my [Streamdeck](https://www.elgato.com/en/stream-deck) that triggers [macOS Shortcuts](https://support.apple.com/en-gb/guide/shortcuts-mac/apdf22b0444c/mac) ([Examples](https://github.com/107208579/calendar-tracking/blob/main/shortcuts/README.md)).
<br />
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_StreamDeck_Photo.png" width="740"></p>
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_StreamDeck_Setup.png" width="740"></p>

<br />
<br />

### On the go
When being mobile I log events on my iPhone via one-touch [iOS shortcuts](https://support.apple.com/en-sg/guide/shortcuts/welcome/ios) ([Examples](https://github.com/107208579/calendar-tracking/blob/main/shortcuts/README.md)).
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_iOS14_Shortcuts.png" width="250"></p>
<br />
<br />

### Around the home
At home, I also use a setup that includes wireless switches which allow me to log events via a simple button press. Zigbee switches are cheap buttons that run on a coin cell battery and when pressed send a signal to a server, which in return creates a calendar event. I've written up a full setup tutorial which can be [found here](https://github.com/107208579/calendar-tracking/blob/main/switches/README.md).
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup.png" width="740"></p>
<br />
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Personal_Setup_Zigbee.png" width="740"></p>
<br />
<br />

### Other options
I've documented [various alternative software & hardware options](https://github.com/107208579/calendar-tracking/blob/main/options/README.md) across different systems on how to log events to a calendar.
<br />
<br />

## How do you analyse your data?  
Events are extracted from my macOS calendar via [Export Calendars Pro](http://apps.apple.com/app/id663835623) and saved in a spreadsheet. [Tableau](https://www.tableau.com/) connects to the data and allows for analysis.
<br />
<p align="center"><img src="https://github.com/107208579/tracking/blob/main/img/Calendar_Export Calendars Pro_Overview.png" width="740"></p>
<br />
<br />
