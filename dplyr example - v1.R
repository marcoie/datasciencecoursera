load(dplyr) ## data maniulation
path2csv <- "/Library/Frameworks/R.framework/Versions/3.4/Resources/library/swirl/Courses/Getting_and_Cleaning_Data/Manipulating_Data_with_dplyr/2014-07-08.csv"
mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
packageVersion("dplyr")
filter(cran, package == "swirl") # rows subsetting

# The first step of working with data in dplyr is to load the data into what the 
# package authors call a 'data frame tbl' or
# 'tbl_df'. Use the following code to create a new tbl_df called cran
cran <- tbl_df(mydf) #tibble!
select(cran, ip_id, package, country) ###select a subset without using "$" to access columns and returns the specified order
select(cran, r_arch:country) # ":" can also be used to get sequence of columns. 
select(cran, -time) # The "-" removes a column
select(cran, -(X:size))
filter(cran, r_version == "3.1.1", country == "US") # filter multiple column
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")
filter(cran, !is.na(r_version))
cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version), ip_id)
cran3 <- select(cran, ip_id, package, size)
mutate(cran3, size_mb = size / 2^20) # add one column!!
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10) # 2 columns, same line, 2nd depending on 1st

# A tibble: 95,283 x 11
## base start here
# Don't change any of the code below. Just type submit()
# when you think you understand it.

# We've already done this part, but we're repeating it
# here for clarity.

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)

# Don't change any of the code below. Just type submit()
# when you think you understand it. If you find it
# confusing, you're absolutely right!

result2 <-
    arrange(
        filter(
            summarize(
                group_by(cran,
                         package
                ),
                count = n(),
                unique = n_distinct(ip_id),
                countries = n_distinct(country),
                avg_bytes = mean(size)
            ),
            countries > 60
        ),
        desc(countries),
        avg_bytes
    )

print(result2)

### BETTER CODE BELLOW
# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

result3 <-
    cran %>%
    group_by(package) %>%
    summarize(count = n(),
              unique = n_distinct(ip_id),
              countries = n_distinct(country),
              avg_bytes = mean(size)
    ) %>%
    filter(countries > 60) %>%
    arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)



# arrange() the result by size_mb, in descending order.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
    select(ip_id, country, package, size) %>%
    mutate(size_mb = size / 2^20) %>%
    filter(size_mb <= 0.5) %>%
    arrange(desc(size_mb)) %>%
    print 
# Your call to arrange() goes here
