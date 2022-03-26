library("dplyr")
library("tidyr")
library("caret")
library("magrittr")
library("lmtest")
library("popbio")
library("e1071")

## Recoding winner column to numeric

chess$winnerR <- NA
chess$winnerR[chess$winner=='white'] <- 1
chess$winnerR[chess$winner=='black'] <- 2
chess$winnerR[chess$winner=='draw'] <- 3

## Subsetting data to make it use less memory. First will drop all columns 
## that I don't believe influence winner

keeps <- c("winnerR", "turns", "victory_status", "white_rating", "black_rating", "opening_eco")
chess1 <- chess[keeps]

FitAll = lm(winnerR ~ ., data = chess1)
summary(FitAll)

## These variables are significant predictors of the winner, according to this
## model. Approximately 39% of the variance in winner is explained by them. 


 ## Backward elimination

step(FitAll, direction = 'backward')

## AIC is lowest with dropping the opening_eco, and keeping the remaining variables

fitsome = lm(winnerR ~ turns + victory_status + white_rating + black_rating, data = chess1)
summary(fitsome)

## Interested to see whether player ID has a significant effect. 
## First, keeping only first 25% of rows as dataset is too large as is

chess6 <- chess[1:500,]
##Creating a subset that includes player id

keeps2 <- c("winnerR", "turns", "white_rating", "black_rating", "white_id", "black_id")
chess7 <- chess6[keeps2]

FitAll3 = lm(winnerR ~ ., data = chess7)
summary(FitAll3)


step(FitAll3, direction = 'backward')



