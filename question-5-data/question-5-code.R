library(ggplot2)
#importing data 
viral_data <- read.csv("question-5-data/Cui_etal2014.csv")

#part a 
head(viral_data)
str(viral_data)
#33 observations (rows)
#13 variables (columns)

#part b
#applying a log transformation
viral_data$log.volume <- log(viral_data$Virion.volume..nm.nm.nm.)
viral_data$log.length <- log(viral_data$Genome.length..kb.)

#part c
#fitting a linear regression
viral_regression <- lm(log.volume ~ log.length, data = viral_data)
#find the exponent (beta) and scaling factor (alpha) 
summary(viral_regression)
#intercept estimate (alpha) = 7.0748
exp(7.0748) #alpha = 1181.807
#log.length estimate (i.e. slope/ beta) = 1.5142

#part d - reproducing the figure
ggplot(viral_data, aes(x=log.length, y=log.volume)) + 
  geom_point() +
  geom_smooth(method='lm') +
  xlab("log [Genome length (kb)]") +
  ylab("log [Virion volume (nm3)]") +
  theme_bw() +
  theme(text = element_text(face= "bold"),)

#part e
estimate_input <- data.frame(log.length = log(300))
predict(viral_regression, estimate_input)
#15.71733
exp(15.71733)
#6698070 nm3 