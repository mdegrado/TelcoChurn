
#Loading Telco Churn data set from CSV https://www.kaggle.com/pangkw/telco-churn/version/3

TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv")

df_TCD = data.frame(TCD) #Putting into data frame

head(df_TCD) #Displaying first records records 

attach(df_TCD)  #attaching to data

#range of variables
range(SeniorCitizen) #0 and 1, may need to consider changing to Yes and No
range(gender)  #not a number so range does not like this
range(tenure) # 0 to 72
range(NumbervMailMessages) #0 to 51

hist(SeniorCitizen) #part of the EDA but shows histogram of the data elemen
summary(df_TCD) #shows result summaries of the data frame
str(df_TCD) #shows the structure of the data frame, 34 features, 3333 observations
names(df_TCD)#shows friendly names of the data frame

#some simple plots
plot(gender)
hist(SeniorCitizen) #histogram

#loading var into table and calculate proportions instead of using excel pivot
table(df_TCD$Churn)
prop.table(table(df_TCD$Churn)) #getting proportion

prop.table(table(df_TCD$gender,df_TCD$Churn),1)
#No       Yes
#Female 0.8463911 0.1536089
#Male   0.8633178 0.1366822

prop.table(table(df_TCD$SeniorCitizen,df_TCD$Churn),1) 
#25.6 seniors churned, 13% non seniors

prop.table(table(df_TCD$MaritalStatus,df_TCD$Churn),1) 
#Married No 18.4% churn, Yes 9.7%

#experimented with mutliples
aggregate(df_TCD$Churn ~ df_TCD$gender+df_TCD$SeniorCitizen, FUN = length)

library(Hmisc)

describe(df_TCD_thin)# advantage over summary()? Shows distinct,missing,descriptive
View(df_TCD) #brings up tab with the data to view
var(df_TCD) #shows variance within the data








