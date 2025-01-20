#########
### Jaguar 02 - Movement patterns
### Vanesa Bejarano Alegre - vanesa.bejarano@gmail.com
### Feb 02, 2023
########
## Final Model
library(dplyr)
library(MuMIn)
library(lme4)
library(tidyverse)
library(sjPlot)
library(lubridate)
library(ggplot2)
library(jtools)
library(ggstatsplot)

setwd("F:/Jaguar02/00_tables")

models <-  read.csv('Table_models_ctmm.csv', 
                    header = T, sep = ',', dec = '.', comment.char = '')

levels(as.factor(models$Variables))

names_variables <- c(
  `01_Forest patch` = "Forest patch",
  `02_Forest dist` = "Forest distance",
  `03_Drainage dist` = "Drainage distance",
  `04_Agriculture patch` = "Agriculture patches",
  `05_Agriculuture dist` = "Agriculture distance",
  `06_Auxiliar road dist` = "Aux road distance"
)

levels(as.factor(models$Response))

names_movement <- c( 
 `01_Speed` = "Speed", `Revisits` = "Revisits",`TimeInside` = "Time Inside",
  `TimeSinceLastVisit` = "Time Since Last Visit")

movepatt = ggplot(data=models,
                  aes(x = Variables, y = Estimate, ymin = CI_min, ymax = CI_max ))+
  geom_pointrange(aes(col=Variables))+
  geom_hline(aes(fill=Variables),yintercept =0, linetype=2)+
  xlab('')+ ylab("Estimate (95% Confidence Interval)")+
  geom_errorbar(aes(ymin=CI_min, ymax=CI_max,col=Variables),width=0.0,cex=1)+ 
  facet_wrap(~Response,strip.position="top",nrow=1,scales = "free_x",
             labeller = as_labeller(names_movement)) +
  theme_bw()+ 
  scale_color_manual("Variables", values=c("#233B3F","#3F6964", 
                                            "#C7C0A4", "#914935","#8C7733", 
                                            "#E2BF83"),labels =c("Forest patch",
                                            "Forest distance",
                                            "Drainage distance",
                                            "Agriculture patches",
                                            "Agriculture distance",
                                            "Aux road distance"))+
  theme(plot.title=element_text(size=16,face="bold"),
        strip.background = element_rect(
          fill = "snow1", colour = "gray30", size = 1.3),
        strip.text.x = element_text(size = 13),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(face="bold"),
        axis.title=element_text(size=14,face="bold"),
        strip.text.y = element_text(hjust=0,vjust = 1,angle=180,face="bold"))+
  coord_flip()

movepatt 

#dir.create("plots")
ggsave(path="plots", filename = "MovePattern20230406.png", width = 25, height = 15, units = "cm", dpi =300)


# Upload final data -------------------------------------------------------


Jag02_FinalData <- read.csv("F:/Jaguar02/01_Analysis_Methods/01_Data/ctmm/jaguar_ctmm.csv", header = T, sep = ',', dec = '.', comment.char = '')

Jag02_FinalData$forest_patch[is.na(Jag02_FinalData$forest_patch)] = 0
Jag02_FinalData$forest_dist[is.na(Jag02_FinalData$forest_dist)] = 0
Jag02_FinalData$agro_patch[is.na(Jag02_FinalData$agro_patch)] = 0
Jag02_FinalData$speedctmm[is.na(Jag02_FinalData$speedctmm)] = 0



### crear columnas

# Create columns ----------------------------------------------------------


Jag02_FinalData$agro_situ <-  ifelse(
  Jag02_FinalData$agro_dist <= -0, "in", "out")

Jag02_FinalData$forest_situ <-  ifelse(
  Jag02_FinalData$forest_dist <= -0, "in", "out")

Jag02_FinalData$drainage_situ <-  ifelse(
  Jag02_FinalData$drainage_dist <= -0, "in", "out")

Jag02_FinalData$main_situ <-  ifelse(
  Jag02_FinalData$main_dist <= -0, "in", "out")

Jag02_FinalData$aux_situ <-  ifelse(
  Jag02_FinalData$aux_dist <= -0, "in", "out")



# Estadisticos ------------------------------------------------------------


df_Jag02_agro <- Jag02_FinalData %>% 
  select(agro_situ, agro_dist) %>% 
  group_by(agro_situ) %>% 
  summarise(agro_dist_min = min(agro_dist),
            agro_dist_max = max(agro_dist),
            agro_dist_mean = mean(agro_dist),
            agro_dist_sd = sd(agro_dist))



df_Jag02_forest <- Jag02_FinalData %>% 
  select(forest_situ, forest_dist) %>% 
  group_by(forest_situ,) %>% 
  summarise(forest_dist_min = min(forest_dist),
            forest_dist_max = max(forest_dist),
            forest_dist_mean = mean(forest_dist),
            forest_dist_sd = sd(forest_dist))


df_Jag02_drainage <- Jag02_FinalData %>% 
  select(drainage_situ, drainage_dist) %>% 
  group_by(drainage_situ,) %>% 
  summarise(drainage_dist_min = min(drainage_dist),
            drainage_dist_max = max(drainage_dist),
            drainage_dist_mean = mean(drainage_dist),
            drainage_dist_sd = sd(drainage_dist))



