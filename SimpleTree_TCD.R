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


TCD <- read.csv("C:/Users/mdegra200/Documents/P2/TCD.csv") #reading the data from the Telco churn data set
df_TCD_thin = data.frame(TCD) #Putting into data frame

head(df_TCD_thin) #Displaying first records records 

attach(df_TCD_thin)  #attaching to data

hist(SeniorCitizen) #part of the EDA but shows histogram of the data elemen
summary(df_TCD_thin) #shows result summaries of the data frame
str(df_TCD_thin) #shows the structure of the data frame
names(df_TCD_thin)#shows friendly names of the data frame

#modifying Senior to Y/N
#Assigning Yes as default and No if the value is there and adding column
df_TCD_thin$SeniorYN <- 'Yes'
df_TCD_thin$SeniorYN[df_TCD_thin$SeniorCitizen == 0] <-'No' 
df_tst = data.frame(df_TCD_thin$SeniorCitizen,df_TCD_thin$SeniorYN)
df_tst #confirmed that it worked
str(df_TCD_thin) # SeniorYN: chr  "No" "No" "No" "Yes" ...

#removing Senior 1,0 and removing Phone Svc always set to Yes
df_TCD_thin[1] #testing postion 1 so I don't delete wrong columns (3 and 7)
#df_TCD_thin  <- df_TCD_thin[-c(3,7)]  #needed to run only 1 time
str(df_TCD_thin)

#setting up rpart - recursive partitioning, only using the factors for this simple tree
fit <- rpart(Churn ~  df_TCD_thin$gender+df_TCD_thin$MaritalStatus+df_TCD_thin$Dependents+df_TCD_thin$MultipleLines+df_TCD_thin$InternetService+df_TCD_thin$OnlineSecurity+df_TCD_thin$OnlineBackup+df_TCD_thin$DeviceProtection+df_TCD_thin$TechSupport+df_TCD_thin$StreamingTV+df_TCD_thin$StreamingMovies+df_TCD_thin$Contract+df_TCD_thin$PaperlessBilling+df_TCD_thin$PaymentMethod+df_TCD_thin$InternationalPlan+df_TCD_thin$VoiceMailPlan,data=df_TCD_thin, method="class")
plot(fit)
text(fit) #displaying my simple tree


#Pros and cons of the simlple tree?

#testing with Y/N SR
fit <- rpart(Churn ~  df_TCD_thin$SeniorYN+df_TCD_thin$gender+df_TCD_thin$MaritalStatus+df_TCD_thin$Dependents+df_TCD_thin$MultipleLines+df_TCD_thin$InternetService+df_TCD_thin$OnlineSecurity+df_TCD_thin$OnlineBackup+df_TCD_thin$DeviceProtection+df_TCD_thin$TechSupport+df_TCD_thin$StreamingTV+df_TCD_thin$StreamingMovies+df_TCD_thin$Contract+df_TCD_thin$PaperlessBilling+df_TCD_thin$PaymentMethod+df_TCD_thin$InternationalPlan+df_TCD_thin$VoiceMailPlan,data=df_TCD_thin, method="class")
plot(fit)
text(fit) #displaying my simple tree

#Senior plus gender, and others, removed contract
fit1<- rpart(Churn ~  df_TCD_thin$SeniorYN+df_TCD_thin$gender+df_TCD_thin$MaritalStatus+df_TCD_thin$MultipleLines+df_TCD_thin$InternetService+df_TCD_thin$OnlineSecurity+df_TCD_thin$OnlineBackup+df_TCD_thin$DeviceProtection+df_TCD_thin$TechSupport+df_TCD_thin$StreamingTV+df_TCD_thin$StreamingMovies+df_TCD_thin$PaperlessBilling+df_TCD_thin$PaymentMethod+df_TCD_thin$InternationalPlan+df_TCD_thin$VoiceMailPlan,data=df_TCD_thin, method="class")
plot(fit1)
text(fit1) #displaying my simple tree
#Would this indicate without contract that tech supportis next most important variable

fit_all <- rpart(Churn ~ SeniorYN+gender+MaritalStatus+Dependents+tenure+PhoneService+MultipleLines+InternetService+OnlineSecurity+OnlineBackup+DeviceProtection+TechSupport+StreamingTV+StreamingMovies+Contract+PaperlessBilling+PaymentMethod+InternationalPlan+VoiceMailPlan+NumbervMailMessages+TotalDayMinutes+TotalDayCalls+TotalEveMinutes+TotalEveCalls+TotalNightMinutes+TotalNightCalls+TotalIntlMinutes+TotalIntlCalls+CustomerServiceCalls+TotalCall+TotalRevenue,data=df_TCD_thin, method="class")
plot(fit_all)
text(fit_all) #displaying my simple tree



#much more detailed graphic
fancyRpartPlot(fit_all)
fancyRpartPlot(fit1)


#Looking at the simple model predicts
Prediction <- predict(fit, type = "class")
summary(Prediction)
summary(df_TCD$Churn) #The predictor only predicted churn of 150, actual data has 483 churned, not so good

#Even less churned when I took out the Contract which previous tree was using
Prediction <- predict(fit1, type = "class")
summary(Prediction)
summary(df_TCD$Churn) #The predictor only predicted churn of 150, actual data has 483 churned, not so good

#using all data observations
Prediction_all <- predict(fit_all, type = "class")
summary(Prediction_all)
summary(df_TCD$Churn) #The predictor all predicted churn of 378, actual data has 483 churned, better than subset

prp(fit)  #simple decision tree output with prp which is part of rpart
prp(fit,type=2,extra="auto",nn = TRUE,branch=1,varlen=0,yesno=2) #with much more detail


#scoring? 
fit_all
rsq.rpart(fit_all) #major improvements end after 7 splits
printcp(fit_all)
plotcp(fit_all,upper="splits")  #lowest cross validation error 0.39545
summary(fit_all)



