# init
library(stringi)  ## for ensuring same formatting for states
library(ggplot2)
library(maps)

#load us map data
states <- map_data("state")
states$region <- stri_trans_totitle(states$region)

# apply census divisions
states$division[states$region %in% c("Connecticut", "Delaware", "District Of Columbia", "Maine", "Massachusetts", "Maryland", 
                                     "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Rhode Island", "Vermont")] <- "Northeast"

states$division[states$region %in% c("Arkansas", "Alabama", "Florida", 'Georgia', "Kentucky", "Louisiana", "Mississippi", 
                                     "North Carolina", "South Carolina", "Tennessee", "Virginia", "West Virginia")] <- "South"

states$division[states$region %in% c("Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", "Missouri", "Nebraska", 
                                     "North Dakota", "Ohio", "Oklahoma", "South Dakota", "Wisconsin")] <- "Mid-America"

states$division[states$region %in% c("Arizona", "California", "Colorado", "Idaho", "Montana", "Nevada", "New Mexico", "Oregon", "Texas",
                                     "Utah", "Washington", "Wyoming")] <- "West"

## excludes Alaska and Hawaii

#plot all states with ggplot
ggplot(data=states, aes(x=long, y=lat)) + geom_polygon(aes(group=group, fill=division), color='black') + 
  scale_fill_brewer(palette="Spectral")

