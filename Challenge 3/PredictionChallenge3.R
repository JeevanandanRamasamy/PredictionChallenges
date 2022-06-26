library(ModelMetrics)

# Exploring the data
training <- read.csv('Earnings_Train2022-1.csv')
plot(Earnings ~ GPA, data = training)
plot(Earnings ~ Number_Of_Professional_Connections, data = training)
plot(Earnings ~ Graduation_Year, data = training[training$Major == 'Buisness', ])

# Training the model
pred <- rep(0, nrow(training))

business.model.even <- lm(Earnings ~ GPA, data = training[training$Major == 
                          'Buisness' & training$Graduation_Year %% 2 == 0, ])
business.pred.even <- predict(business.model.even, newdata = 
                              training[training$Major == 'Buisness' 
                              & training$Graduation_Year %% 2 == 0, ])
pred[training$Major == 'Buisness' & training$Graduation_Year %% 2 == 0] <- 
          business.pred.even
business.model.odd <- lm(Earnings ~ GPA, data = training[training$Major == 
                         'Buisness' & training$Graduation_Year %% 2 != 0, ])
business.pred.odd <- predict(business.model.odd, newdata = 
                             training[training$Major == 'Buisness' 
                             & training$Graduation_Year %% 2 != 0, ])
pred[training$Major == 'Buisness' & training$Graduation_Year %% 2 != 0] <- 
          business.pred.odd

humanities.model <- lm(Earnings ~ GPA, data = training[training$Major == 'Humanities', ])
humanities.pred <- predict(humanities.model, newdata = 
                           training[training$Major == 'Humanities', ])
pred[training$Major == 'Humanities'] <- humanities.pred

training$Number_Of_Professional_Connections2 <- training$Number_Of_Professional_Connections^2
other.model <- lm(Earnings ~ Number_Of_Professional_Connections2, 
                  data = training[training$Major == 'Other', ])
other.pred <- predict(other.model, newdata = training[training$Major == 'Other', ])
pred[training$Major == 'Other'] <- other.pred

professional.model <- lm(Earnings ~ GPA, 
                         data = training[training$Major == 'Professional', ])
professional.pred <- predict(professional.model, newdata = 
                             training[training$Major == 'Professional', ])
pred[training$Major == 'Professional'] <- professional.pred

stem.model <- lm(Earnings ~ GPA, data = training[training$Major == 'STEM', ])
stem.pred <- predict(stem.model, newdata = training[training$Major == 'STEM', ])
pred[training$Major == 'STEM'] <- stem.pred

vocational.model <- lm(Earnings ~ GPA, data = training[training$Major == 'Vocational', ])
vocational.pred <- predict(vocational.model, newdata = 
                           training[training$Major == 'Vocational', ])
pred[training$Major == 'Vocational'] <- vocational.pred

mse(training$Earnings, pred)

# Applying the model to the testing data
testing <- read.csv('Earnings_Test_Students-1.csv')
testing$Number_Of_Professional_Connections2 <- testing$Number_Of_Professional_Connections^2
submission <- read.csv('earning_submission.csv')

submission[testing$Major == 'Buisness' & testing$Graduation_Year %% 2 == 0, ]$Earnings <- 
          predict(business.model.even, newdata = testing[testing$Major == 'Buisness' 
          & testing$Graduation_Year %% 2 == 0, ])
submission[testing$Major == 'Buisness' & testing$Graduation_Year %% 2 != 0, ]$Earnings <- 
          predict(business.model.odd, newdata = testing[testing$Major == 'Buisness' 
          & testing$Graduation_Year %% 2 != 0, ])
submission[testing$Major == 'Humanities', ]$Earnings <- predict(humanities.model, 
          newdata = testing[testing$Major == 'Humanities', ])
submission[testing$Major == 'Other', ]$Earnings <- predict(other.model, 
          newdata = testing[testing$Major == 'Other', ])
submission[testing$Major == 'Professional', ]$Earnings <- predict(professional.model, 
          newdata = testing[testing$Major == 'Professional', ])
submission[testing$Major == 'STEM', ]$Earnings <- predict(stem.model, 
           newdata = testing[testing$Major == 'STEM', ])
submission[testing$Major == 'Vocational', ]$Earnings <- predict(vocational.model, 
           newdata = testing[testing$Major == 'Vocational', ])

write.csv(submission, 'earning_submission.csv', row.names = FALSE)
