#Loading Telco Churn data set from CSV https://www.kaggle.com/pangkw/telco-churn/version/3
#Code guidance from https://trevorstephens.com/kaggle-titanic-tutorial/r-part-3-decision-trees/

#Loading packages to improve the graphical representations of the tree
install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)


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

#testing and training
set.seed(2)
train <- sample(1:nrow(df_TCD), nrow(df_TCD)/2)
test_comp <- sample(1:nrow(df_TCD), nrow(df_TCD))
test <- test_comp[is.na(pmatch(test_comp,train))]
training_data = df_TCD[train,]
testing_data = df_TCD[test,]
testing_Churn =Churn[test]


#rpart decision tree
#I didn't setup test or training data, should I? ******
rpart_churn_tree <- rpart(Churn ~  .,data=testing_data, method="class")
plot(rpart_churn_tree)
text(rpart_churn_tree) #displaying my simple tree

#Pros and cons of the simlple tree?
#much more detailed graphic
fancyRpartPlot(rpart_churn_tree)

#Looking at the simple model predicts
Prediction <- predict(rpart_churn_tree, type = "class")
summary(Prediction) # predicting 2955 No, and 378 yes
summary(df_TCD$Churn) #Actuals 2850 No, 483 Yes

#Checking accuracy
rpart_tree_pred = predict(rpart_churn_tree, testing_data, type = "class")
mean(rpart_tree_pred != testing_Churn)  #0.04559088 is that 4.5% (rpart higher than other tree?)


#additional viz
prp(rpart_churn_tree)  #simple decision tree output with prp which is part of rpart
prp(rpart_churn_tree,type=2,extra="auto",nn = TRUE,branch=1,varlen=0,yesno=2) #with much more detail


#scoring? 
rpart_churn_tree
rsq.rpart(rpart_churn_tree) #major improvements end after 7 splits
printcp(rpart_churn_tree)
plotcp(rpart_churn_tree,upper="splits")  #lowest cross validation error 0.39545
summary(rpart_churn_tree)



