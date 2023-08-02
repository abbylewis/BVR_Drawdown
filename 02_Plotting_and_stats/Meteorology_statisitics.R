# Met Station averages and standard deviation from FCR for the BVR drawdown paper. 
# Author: Adrienne Breef-Pilz
# Date: 28 Mar 23

# Load packages
pacman::p_load("tidyverse","lubridate","RCurl")


# Get data from EDI

options(timeout=3000)

met <-read.csv("https://pasta.lternet.edu/package/data/eml/edi/389/7/02d36541de9088f2dd99d79dc3a7a853")

# select the columns we want, add some columns, and only get observations from May 19th - July 1st for 2021 and 2022
wind_rain<-met%>%
  select(DateTime, Rain_Total_mm, WindSpeed_Average_m_s)%>%
  filter(DateTime>"2021-05-19 00:00:00" & DateTime<"2022-07-02 00:00:00")%>%
  mutate(DateTime=ymd_hms(DateTime))%>%
  mutate(Year=year(DateTime))%>%
  mutate(DOY=yday(DateTime))%>%
  filter(DOY>138 & DOY< 183)

# Average wind speed 

avg_wind<- wind_rain%>%
  group_by(Year)%>%
  summarise(mean_wind=mean(WindSpeed_Average_m_s, na.rm=T), sd_wind=sd(WindSpeed_Average_m_s, na.rm=T ))

# Average air temperatures
avg_AT <- met%>%
  mutate(DateTime=ymd_hms(DateTime))%>%
  select(DateTime, AirTemp_C_Average)%>%
  mutate(Year=year(DateTime))%>%
  mutate(DOY=yday(DateTime))%>%
  filter(DOY>138 & DOY< 183)%>%
  filter(Year>2020)%>%
  group_by(Year) %>% 
  summarise(mean_air=mean(AirTemp_C_Average, na.rm=T), sd_air=sd(AirTemp_C_Average, na.rm=T ))

# Average daily precipitation 

avg_rain<-wind_rain%>%
  group_by(DOY, Year)%>%
  summarise(total_rain_day=sum(Rain_Total_mm))

rain<-avg_rain%>%
  group_by(Year)%>%
  summarise(mean_rain=mean(total_rain_day, na.rm=T), sd_rain=sd(total_rain_day, na.rm=T))

# How much rain fell from DOY 141-147 in 2022

high_rain_period<- avg_rain%>%
  filter(DOY>=141 & DOY<=147)%>%
  group_by(Year)%>%
  summarise(may_rain_mm=sum(total_rain_day))

# total amount of rain during the draw down period
total_rain<- avg_rain%>%
  group_by(Year)%>%
  summarise(all_rain_mm=sum(total_rain_day))

# find the percent of rain during 21 -27 May to total drawdown

per<-cbind(high_rain_period,total_rain)

per$proportion<-per$may_rain_mm/per$all_rain_mm
