#Telco Churn Data Science project Logistics Regression
#Code Adpapted from https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/

library(ISLR)
library(tree)
library(caret)
library(dplyr)

TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv")  #TCD aka Telco Data Churn
df_TCD = data.frame(TCD) #Putting into data frame

#modifying Senior to Y/N
#Assigning Yes as default and No if the value is there and adding column
df_TCD$SeniorYN <- 'Yes'
df_TCD$SeniorYN[df_TCD$SeniorCitizen == 0] <-'No' 
df_tst = data.frame(df_TCD$SeniorCitizen,df_TCD$SeniorYN)
df_tst #confirmed that it worked
df_TCD$SeniorYN <- as.factor(df_TCD$SeniorYN)
str(df_TCD) # SeniorYN: chr  "No" "No" "No" "Yes" ...

#removing Senior 1,0 and removing Phone Svc always set to Yes
df_TCD[1] #testing postion 1 so I don't delete wrong columns (3 and 7)
df_TCD  <- df_TCD[-c(1,7)]  #needed to run only 1 time, custid is issue, and other 2 not needed
str(df_TCD)

### Split data into testing and training
train <- df_TCD[1:2233,]
testing <- df_TCD[2234:3333,]


#logistics regression
LogR_ChUrn <- glm(Churn ~.,family=binomial(link='logit'),data=train)
summary(LogR_ChUrn)

#variable importance
varImp(LogR_ChUrn)

#predictions
pred = predict(LogR_ChUrn, newdata=testing)
accuracy <- table(pred, testing[,"Churn"])
sum(diag(accuracy))/sum(accuracy)

confusionMatrix(data=pred, testing$Churn)