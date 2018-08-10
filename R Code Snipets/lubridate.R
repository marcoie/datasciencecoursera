library(lubridate)
this_day <- today()
month(this_day)
year(this_day)
day(this_day)
wday(this_day) ##DOW number
wday(this_day, label = TRUE)
this_moment <- now()
second(this_moment)
minute(this_moment)
hour(this_moment)

update(this_moment, hours = 8, minutes = 34, seconds = 55)

# Now, pretend you are in New York City and you are planning to visit a friend in Hong Kong.
# | You seem to have misplaced your itinerary, but you know that your flight departs New York at
# | 17:34 (5:34pm) the day after tomorrow. You also know that your flight is scheduled to arrive
# | in Hong Kong exactly 15 hours and 50 minutes after departure

nyc <- now(tzone = "America/New_York")
##http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

depart <- nyc + days(2)
depart <- update(depart, hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(arrive, "Asia/Hong_Kong")

# ast forward to your arrival in Hong Kong. You and your friend have just met at the airport
# | and you realize that the last time you were together was in Singapore on June 17, 2008.
# | Naturally, you'd like to know exactly how long it has been.
last_time <- mdy("June 17, 2008", tz = "Singapore")
how_long <- interval(last_time, arrive)


