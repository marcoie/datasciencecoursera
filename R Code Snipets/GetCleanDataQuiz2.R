# Task2
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("MarcoDSApp",
                   key = "",
                   secret = "")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
# req <- GET("https://api.github.com/rate_limit", gtoken)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
json1 <- content(req) #native  Json 
json2 <- jsonlite::fromJSON(toJSON(json1)) #jason dataframe like ...
json2[json2$name == "datasharing",]$created_at 

#SQL Part

