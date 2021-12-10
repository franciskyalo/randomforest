---------- about project -------------------
  
  # in this project we will use a random forest algorithm to predict**
  #** species in the iris data set
  
  # -------------- data-----------------------

data("iris")

summary(iris)

table(iris$Species)

# ----------model------------------------

# splitting data into training and testing

set.seed(123)

split <- sample(2, nrow(iris), replace = T, prob = c(0.8,0.2))

train <- iris[split==1,]

test <-iris[split==2,]

# train model using training set

library(randomForest)

rf.iris <- randomForest(Species ~ ., data = train,
                        mtry=4, ntree=15, importance=T)

rf.iris

#variable importance

importance(rf.iris)

varImpPlot(rf.iris)

# -------------- predicting using test data -------------

# evaluating model performance using test data

pred <- predict(rf.iris, test)

confusionmatrix <- table(pred, test$Species)

confusionmatrix
