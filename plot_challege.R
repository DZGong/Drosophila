set.seed(1)
setwd("~/Desktop/QBio Bootcamp/BSD-QBio5/tutorials/reproducibility/data")
library(ggplot2)
data1 <- read.csv('cole_arthropod_data_1946.csv', header=T)
data2 <- read.csv("mitchell_weevil_egg_data_1975.csv", header=T)
##Q1 Poisson distribution for spider
library(ggplot2)
lambda <- apply(data1, 2, function(x) sum(x*data1[, 1])/sum(x))[-1]
names(lambda) <- c('spider', 'sowbug')
lambda['spider']

spider_poisson <- dpois(x=0:17, lambda['spider'])
sum_spider = sum(data1$C_count_of_boards_with_k_spiders)

p_spider <- ggplot(data1,aes(x=k_number_of_arthropods))
p_spider <- p_spider + geom_line(aes(y=spider_poisson),color="red") + 
  geom_point(aes(y=C_count_of_boards_with_k_spiders/sum_spider),color="blue")
p_spider 

##As we can see, the distribution of spiders is very close to a Poisson distribution
##which implies a random distribution of spiders.

#Q2 
lambda <- apply(data1, 2, function(x) sum(x*data1[, 1])/sum(x))[-2]
names(lambda) <- c("spider", "sowbug")
lambda["sowbug"]


sowbug_poisson <- dpois(x=0:17, lambda["sowbug"])
sum_sowbug <- sum(data1$C_count_of_boards_with_k_sowbugs)

p_sowbug <- ggplot(data1,aes(x=k_number_of_arthropods))
p_sowbug <- p_sowbug + geom_line(aes(y=sowbug_poisson),color="red") + 
  geom_point(aes(y=C_count_of_boards_with_k_sowbugs/sum_sowbug),color="blue")
p_sowbug

##As seen in calling p_sowbuyg, the distribution of sowbugs per board is not close to
##a Poisson distribution, suggesting a non-random distribution of sowbugs.

##Q4 LGP distribution for spider
install.packages("RMKdiscrete")
library(RMKdiscrete)
spider_LGP <- dLGP(x=0:17,theta=lambda['spider'],lambda=0)
p_spider2 <- p_spider + geom_line(aes(y=spider_LGP),color="green") 
p_spider2
##As λ2 = 0, the LGP distribution is completely the same as the original Poisson distribution
##the two lines completely overlap