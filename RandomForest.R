#code elaborated from Schmuller, J. (2018). R Projects For Dummies. Hoboken, NJ. John Wiley & Sons Inc.

rm(list=ls())

library(readxl)
library(randomForest)
library(caret)
library(party)

TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv")
df_TCD = data.frame(TCD) #Putting into data frame

#modifying Senior to Y/N
#Assigning Yes as default and No if the value is there and adding column
df_TCD$SeniorYN <- 'Yes'
df_TCD$SeniorYN[df_TCD$SeniorCitizen == 0] <-'No' 
df_tst = data.frame(df_TCD$SeniorCitizen,df_TCD$SeniorYN)
df_tst #confirmed that it worked
str(df_TCD) # SeniorYN: chr  "No" "No" "No" "Yes" ...
df_TCD$SeniorYN <- as.factor(df_TCD$SeniorYN)

#removing Senior 1,0 and removing Phone Svc always set to Yes
df_TCD[1] #testing postion 1 so I don't delete wrong columns (3 and 7)
df_TCD  <- df_TCD[-c(1,3,7)]  #needed to run only 1 time, custid is issue, and other 2 not needed
str(df_TCD)


#split out some training data
set.seed(810)
training.set = sample(nrow(df_TCD),0.7*nrow(df_TCD))

#trying to make call to random forest cleaner, but get error Can not handle categorical predictors with more than 53 categories
churn.forest <- randomForest(formula = Churn ~ .,data = df_TCD, ntree = 500, subset=training.set,importance = TRUE)

#evaluating
print(churn.forest) # only 

#plot
plot(churn.forest, col = "black")
legend("topright", legend=c(levels(df_TCD$Churn),"OOB"),lty = c("dashed","dotted","dotdash","solid"),cex=.8,bty = "n")
churn.forest






