#Telco Churn Data Science project tree_model
#code adapted from https://rpubs.com/SANPANDE/221595
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
str(df_TCD) # SeniorYN: chr  "No" "No" "No" "Yes" ...
df_TCD$SeniorYN <- as.factor(df_TCD$SeniorYN)

#removing Senior 1,0 and removing Phone Svc always set to Yes
df_TCD[1] #testing postion 1 so I don't delete wrong columns (3 and 7)
df_TCD  <- df_TCD[-c(1,3,7)]  #needed to run only 1 time, custid is issue, and other 2 not needed
str(df_TCD)

attach(df_TCD)

### Split data into testing and training
set.seed(2)
train <- sample(1:nrow(df_TCD), nrow(df_TCD)/2)
test_comp <- sample(1:nrow(df_TCD), nrow(df_TCD))
test <- test_comp[is.na(pmatch(test_comp,train))]
training_data = df_TCD[train,]
testing_data = df_TCD[test,]
testing_Churn =Churn[test]

# fit the tree model using training data
tree_model = tree(Churn~., training_data)

plot(tree_model) #plotting model
text(tree_model, pretty = 0) #adding text to plot
tree_model #looking at the model
summary(tree_model) #Summary of Tree

# check how the model is doing using the test data
tree_pred = predict(tree_model, testing_data, type = "class")
tree_pred

#confusion matrix
table(Churn[test], predicted= tree_pred)

#how often is the tree not matching
mean(tree_pred != testing_Churn)  #0.07318536 is that 7.3%



cv_tree = cv.tree(tree_model, FUN = prune.misclass) # produces deviance or cross validation error rate
names(cv_tree)

plot(cv_tree$size,
     cv_tree$dev, # deviance or error rate
     type = "b")

### prune the tree #after 9 no real variance
pruned_model = prune.misclass(tree_model, best = 9)
plot(pruned_model)
text(pruned_model)

### check how it is doing

tree_pred =  predict(pruned_model, testing_data, type = "class")
mean(tree_pred != testing_Churn) #misclassification error rate of 0.07138572
#pruning improved accuracy from .07318536 to .0718572 
#small improvment for this data set but might useful for large set
#Final result would model improvement to 92.8% accuracy from 92.6%




