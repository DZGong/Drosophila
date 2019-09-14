This is a repository of code written by the Drosophila group for the 2019 MBL bootcamp. 

The code intends to analyze and plot the distribution of 'cryptozoic' individuals in the woods and pastures of Kendall County, Illinois. 
The distribution of spiders, sowbugs, and weevil eggs are compared to Poisson distributions and Lagrangian Poisson Distributions (LGP) as a measure of random distribution. 

A random distribution expects a Poisson distribution, however over-dispersed distribution expects a better fit with an LGP lambda2 greather than zero, and a under-dispered distribution expects a better fit with an LGP lambda2 less than zero. 

The results are as follows-

Q1: Upon plotting, the distribution of spiders per board appears to be randomly distributed as the data follow the Poisson Distribution closely.

Q2: Upon plotting, the distribution of sowbugs per board does not appear to be randomly distributed as the data fails to closely follow the Poisson Distribution closely.

Q3: Upon plotting, the distribution of weevils per bean appears to be randomly distributed as the data follows the Poisson Distribution relatively closely, but not quite as tightly as observed in Q1.

Q4: Upon plotting the Lagrangian Poission Distributon with a λ1 = calculated mean of spiders per board and λ2 of 0 (as indicated on page 11 of the "Reproducibility" section of the QBio book),  the Lagrangian Poisson Distribution corroborates the indication of random distribution seen by plotting the Poisson Distribution in Q1.

Q5: Upon plotting the Lagrangian Poisson Distribution with λ1 = calculated mean of the sowbugs per board * (1-λ2) and λ2 = 0.53214for the deviation from expected the Poisson Dispersion (as indicated on page 11 of the "Reproducibility" section of the QBio book), the Lagrangian Poisson Distribution appears to be a slightly better fit to the data which failed to closely follow the Poisson Distribution in Q2, thus once again indicating that the distribution of sowbugs per board does not appear to be random.

Q6: Upon plotting the Lagrangian Poisson Distribution with λ1 = calculated mean of weevils per bean * (1-λ2) and λ2 = 0.1 as an eyeballed value of deviation from the Poisson Dispersion (as indicated on page 11 of the "Reproducibility" section of the QBio book), the Lagrangian Poisson Distribution corroborates the indication of a random distribution seen by plotting the Poisson Distribution in Q3. 

Important note: The value of λ2 in both Q5 and Q6 are greater than zero, suggesting that the sowbugs, and somewhat for the weevils, are over-dispersed and may be attracting greater numbers of individuals within environments (boards and beans) to cluster outside what would be expected by chance alone. 