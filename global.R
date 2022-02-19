library(tidyverse)

athlete_events <- read.csv("data/athlete_events.csv")
noc_regions <- read.csv("data/noc_regions.csv")

replace(athlete_events$Medal,NA, "pas de medailles")

athlete_events$Medal[is.na(athlete_events$Medal)] <- "No medal"
athlete_events$Age[is.na(athlete_events$Age)] <- mean(athlete_events$Age)
athlete_events$Height[is.na(athlete_events$Height)] <- mean(athlete_events$Height)
athlete_events$Weight[is.na(athlete_events$Weight)] <- mean(athlete_events$Weight)


athlete_events <- na.omit(athlete_events)

data <- athlete_events %>% 
  inner_join(noc_regions, by=c("NOC"))

data_winter <- data %>% 
  filter(Season=="Winter")

data_summer <- data %>% 
  filter(Season=="Summer")

