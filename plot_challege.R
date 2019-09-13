set.seed(1)
#remember to set your working directory according to where you have folder with the data
setwd("~/Downloads/BSD-QBio5/tutorials/reproducibility/data")
data1 <- read.csv('cole_arthropod_data_1946.csv', header=T)

##Q1 Poisson distribution for spider
library(ggplot2)
lambda <- apply(data1, 2, function(x) sum(x*data1[, 1])/sum(x))[-1]
names(lambda) <- c('spider')
lambda['spider']

spider_poisson <- dpois(x=0:17, lambda['spider'])
sum_spider = sum(data1$C_count_of_boards_with_k_spiders)

p_spider <- ggplot(data1,aes(x=k_number_of_arthropods))
p_spider <- p_spider + geom_line(aes(y=spider_poisson),color="red") + 
  geom_point(aes(y=C_count_of_boards_with_k_spiders/sum_spider),color="blue")
p_spider 
##As we can see, the distribution of spiders is very close to a Poisson distribution
##which implies a random distribution of spiders.

## Q3 Poisson distribution for weevil ##
weevil_data <- read.csv('mitchell_weevil_egg_data_1975.csv', header=T)
weevil_data$bean_number_per_egg <- weevil_data$k_number_of_eggs*weevil_data$C_count_of_beans_with_k_eggs
lambda <- sum(weevil_data$bean_number_per_egg)/sum(weevil_data$C_count_of_beans_with_k_eggs)
nrow(weevil_data)
names(weevil_data)
weevil_poisson <- dpois(x=0:4, lambda)
sum_weevil <- sum(weevil_data$C_count_of_beans_with_k_eggs)
p_weevil_egg <- ggplot(weevil_data, aes(x = k_number_of_eggs)) + 
  geom_line(aes(y = weevil_poisson), color = "yellow3") +
  geom_point(aes(y = C_count_of_beans_with_k_eggs/sum_weevil), color = "navy") +
  theme_classic()
print(p_weevil_egg)

##Q4 LGP distribution for spider
install.packages("RMKdiscrete")
library(RMKdiscrete)
spider_LGP <- dLGP(x=0:17,theta=lambda['spider'],lambda=0)
p_spider2 <- p_spider + geom_line(aes(y=spider_LGP),color="green") 
p_spider2
##As λ2 = 0, the LGP distribution is completely the same as the original Poisson distribution
##the two lines completely overlap
