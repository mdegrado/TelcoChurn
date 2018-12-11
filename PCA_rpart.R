#Telco Churn Data Science project PCA into Decision Tree, prediction not finished
#code adapted from https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/

library(caret)
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(ISLR)
library(tree)
library(dplyr)


TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv")  #TCD aka Telco Data Churn
df_TCD = data.frame(TCD) #Putting into data frame

#Assigning Yes as default and No if the value is there and adding column
df_TCD$SeniorYN <- 'Yes'
df_TCD$SeniorYN[df_TCD$SeniorCitizen == 0] <-'No' 
#removing Senior 1,0 and removing Phone Svc always set to Yes
df_TCD  <- df_TCD[-c(1,3,7)]  #needed to run only 1 time, custid is issue, and other 2 not needed
df_TCD$SeniorYN <- as.factor(df_TCD$SeniorYN)

#Prep data for PCA
df_TCD <- dummy.data.frame(df_TCD, names= c("gender","MaritalStatus","Dependents","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport",
                                               "StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","InternationalPlan","VoiceMailPlan","SeniorYN"))

set.seed(2)
index <- sample(1:nrow(df_TCD), size=0.2*nrow(df_TCD))
test <- df_TCD[index, ]
train <- df_TCD[-index, ]

# Build the model on raw data for a sanity check.
model <- rpart(Churn ~  ., method="class", data=train)    
pred <- predict(model, test, type="class")

# The confusion matrix below shows an accuracy of 0.932432
table(pred, predicted= test[, 56])

# Now do the PCA part for classification
pca <- prcomp(train[-56], scale.=T, center=T) # 

# "Fit" the test data into Z-space based on the loadings (or rotations) from the training.
test.zspace <- predict(pca, newdata=test)
pca.train.df <- as.data.frame(pca$x)

View(pca.train.df)

summary(pca.train.df)
summary(pca.train.df[1])

# Build the model on the PCs.
pca.model <- rpart(Churn ~ ., method="class", data=pca.train.df)

