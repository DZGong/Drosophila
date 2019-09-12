setwd("D:/2019 UChi/MBL/BSD-QBio5/tutorials/reproducibility/data")
library(tidyr)

set.seed(1)

data1 <- read.csv('cole_arthropod_data_1946.csv', header=T)
data2 <- read.csv('mitchell_weevil_egg_data_1975.csv', header=T)
lambda <- apply(data1, 2, function(x) sum(x*data1[, 1])/sum(x))[-1]
lambda <- c(lambda, apply(data2, 2, function(x) sum(x*data2[, 1])/sum(x))[-1])
names(lambda) <- c('spider', 'sowbug', 'weevil')

par(mfrow=c(1,1))
###Plot for spider
spider <- apply(data1, 1, function(x) rep(x[1], x[2])) %>% unlist()
hist(spider, freq = F, main = 'Distribution of spider')
lines(density(spider), col="red")
lines(density(rpois(colSums(data1)[2], lambda['spider'])), col=4)
legend(1, 1, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)

###Plot for sowbug
sowbug <- apply(data1, 1, function(x) rep(x[1], x[3])) %>% unlist()
hist(sowbug, freq = F, main = 'Distribution of sowbug')
lines(density(sowbug), col="red")
lines(density(rpois(colSums(data1)[3], lambda['sowbug'])), col=4)
legend(8, 0.2, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)

###Plot for weevil
weevil <- apply(data2, 1, function(x) rep(x[1], x[2])) %>% unlist()
hist(weevil, freq = F, main = 'Distribution of weevil')
lines(density(weevil), col="red")
lines(density(rpois(colSums(data2)[2], lambda['weevil'])), col=4)
legend(0.3, 4, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)

###Fangyuan's codes
set.seed(1)
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

##Q4 LGP distribution for spider
install.packages("RMKdiscrete")
library(RMKdiscrete)
spider_LGP <- dLGP(x=0:17,theta=lambda['spider'],lambda=0)
p_spider2 <- p_spider + geom_line(aes(y=spider_LGP),color="green") 
p_spider2
##As λ2 = 0, the LGP distribution is completely the same as the original Poisson distribution
##the two lines completely overlap
