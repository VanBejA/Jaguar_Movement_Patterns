#########
### Jaguar 02 - Movement patterns
### Vanesa Bejarano Alegre - vanesa.bejarano@gmail.com
### Feb 02, 2023
########
## Add information of percentage

library(dplyr)
library(MuMIn)
library(lme4)
library(tidyverse)
library(sjPlot)
library(lubridate)
library(usdm)
library(RVAideMemoire)
library(performance)
library(DHARMa)
library(glmmTMB)

#### function
##### Dispersion
dispersion_glmer <- function (modelglmer) 
{
  n <- length(resid(modelglmer))
  return(sqrt(sum(c(resid(modelglmer), modelglmer@u)^2)/n))
}


# Upload final data -------------------------------------------------------


Jag02_FinalData <- read.csv('F:/Jaguar02/01_Analysis_Methods/03_Output/jag_track2023_jan_26.csv', header = T, sep = ',', dec = '.', comment.char = '')




Jag02_FinalData_stat <- read.csv('F:/Jaguar02/01_Analysis_Methods/03_Output/jag_stat_track2023_jan_26.csv', header = T, sep = ',', dec = '.', comment.char = '')



# Ecoregions --------------------------------------------------------------

usdm::vifcor(Jag02_FinalData[, c(14:23)], th=0.7)
?

x <- cor(Jag02_FinalData[, c(14:23)], method="spearman")

levels(as.factor(Jag02_FinalData$id))



# Visits  -----------------------------------------------------------------


mod.visit9 <- glmmTMB(visits ~ scale(agro_patch) + scale(agro_dist) +
                        scale(forest_patch) + scale(forest_dist)+ 
                        scale(drainage_dist) + scale(aux_dist) + 
                        (1|id)+(1|region), data=Jag02_FinalData, 
                         family = t_family(link = "identity"))


ranef(mod.visit9)
simulateResiduals(fittedModel = mod.visit9, plot = T)

summary(mod.visit9)

plot_model(mod.visit9)
confint(mod.visit9)

# Spend time --------------------------------------------------------------
?vifcor

usdm::vifcor(Jag02_FinalData_stat[, c(11:20)], th=0.7)

y <- cor(Jag02_FinalData_stat[, c(11:20)], method="pearson")

mod.spend <- glmmTMB(timeInside ~ scale(agro_patch) + scale(agro_dist) + 
                       scale(forest_patch) + scale(forest_dist)+ 
                       scale(drainage_dist) + scale(aux_dist) + 
                       (1|id)+ (1|region), data=Jag02_FinalData_stat,
                     t_family(link = "identity"))



simulateResiduals(fittedModel = mod.spend, plot = T)


summary(mod.spend)

plot_model(mod.spend)
confint(mod.spend)


# Time Since last visit ---------------------------------------------------------


usdm::vifcor(Jag02_FinalData_stat[, c(11:20)])

mod.tslv <- glmmTMB(timeSinceLastVisit ~ scale(agro_patch) + 
                      scale(agro_dist) + scale(clumpy)+
                      scale(forest_patch) + scale(forest_dist)+
                      scale(drainage_dist) + scale(aux_dist) + 
                      (1|id) + (1|region), 
                    data=Jag02_FinalData_stat,
                    family = t_family(link = "identity"))



simulateResiduals(fittedModel = mod.tslv, plot = T)

summary(mod.tslv)

plot_model(mod.tslv) 

# Speed -------------------------------------------------------------------


mod.speed <- glmmTMB((speed*14400) ~ scale(agro_patch) + scale(agro_dist) +
                    scale(forest_patch) + scale(forest_dist)+
                    scale(drainage_dist) + scale(aux_dist) + 
                    (1|id)+ (1|region), data=Jag02_FinalData,
                    family = t_family(link = "identity"))

simulateResiduals(fittedModel = mod.speed, plot = T)
plot_model(mod.speed)
confint(mod.speed)
summary(mod.speed)
ranef(mod.speed)
