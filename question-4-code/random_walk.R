#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

random_walk  <- function (n_steps) {
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  set.seed(73) #sets random seed for whole of the for loop 
  #if set.seed was within the for loop, each iteration of the loop would give the same result
    #i.e every angle generated would be the same (i.e. determined by the same number in the pseudorandom sequence denoted by set.seed(73))
  #having set.seed outside of the loop means that the angles are drawn from the same pseudorandom sequence (so are reproducible), but do not have the same value for each iteration
  
  for (i in 2:n_steps) {
    
    h <- 0.25 
    
    angle <- runif(1, min = 0, max = 2*pi) #selects 1 random value between 0 and 360 to be angle
    
    df[i,1] <- df[i-1,1] + cos(angle)*h #determines x value, relative to x in last coordinate/ step 
    
    df[i,2] <- df[i-1,2] + sin(angle)*h #determines y value, relative to y in last coordinate/ step
    
    df[i,3] <- i #documents the current step, enables tracking & plotting of time of each step 
    
  }
  
  return(df)
  
}

data1 <- random_walk(500)

plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

data2 <- random_walk(500)

plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2)