df_Jag02_main <- Jag02_FinalData %>% 
  select(main_situ, main_dist) %>% 
  group_by(main_situ,) %>% 
  summarise(main_dist_min = min(main_dist),
            main_dist_max = max(main_dist),
            main_dist_mean = mean(main_dist),
            main_dist_sd = sd(main_dist))


df_Jag02_aux <- Jag02_FinalData %>% 
  select(aux_situ, aux_dist) %>% 
  group_by(aux_situ,) %>% 
  summarise(aux_dist_min = min(aux_dist),
            aux_dist_max = max(aux_dist),
            aux_dist_mean = mean(aux_dist),
            aux_dist_sd = sd(aux_dist))

# Graphics ----------------------------------------------------------------

# Change density plot fill colors by groups
ggplot(Jag02_FinalData, aes(x=forest_dist)) +
  geom_density(aes(fill="Forest"), alpha= 0.7)+
  geom_density(aes(x=Jag02_FinalData$drainage_dist, fill="Drainage"), alpha= 0.7)+
  geom_density(aes(x=Jag02_FinalData$agro_dist, fill="Agriculture"), alpha= 0.7)+
  geom_density(aes(x=Jag02_FinalData$aux_dist,fill="Auxiliary road"), alpha= 0.7)+ 
  labs(x = 'Distances',
       y = "Density")+
  
  scale_fill_manual(name = "Landscape variables:",
                    breaks= c("Forest","Drainage",
                              "Agriculture","Auxiliary road"),
                    values = c("Forest"="#3F6964",
                               "Agriculture"="#914935",
                               "Drainage"="#C7C0A4",
                               "Auxiliary road"="#E2BF83"))+
  theme_bw()+
  theme(axis.title.x = element_text(size = 14, face= 'bold')) +
  theme(axis.title.y = element_text(size = 14, face= 'bold')) +
  theme(legend.title= element_text(size= 12, face= 'bold'),
        legend.text= element_text(size=11),
        legend.position = "top")

#dir.create("plots")
ggsave(path="plots", filename = "Distance20230216.png", width = 25, height = 15, units = "cm", dpi =300)


# Revisit frequency -------------------------------------------------------
ggplot(data=Jag02_FinalData, aes(x=forest_dist, y=visits))+
  geom_point(aes(color="Forest"), alpha=0.3) +
  geom_point(x=Jag02_FinalData$agro_dist, y=Jag02_FinalData$visits, 
             aes(color="Agriculture"), alpha= 0.3) +
  geom_point(x=Jag02_FinalData$drainage_dist, y=Jag02_FinalData$visits, 
             aes(color="Drainage"), alpha= 0.3) +
  geom_point(x=Jag02_FinalData$aux_dist, y=Jag02_FinalData$visits, 
             aes(color="Auxiliary road"), alpha= 0.3) +
  labs(x = 'Variable distances: (-) inside and (+)outside',
       y = "Number of visits")+
  scale_color_manual(name = "Landscape variables:",
                     breaks= c("Forest","Agriculture",
                               "Drainage","Auxiliary road"),
                     values = c("Forest"="#3F6964",
                                "Agriculture"="#914935",
                                "Drainage"="#C7C0A4",
                                "Auxiliary road"="#E2BF83"))+
  theme_bw()+
  theme(axis.title.x = element_text(size = 14, face= 'bold')) +
  theme(axis.title.y = element_text(size = 14, face= 'bold')) +
  theme(legend.title= element_text(size= 12, face= 'bold'),
        legend.text= element_text(size=11),
        legend.position = "top")+
  guides(colour = guide_legend(override.aes = list(size=5)))

#dir.create("plots")
ggsave(path="plots", filename = "Numbervisits.png", width = 25, height = 15, units = "cm", dpi =300)




# Patch size vs Time inside -----------------------------------------------


Jag02_FinalData_stat <- read.csv('E:/Jaguar02/01_Analysis_Methods/03_Output/jag_stat_track2023_feb_10.csv', header = T, sep = ',', dec = '.', comment.char = '')

Jag02_FinalData_stat$forest_patch[is.na(Jag02_FinalData_stat$forest_patch)] = 0
Jag02_FinalData_stat$agro_patch[is.na(Jag02_FinalData_stat$agro_patch)] = 0
Jag02_FinalData_stat$timeSinceLastVisit[is.na(Jag02_FinalData_stat$timeSinceLastVisit)] = 0

inside_p <-  Jag02_FinalData_stat[Jag02_FinalData_stat$inside_t >= 4,]
inside_p <- inside_p[inside_p$patch_size >0,]
inside_p <- inside_p[inside_p$inside_t <= 48,]

grouped_ggbetweenstats(data= inside_p, x= site, y= timeInside,
               grouping.var= patch_size,
               xlab= "",
               ylab= "Time inside patch",
               results.subtitle = FALSE,
               pairwise.comparisons = FALSE,
               plotgrid.args = list(nrow = 2),
               ggplot.component = 
                 list(scale_color_manual(values = c("#B3A328","#4E6317"))))

#dir.create("plots")
ggsave(path="plots", filename = "insidepatch.png", width = 25, height = 15, units = "cm", dpi =300)


#Website interest:  https://indrajeetpatil.github.io/ggstatsplot/articles/web_only/faq.html
#https://indrajeetpatil.github.io/ggstatsplot/articles/web_only/ggbetweenstats.html
