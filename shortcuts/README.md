# Calendar Tracking (Shortcuts)
<br />


## Downloads
| Transportation | Action |
|:---------|:-------|
|[TRA - Walk](https://www.icloud.com/shortcuts/a182ea15d56f4f9493d37f46c0e0ed93)    |Walk           |
|[TRA - Car](https://www.icloud.com/shortcuts/618a22e19144425681ff7c5d7b1bf2ba)     |Car            |
|[TRA - Bus](https://www.icloud.com/shortcuts/eedbb943135745b0bdeeaa8c09fd0f95)     |Bus            |
|[TRA - Taxi](https://www.icloud.com/shortcuts/d2b2c0be68af41119cd701136b156f53)    |Taxi           |
|[TRA - Subway](https://www.icloud.com/shortcuts/818c30f91a68425b897a567ceaf59c7e)  |Subway         |
|[TRA - Connect |Connects the last two TRA events by setting the end time of the first event to the start time of the second event|
<br />
<br />


| Time Manipulation | Action |
|:---------|:-------|
|[Stop Event Now](https://www.icloud.com/shortcuts/31552dfb24774a1686f956e695ac9032)    |Moves the end time of a selected event to the nearest 5 minute from now  |
|[Move Event Earlier](https://www.icloud.com/shortcuts/6f1466e97e654e3b8cbbfbc376dd1b4d)|Shifts a selected event with start time and end time to 5 minutes earlier| 
|[Move Event Later](https://www.icloud.com/shortcuts/55bc65bd5be149f1a184cd5fb4841185)  |Shifts a selected event with start time and end time to 5 minutes later  |
<br />
<br />


## Configuration
The shortcuts open a variety of configuration options which can be found atop each shortcut in the 'Settings' section.
<br />

**Shortcuts :: versionNumber**  
Specifies the shortcut version number in YYYYMMDD format.
* 20201031
* 20210606
* ...
<br />

**Shortcuts :: eventCalendar**  
Specifies the calendar name the event should be logged in.
* Work
* Home
* ...
<br />

**Shortcuts :: eventTitle**  
Specifies the event title.
* Meeting with Godzilla
* 99th Birthday Anniversary
* ...
<br />

**Shortcuts :: eventLocation**  
Specifies the event location.
* Baseball Stadium Staines
* 1 Main Street, City 2345, Country
* ...
<br />

**Shortcuts :: eventNote**  
Specifies event notes.
* Try to take over the world
* Buy more milk and more cheese
* ...
<br />

**Shortcuts :: eventRoundMinute**  
Rounds the event start time up or down to the nearest specified minute. As an example, if the 'eventRoundMinute' is set to '5' minutes a shortcut that is run at 11:22:35 will be rounded up to 11:25:00. A shortcut that is run at 11:22:25 will be rounded down to 11:20:00.
* 1
* 5
* ...
<br />

**Shortcuts :: eventDuration**  
Sets the default event duration in minutes. As an example, if the 'eventDuration' is set to '5' minutes a newly created event with start time of 11:25:00 will have the end time set to 11:30:00.
* 1
* 5
* ...
<br />

**Shortcuts :: eventExtension**  
Specifies the event extension in minutes. When a shortcut is run, it will check if the same type of event already exists, and if so, will remove the existing event and replace it with a new event by setting the original start time but extending the end time. This is to quickly update the duration minutes of an already xisting event.
* 1
* 5
* ...
<br />

**Shortcuts :: eventSearchMinusTime**  
Specifies the amount of minutes the search function should look back in time from now to find the same type of event.
* 1
* 5
* ...
<br />

**Shortcuts :: eventSearchPlusTime**  
Specifies the amount of minutes the search function should look forward in time from now to find the same type of event.
* 5
* 10
* ...
<br />

**Shortcuts :: acousticFeedbackVoice**  
Specifies text the device says when the shortcut is run.
* Woohoo!
* Shortcut run successfully!
* ...
<br />

**Shortcuts :: acousticFeedbackFile**  
Specifies the audio file used for devices without vibration functionality to indicate if an event was rounded up or down based on the 'eventRoundMinute' setting. The audio file will be played once if an event start time was rounded down, and will play twice if an event start time was rounded up.
* file:///System/Library/Audio/UISound/begin_record.caf
* http://awesomesounds.com/IceCream/Scream.aaf
* ...
<br />

**Shortcuts :: acousticFeedbackVolume**  
Specifies the volume level at which acoustic feedback is played.
* 0.1
* 0.9
* ...
<br />
<br />
