# Importing Library
library(readr)
library(data.table)
library(sqldf)
library(dplyr)
library(radarchart)
library(tidyr)
library(dtplyr)
library("knitr")
library(DT)
library(ggplot2)

# Import the data
FullData <- read_csv("C:/Users/Mohammad/Desktop/FIFA18-Data-Visualization/Analysis/CompleteDataset.csv")
setDT(FullData)
# View the column names
names(FullData)
# Check the dimensions
dim(FullData)
kable(head(FullData))

#Age density of Fifa Players
ggplot(FullData, aes(Age, fill= Age)) +
  geom_density(position = "stack")

# Overall Best Club team by players rating
TeamDF <- arrange(FullData[, list(Avg=mean(Overall)), by="Club" ], desc(Avg) )

kable(head(TeamDF, 10))

kable(tail(TeamDF, 10))

# Which continent player's are best at which particular Attribute

# First Attribute: Stamina

# Selecting top 100 stamina players
stamina_desc100 <- head(arrange(FullData, desc(Stamina)), n=100)

# Then group by Nationality and sum players Stamina by nationality group, list in descending order
stamina_list <- stamina_desc100 %>% group_by(Nationality)  %>% summarise(n = n()) %>% arrange(desc(n))

# List the first 10 entries
kable(head(stamina_list, 10))

# Second Attribute: Speed

# Selecting top 100 stamina players
speed_desc100 <- head(arrange(FullData, desc(`Sprint speed`)), n=100)

# Then group by Nationality and sum players speed by nationality group, list in descending order
speed_list <- speed_desc100 %>% group_by(Nationality)  %>% summarise(n = n()) %>% arrange(desc(n))

# List the first 10 entries
kable(head(speed_list, 10))

# Third Attribute: Strength

# Selecting top 100 strong players
strength_desc100 <- head(arrange(FullData, desc(`Strength`)), n=100)

# Then group by Nationality and sum players strength by nationality group, list in descending order
strength_list <- strength_desc100 %>% group_by(Nationality)  %>% summarise(n = n()) %>% arrange(desc(n))

# List the first 10 entries
kable(head(strength_list, 10))

#####

# Radar Chart for Top 20 Players

#####

# 11 man dream team

#Considering fist value of Preffered_Position as default

FullData$position <- substr(FullData$`Preffered_Positions`, start = 1, stop = 2)

FullData$position[FullData$position == 'CA'] <- "CAM"
FullData$position[FullData$position == 'CD'] <- "CDM"

unique(FullData$position)

# list of players with highest rating among every positons

result <- FullData %>% 
  group_by(position) %>%
  filter(Rating == max(Rating)) %>%
  arrange(position)

# Omitting un-necessary
result <-result[, -c('National_Position','Club','Club_Position','Club_Joining','Contract_Expiry','Birth_Date','Preffered_Position')]


