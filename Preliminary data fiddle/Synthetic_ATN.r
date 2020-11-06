############################################
# Synthetic ATN data
#
# Friday 6th Nov 2020
# This is to go into GitHub resource page
#
#

rm(list = ls())


# Although both are commonly used (total Tau and p-Tau)
# this article found an AUC of 0.834 for p-Tau
# in comparison with t-Tau (AUC 0.751).
# for this reason - we will use pTau

# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6218126/

library(ggplot2)
library(reshape2)
library(dplyr)
library(scatterplot3d) # <-- non interactive
library(rgl)

# Similar to ids.4 from Visualise_ATN.r code
# Here to generate synthetic data for
# mean.hippo
# centiloid & 
# CSF Tau

set.seed(5442452)

N = 600
# proportions set according to real data
no.AD = round(N*0.16)
no.AD

no.MCI = round(N*0.16)
no.MCI

no.HC = round(N*0.68)
no.HC

data<- data.frame(ID = 1:N,
                  Age = runif(N, min = 65, max = 95),
                  APOE = sample(c(0,1), size = N, 
                                replace = TRUE, prob = c(0.68, 0.32)),
          Diagnosis = c(rep("CN", no.HC), rep("MCI", no.MCI), rep("AD", no.AD)))

data$Hippo.mean <- c(rnorm(no.HC, mean = 2.94, sd = 0.28),
                     rnorm(no.MCI, mean = 2.75, sd = 0.38),
                     rnorm(no.AD, mean = 2.32, sd = 0.49))

data$Centiloid<-  c(rnorm(no.HC, mean = 21.26, sd = 33.35),
                    rnorm(no.MCI, mean = 51.42, sd = 48.1),
                    rnorm(no.AD, mean = 92.47, sd = 38.66))

data$CSF.tau<- c(rnorm(no.HC, mean = 51.6, sd = 20.9),
                 rnorm(no.MCI, mean = 62.4, sd = 28.2),
                 rnorm(no.AD, mean = 76.5, sd = 25.4))

summary(data$CSF.tau) # <-- this has to be positive
summary(data$Hippo.mean) # Yup all +ve
summary(data$Centiloid) # prefer to have centiloid value > -41.8

# Correct for large negative values
for(i in 1:N){
  
  # Correct CSF.Tau values
  while(data$CSF.tau[i] < 0){
    
    if(data$Diagnosis[i] == "CN"){
      data$CSF.tau[i]<- rnorm(1, mean = 51.6, sd = 20.9)
    }
    if(data$Diagnosis[i] == "MCI"){
      data$CSF.tau[i]<- rnorm(1, mean = 62.4, sd = 28.2)
    }
    if(data$Diagnosis[i] == "AD"){
      data$CSF.tau[i]<- rnorm(1, mean = 76.5, sd = 25.4)
    }
  }
  
  # Correct Centiloid values
  while(data$Centiloid[i] < -41.8){
    
    if(data$Diagnosis[i] == "CN"){
      data$Centiloid[i]<- rnorm(1, mean = 21.26, sd = 33.35)
    }
    if(data$Diagnosis[i] == "MCI"){
      data$Centiloid[i]<- rnorm(1, mean = 51.42, sd = 48.1)
    }
    if(data$Diagnosis[i] == "AD"){
      data$Centiloid[i]<- rnorm(1, mean = 92.47, sd = 38.66)
    }
  }
}

# check!
summary(data$CSF.tau) 
summary(data$Hippo.mean) 
summary(data$Centiloid) 

library(GGally)
# https://stackoverflow.com/questions/3735286/create-a-matrix-of-scatterplots-pairs-equivalent-in-ggplot2

x11()
ggpairs(data[, c(4:7)], aes(colour = Diagnosis, alpha = 0.4))



###
### 3D basic plot

library(rgl)

data<- mutate(data, col = ifelse(Diagnosis == "CN", "forestgreen",
                           ifelse(Diagnosis == "MCI", "orange",
                            ifelse(Diagnosis == "AD", "firebrick", NA))))

#x11()
rgl.open() # different scatter plot
plot3d(x=data$Hippo.mean,
       y=data$Centiloid,
       z=data$CSF.Tau,
       col = data$col, size=1, 
       type = "s",
       xlab = "CSF.Tau", ylab = "Hippo", zlab = "Centiloid")
