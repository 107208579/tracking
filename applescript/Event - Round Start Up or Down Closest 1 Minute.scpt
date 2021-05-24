--- Variables ----------------------
set date_ to (current date) + 30
set EventStartDate to date_ - ((time of date_) mod 60)
set seconds of EventStartDate to 0
set EventEndDate to EventStartDate + (5 * minutes)
set seconds of EventEndDate to 0

--- Script --------------------------
tell application "Calendar"
	tell calendar "Home"
		make new event with properties {summary:"Test", start date:EventStartDate, end date:EventEndDate, location:"1 Street, 23456 City, Country", description:"Buy more milk!"}
	end tell
end tell
