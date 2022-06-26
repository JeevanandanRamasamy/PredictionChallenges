install.packages("devtools") 
devtools::install_github("devanshagr/CrossValidation")
library(rpart)
library(rpart.plot)
training <- read.csv('train.csv')

# Training the model using the training data
CS.Fresh.tree <- rpart(Grade ~ Score, data = 
                       training[training$Seniority == 'Freshman' 
                       & training$Major == 'CS', ],
                       control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority == 'Freshman' 
                                & training$Major == 'CS', ], CS.Fresh.tree, 100, 0.7)
CS.Fresh.tree
Eco.Fresh.tree <- rpart(Grade ~ Score, data = 
                        training[training$Seniority == 'Freshman' 
                        & training$Major == 'Economics', ],
                        control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority == 'Freshman' 
                                & training$Major == 'Economics', ], Eco.Fresh.tree, 100, 0.7)
Eco.Fresh.tree
Psy.Fresh.tree <- rpart(Grade ~ Score, data = 
                        training[training$Seniority == 'Freshman' 
                        & training$Major == 'Psychology', ],
                        control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority == 'Freshman' 
                                & training$Major == 'Psychology', ], Psy.Fresh.tree, 100, 0.7)
Psy.Fresh.tree
Stat.Fresh.tree <- rpart(Grade ~ Score, data = 
                         training[training$Seniority == 'Freshman' 
                         & training$Major == 'Statistics', ],
                         control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority == 'Freshman' 
                                & training$Major == 'Statistics', ], Stat.Fresh.tree, 100, 0.7)
Stat.Fresh.tree
CS.Other.tree <- rpart(Grade ~ Score, data = 
                       training[training$Seniority != 'Freshman' 
                       & training$Major == 'CS', ],
                       control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority != 'Freshman' 
                                & training$Major == 'CS', ], CS.Other.tree, 100, 0.7)
CS.Other.tree
Eco.Other.tree <- rpart(Grade ~ Score, data = 
                        training[training$Seniority != 'Freshman' 
                        & training$Major == 'Economics', ],
                        control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority != 'Freshman' 
                                & training$Major == 'Economics', ], Eco.Other.tree, 100, 0.7)
Eco.Other.tree
Psy.Other.tree <- rpart(Grade ~ Score, data = 
                        training[training$Seniority != 'Freshman' 
                        & training$Major == 'Psychology', ],
                        control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority != 'Freshman' 
                                & training$Major == 'Psychology', ], Psy.Other.tree, 100, 0.7)
Psy.Other.tree
Stat.Other.tree <- rpart(Grade ~ Score, data = 
                         training[training$Seniority != 'Freshman' 
                         & training$Major == 'Statistics', ],
                         control = rpart.control(minbucket = 2, cp = 0.01))
CrossValidation::cross_validate(training[training$Seniority != 'Freshman' 
                                & training$Major == 'Statistics', ], Stat.Other.tree, 100, 0.7)
Stat.Other.tree

# Applying the model to the testing data
testing <- read.csv('test.csv')
submission <- read.csv('submission.csv')
submission[testing$Seniority == 'Freshman' & testing$Major == 'CS', ]$Grade <- 
          as.character(predict(CS.Fresh.tree, type = 'class',
          newdata = testing[testing$Seniority == 'Freshman' & testing$Major == 'CS', ]))
submission[testing$Seniority == 'Freshman' & testing$Major == 'Economics', ]$Grade <- 
          as.character(predict(Eco.Fresh.tree, type = 'class',
          newdata = testing[testing$Seniority == 'Freshman' & testing$Major == 'Economics', ]))
submission[testing$Seniority == 'Freshman' & testing$Major == 'Psychology', ]$Grade <- 
          as.character(predict(Psy.Fresh.tree, type = 'class',
          newdata = testing[testing$Seniority == 'Freshman' & testing$Major == 'Psychology', ]))
submission[testing$Seniority == 'Freshman' & testing$Major == 'Statistics', ]$Grade <- 
          as.character(predict(Stat.Fresh.tree, type = 'class',
          newdata = testing[testing$Seniority == 'Freshman' & testing$Major == 'Statistics', ]))
submission[testing$Seniority != 'Freshman' & testing$Major == 'CS', ]$Grade <- 
          as.character(predict(CS.Other.tree, type = 'class',
          newdata = testing[testing$Seniority != 'Freshman' & testing$Major == 'CS', ]))
submission[testing$Seniority != 'Freshman' & testing$Major == 'Economics', ]$Grade <- 
          as.character(predict(Eco.Other.tree, type = 'class',
          newdata = testing[testing$Seniority != 'Freshman' & testing$Major == 'Economics', ]))
submission[testing$Seniority != 'Freshman' & testing$Major == 'Psychology', ]$Grade <- 
          as.character(predict(Psy.Other.tree, type = 'class',
          newdata = testing[testing$Seniority != 'Freshman' & testing$Major == 'Psychology', ]))
submission[testing$Seniority != 'Freshman' & testing$Major == 'Statistics', ]$Grade <- 
          as.character(predict(Stat.Other.tree, type = 'class',
          newdata = testing[testing$Seniority != 'Freshman' & testing$Major == 'Statistics', ]))
write.csv(submission, 'submission.csv', row.names = FALSE)
