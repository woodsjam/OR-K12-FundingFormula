library(readr)

OSBA_Salary_Survey_13_14 <- read_csv("OSBASalarySurvey/OSBA Salary Survey - 13-14.csv")
OSBA_Salary_Survey_14_15 <- read_csv("OSBASalarySurvey/OSBA Salary Survey - 14-15.csv")
OSBA_Salary_Survey_15_16 <- read_csv("OSBASalarySurvey/OSBA Salary Survey - 15-16.csv")
OSBA_Salary_Survey_16_17 <- read_csv("OSBASalarySurvey/OSBA Salary Survey - 16-17.csv")


OSBA_Salary_Survey_13_14$EndYear<-2014
OSBA_Salary_Survey_14_15$EndYear<-2015
OSBA_Salary_Survey_15_16$EndYear<-2016
OSBA_Salary_Survey_16_17$EndYear<-2017

OSBASalarySurvey <- rbind(OSBA_Salary_Survey_13_14, OSBA_Salary_Survey_14_15, OSBA_Salary_Survey_15_16, OSBA_Salary_Survey_16_17)

rm(OSBA_Salary_Survey_13_14, OSBA_Salary_Survey_14_15, OSBA_Salary_Survey_15_16, OSBA_Salary_Survey_16_17)

library(dplyr)

# OSBASalarySurvey %>%
#   select(District) %>%
#   unique() %>% write_csv("OSBASalarySurvey/DistritIDMap.csv")

# Membership %>%
#   select(DistrictID, District) %>%
#   unique() %>% 
#   arrange(District) %>% write_csv("OSBASalarySurvey/DistritIDs.csv")

DistrictIDMap <- read_csv("OSBASalarySurvey/DistritIDMap.csv")

OSBASalarySurvey %>%
  left_join(DistrictIDMap, by = "District") -> OSBASalarySurvey

OSBASalarySurvey %>%
  write_csv("OSBASalarySurvey/EditedSalarySurvey.csv")
