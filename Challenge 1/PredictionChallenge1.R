training <- read.csv('train.csv')

# Exploring Data
colors <- c('dodgerblue2', 'seagreen3', 'gold', 'darkorange', 'firebrick2', 'darkorchid')
boxplot(training$Score~training$Grade, col = colors, xlab = 'Grade', ylab = 'Score',
        main = 'Boxplot of Grade vs Score')
mosaicplot(training$Major~training$Grade, col = colors, xlab = 'Major', ylab = 'Grade',
           main = 'Mosaicplot of Grade vs Major')
mosaicplot(training$Seniority~training$Grade, col = colors, xlab = 'Seniority', ylab = 'Grade',
           main = 'Mosaicplot of Grade vs Seniority')

# Applying Prediction Model to Training Data
myprediction <- training
decision <- rep('F', nrow(myprediction))
decision[myprediction$Seniority == 'Freshman'] <- 'D'
decision[myprediction$Seniority == 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 50)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 41)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 31)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 47))] <- 'C'
decision[myprediction$Seniority == 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 60)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 51)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 41)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 56))] <- 'B'
decision[myprediction$Seniority == 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 81)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 62)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 57)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 76))] <- 'A'
decision[myprediction$Seniority != 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 51)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 41)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 31)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 46))] <- 'D'
decision[myprediction$Seniority != 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 61)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 51)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 41)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 55))] <- 'C'
decision[myprediction$Seniority != 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 81)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 66)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 57)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 76))] <- 'B'
decision[myprediction$Seniority != 'Freshman' & ((myprediction$Major == 'CS' & myprediction$Score >= 91)
                                                 | (myprediction$Major == 'Economics' & myprediction$Score >= 81)
                                                 | (myprediction$Major == 'Psychology' & myprediction$Score >= 71)
                                                 | (myprediction$Major == 'Statistics' & myprediction$Score >= 87))] <- 'A'
myprediction$Grade <- decision
error <- mean(training$Grade != myprediction$Grade)
error

# Applying Prediction Model to Testing Data for Submission
testing <- read.csv('test.csv')
submission <- read.csv('submission.csv')
decision <- rep('F', nrow(testing))
decision[testing$Seniority == 'Freshman'] <- 'D'
decision[testing$Seniority == 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 50)
                                            | (testing$Major == 'Economics' & testing$Score >= 41)
                                            | (testing$Major == 'Psychology' & testing$Score >= 31)
                                            | (testing$Major == 'Statistics' & testing$Score >= 47))] <- 'C'
decision[testing$Seniority == 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 60)
                                            | (testing$Major == 'Economics' & testing$Score >= 51)
                                            | (testing$Major == 'Psychology' & testing$Score >= 41)
                                            | (testing$Major == 'Statistics' & testing$Score >= 56))] <- 'B'
decision[testing$Seniority == 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 81)
                                            | (testing$Major == 'Economics' & testing$Score >= 62)
                                            | (testing$Major == 'Psychology' & testing$Score >= 57)
                                            | (testing$Major == 'Statistics' & testing$Score >= 76))] <- 'A'
decision[testing$Seniority != 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 51)
                                            | (testing$Major == 'Economics' & testing$Score >= 41)
                                            | (testing$Major == 'Psychology' & testing$Score >= 31)
                                            | (testing$Major == 'Statistics' & testing$Score >= 46))] <- 'D'
decision[testing$Seniority != 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 61)
                                            | (testing$Major == 'Economics' & testing$Score >= 51)
                                            | (testing$Major == 'Psychology' & testing$Score >= 41)
                                            | (testing$Major == 'Statistics' & testing$Score >= 55))] <- 'C'
decision[testing$Seniority != 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 81)
                                            | (testing$Major == 'Economics' & testing$Score >= 66)
                                            | (testing$Major == 'Psychology' & testing$Score >= 57)
                                            | (testing$Major == 'Statistics' & testing$Score >= 76))] <- 'B'
decision[testing$Seniority != 'Freshman' & ((testing$Major == 'CS' & testing$Score >= 91)
                                            | (testing$Major == 'Economics' & testing$Score >= 81)
                                            | (testing$Major == 'Psychology' & testing$Score >= 71)
                                            | (testing$Major == 'Statistics' & testing$Score >= 87))] <- 'A'
submission$Grade <- decision
write.csv(submission, 'submission.csv', row.names = FALSE)
