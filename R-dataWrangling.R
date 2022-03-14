library("dplyr")
library("tidyr")
library("caret")
library("magrittr")
library("lmtest")
library("popbio")
library("e1071")

## Recoding winner column to numeric for stepwise regression

chess$winnerR <- NA
chess$winnerR[chess$winner=='white'] <- 1
chess$winnerR[chess$winner=='black'] <- 2
chess$winnerR[chess$winner=='draw'] <- 3

## Subsetting data for stepwise regression to make it use less memory.

keeps <- c("winnerR", "turns", "victory_status", "white_rating", "black_rating", "opening_eco")
chess1 <- chess[keeps]

