chess$winnerR <- NA
chess$winnerR[chess$winner=='white'] <- 1
chess$winnerR[chess$winner=='black'] <- 2
chess$winnerR[chess$winner=='draw'] <- 3

chess$resultR <- NA
chess$resultR[chess$victory_status=='resign'] <- 1
chess$resultR[chess$victory_status=='mate'] <- 2
chess$resultR[chess$victory_status=='draw'] <- 3
chess$resultR[chess$victory_status=='outoftime'] <- 4

keeps <- c("winnerR", "turns", "resultR", "white_rating", "black_rating")
chess1 <- chess[keeps]

names(chess1)[names(chess1) == "black_rating"] <- "Black Rating"
names(chess1)[names(chess1) == "white_rating"] <- "White Rating"
names(chess1)[names(chess1) == "resultR"] <- "Result"
names(chess1)[names(chess1) == "turns"] <- "Number of Turns"
names(chess1)[names(chess1) == "winnerR"] <- "Winner"

cor(chess1)
install.packages("corrplot")                  
library("corrplot")    

corrplot(cor(chess1), method = "circle") 

install.packages("ggcorrplot")                     
library("ggcorrplot") 


ggcorrplot(cor(chess1)) 
corrplot(abs(cor(chess1)), method="color", tl.pos="n",
         col= colorRampPalette(c("white","lightpink", "red","brown"))(10))

corrplot(abs(cor(chess1)), method="color", tl.pos="n", 
         cl.lim=c(0,1), col=colorRampPalette(c("blue","white","red"))(200))

chess2 = cor(chess1)

ggcorrplot(chess2, hc.order = FALSE, type = "lower",
           outline.col = "white",
           ggtheme = ggplot2::theme_gray,
           colors = c("#B42E32", "white", "#F1C0AC"),
           lab = TRUE, lab_size = 7, show.diag=FALSE,
           legend.title = "Correlation", tl.cex=8)


