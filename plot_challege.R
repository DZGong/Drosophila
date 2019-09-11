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
lines(density(rpois(100, lambda['spider'])), col=4)
legend(1, 1, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)

###Plot for sowbug
sowbug <- apply(data1, 1, function(x) rep(x[1], x[3])) %>% unlist()
hist(sowbug, freq = F, main = 'Distribution of sowbug')
lines(density(sowbug), col="red")
lines(density(rpois(100, lambda['sowbug'])), col=4)
legend(8, 0.2, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)

###Plot for weevil
weevil <- apply(data2, 1, function(x) rep(x[1], x[2])) %>% unlist()
hist(weevil, freq = F, main = 'Distribution of weevil')
lines(density(weevil), col="red")
lines(density(rpois(100, lambda['weevil'])), col=4)
legend(0.3, 4, legend=c('Data', 'Poisson'), col=c(2, 4), lty=1)
