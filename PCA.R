
#Telco Churn Data Science project PCA
#code adapted from https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/
library(dummies)

TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv")  #TCD aka Telco Data Churn
df_TCD = data.frame(TCD) #Putting into data frame


#removing custid,phonesvc always Y, dependent var Churn
df_TCD[33] #testing postion 1 so I don't delete wrong columns (3 and 7)
df_TCD  <- df_TCD[-c(1,7)]  #needed to run only 1 time, custid is issue, and other 7 not needed
str(df_TCD)


#change the categorical vars to numeric
df_TCD_PC <- dummy.data.frame(df_TCD, names= c("gender","MaritalStatus","Dependents","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport",
                                                  "StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","InternationalPlan","VoiceMailPlan","SeniorYN"))


attach(df_TCD)
str(df_TCD_PC[57])
names(df_TCD_PC)

### Split data into testing and training
set.seed(2)
train <- sample(1:nrow(df_TCD_PC), nrow(df_TCD_PC)/2)
test_comp <- sample(1:nrow(df_TCD_PC), nrow(df_TCD_PC))
test <- test_comp[is.na(pmatch(test_comp,train))]
training_data = df_TCD_PC[train,]
testing_data = df_TCD_PC[test,]
testing_Churn =Churn[test]



str(training_data[57]) #checking for Churn var
#PCA model  scale. = T, normalizes the variables to have standard deviation equals to 1
#- removes the dependent var 51 is churn
prin_comp <- prcomp(training_data[-57], scale. = T)  
#prin_comp <- prcomp(training_data, scale. = T)  
names(prin_comp)


#outputs the mean of variables
prin_comp$center

#outputs the standard deviation of variables
prin_comp$scale


prin_comp$rotation[1:5,1:4]  #showing 5x4
prin_comp$rotation[1:20,1:4] #showing 20x4

dim(prin_comp$x) #score vectors 1666x57 dimension

biplot(prin_comp, scale = 0) #plotting

#compute standard deviation of each principal component
std_dev <- prin_comp$sdev

#compute variance
pr_var <- std_dev^2

#check variance of first 10 components
pr_var[1:10]


#proportion of variance explained
prop_varex <- pr_var/sum(pr_var)
prop_varex[1:20]

#scree plot
plot(prop_varex, xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     type = "b")

#cumulative scree plot
plot(cumsum(prop_varex), xlab = "Principal Component",
       ylab = "Cumulative Proportion of Variance Explained",
       type = "b")

head(train)

# Build the model on raw data for a sanity check.
model <- rpart(Churn ~  ., method="class", data=train)    
pred <- predict(model, test, type="class")

# The confusion matrix below shows an accuracy of 0.932432
table(pred, predicted= test[, 56])

