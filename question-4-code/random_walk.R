#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

set.seed(141)

random_walk  <- function (n_steps) {
  # Create an empty dataframe for time, x and y containing (n_steps) rows
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  # Set the starting point as 0,0 for t = 1
  df[1,] <- c(0,0,1)
  # For loop describing each time point
  for (i in 2:n_steps) {
    # Select how far to travel each step
    h <- abs(rnorm(1, mean = 0, sd = 1))
    # Pick a random angle from a uniform distribution (0 points right, higher values go anticlockwise)
    angle <- runif(1, min = 0, max = 2*pi)
    # Movement in x (previous x value + cosine)
    df[i,1] <- df[i-1,1] + cos(angle)*h
    # Movement in y (previous y value + sine)
    df[i,2] <- df[i-1,2] + sin(angle)*h
    # Set current time to current time (in case it's changed?)
    df[i,3] <- i
    
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

# First walk distance and angle
sqrt(data1[500,2]^2+data1[500,1]^2)
atan(data1[500,2]/data1[500,1]) + 2*pi

# Second walk distance and angle
sqrt(data2[500,2]^2+data2[500,1]^2)
atan(data2[500,2]/data2[500,1]) + pi

