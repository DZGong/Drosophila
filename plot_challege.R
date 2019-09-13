set.seed(1)
##remember to set your working directory according to where you have folder with the data
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

##Q3 Poisson Distribution for Weevil 
library(ggplot2)
weevil_data <- read.csv("mitchell_weevil_egg_data_1975.csv", header=T)
weevil_data$bean_number_per_egg <- weevil_data$k_number_of_eggs*weevil_data$C_count_of_beans_with_k_eggs
lambda_weevil <- sum(weevil_data$bean_number_per_egg)/sum(weevil_data$C_count_of_beans_with_k_eggs)
nrow(weevil_data)
names(weevil_data)
weevil_poisson <- dpois(x=0:4, lambda_weevil)
sum_weevil <-sum(weevil_data$C_count_of_beans_with_k_eggs)
p_weevil_egg <- ggplot(weevil_data, aes(x = k_number_of_eggs))+
  geom_line(aes(y = weevil_poisson), color = "yellow3") +
  geom_point(aes(y = C_count_of_beans_with_k_eggs/sum_weevil), color = "navy")+
  theme_classic()
print(p_weevil_egg)
#As depicted, the data appears to follow the trend of a Poisson distribution
#suggesting a random distribution of weevils per bean

##Q4 LGP distribution for spider
install.packages("RMKdiscrete")
library(RMKdiscrete)
library(ggplot2)
spider_LGP <- dLGP(x=0:17,theta=lambda['spider'],lambda=0)
p_spider2 <- ggplot(data1,aes(x=k_number_of_arthropods))
p_spider2 <- p_spider2 + geom_line(aes(y=spider_LGP),color="green") 
p_spider2
##As λ2 = 0, the LGP distribution is completely the same as the original Poisson distribution
##the two lines completely overlap

##Q5 LGP distribution for sowbug
install.packages("RMKdiscrete")
library(RMKdiscrete)
library(ggplot2)                
sowbug_LGP <-dLGP(x=0:17,theta=lambda['sowbug'],lambda=0)

p_sowbug2 <- ggplot(data2, aes(x = k_number_of_arthropods))
p_sowbug2 <-p_sowbug2 + geom_line(aes(y=sowbug_LGP),color="green")
p_sowbug2

#Q6 distribution of weevil
install.packages("RMKdiscrete")
library(RMKdiscrete)
library(ggplot2)                
weevil_LGP <- dLGP(x=0:17, theta = lambda_weevil, lambda=0)
p_weevil_egg2 <- ggplot(weevil_data, aes(x = k_number_of_eggs)) 
p_weevil_egg2 <- p_weevil_egg2 + geom_line(aes(y=weevil_LGP),color = "green")
p_weevil_egg2



p_sowbug2
