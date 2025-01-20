###--------------------------------------
# Jaguar chapter 02 Movement Patterns 
# Vanesa Bejarano Alegre vanesa.bejarano@gmail.com
# January 25, 2023
#  LANDCOVER ENVIRONMENT DATA
# prepare R enviroment

rm(list= ls())  #clean all before to start

listpacks <- c("tidyverse","purrr", "amt", "lubridate", "ctmm", "move",
               "recurse", "raster")

if(!require(install.load)) install.packages('install.load'); library(install.load)
install.load::install_load(listpacks)

setwd("E:/Jaguar02/01_Analysis_Methods/01_Data")

jaguar <- read.delim(file="00_jaguar01.txt")


# Atlantic ----------------------------------------------------------------
# W group
Wgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/11_Wgroup_Atlantic_21S_HABMAT_agro.tif")

Wgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro.tif")

Wgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro.tif")

Wgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/11_Wgroup_Atlantic_21S_HABMAT.tif")

Wgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST.tif")

Wgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA.tif")

Wgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/W_dist_drainage.tif")

Wgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/W_dist_aux_road.tif")

Wgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/W_dist_main_road.tif")

# Y group

Ygroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/12_Ygroup_Atlantic_21S_HABMAT_agro.tif")

Ygroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST_agro.tif")

Ygroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA_agro.tif")

Ygroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/12_Ygroup_Atlantic_21S_HABMAT.tif")

Ygroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST.tif")

Ygroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA.tif")

Ygroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Y_dist_drainage.tif")

Ygroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Y_dist_aux_road.tif")

Ygroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Y_dist_main_road.tif")

# Z group

Zgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/13_Zgroup_Atlantic_21S_HABMAT_agro.tif")

Zgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro.tif")

Zgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Agricultural_metrics/13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro.tif")

Zgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/13_Zgroup_Atlantic_21S_HABMAT.tif")

Zgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST.tif")

Zgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Forest_metrics/13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA.tif")

Zgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Z_dist_drainage.tif")

Zgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Z_dist_aux_road.tif")

Zgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Atlantic/Z_dist_main_road.tif")

# W group -----------------------------------------------------------------

j8 <- filter(jaguar, individual.local.identifier== "8")
j8$timestampTZ <- as.POSIXct(j8$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3")
plot(j8$X, j8$Y)
point_outlier <- which(j8$X > 666000)
j8 <-   j8[- point_outlier,]
plot(j8$X, j8$Y)
j8_track <- amt::mk_track(as.data.frame(j8), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j8 <- track_resample(j8_track, rate=hours(4), tolareance = minutes(15), start=1)
j8$speed<- amt::speed(j8)
boxplot(j8$speed)

speed_outlier <- which(j8$speed > 0.15)
j8 <-   j8[- speed_outlier,]

Wgroup_jag <- j8
Wgroup_jag <- as.data.frame(Wgroup_jag)

Wgroup_mov <- move(x=Wgroup_jag$x_, y=Wgroup_jag$y_, time= as.POSIXct(Wgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Wgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Wgroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 08
j8_mov <- Wgroup_mov
j8_recurse = getRecursions(j8_mov , 250) 
j8_recurse_df <-  as.data.frame(j8_recurse$revisitStats)
j8_recurse_df$id <- '08'
j8_recurse_df$clumpy <- 0.825
j8$visits <- j8_recurse$revisits
plot(j8_recurse,j8_mov)

j8_track <- amt::mk_track(as.data.frame(j8_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j8_track <- arrange(j8_track, t_)

j8$angle<- amt::direction_rel(j8_track)
j8$sl <- amt::step_lengths(j8_track)
j8$speed<- amt::speed(j8_track)
j8$clumpy <- 0.825


### Outliers review
### 
boxplot(j8$visits)
boxplot(j8_recurse_df$timeInside)
boxplot(j8_recurse_df$timeSinceLastVisit)
boxplot(j8$speed)

summary(j8$speed)

# Final step --------------------------------------------------------------

Wgroup_jag <-  j8

Wgroup_jag_stat <- j8_recurse_df

Wgroup_jag  <- arrange(Wgroup_jag ,id, t_)

Wgroup_mov <- move(x=Wgroup_jag$x_, y=Wgroup_jag$y_, time= as.POSIXct(Wgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Wgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Wgroup_jag$id, clumpy=clumpy)

Wgroup_track <- amt::mk_track(as.data.frame(Wgroup_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Wgroup_track <- Wgroup_track %>% 
  extract_covariates(Wgroup_agro_bi) %>%  
  extract_covariates(Wgroup_agro_dist) %>% 
  extract_covariates(Wgroup_agro_patch) %>%
  extract_covariates(Wgroup_forest_bi) %>%  
  extract_covariates(Wgroup_forest_dist) %>% 
  extract_covariates(Wgroup_forest_patch) %>% 
  extract_covariates(Wgroup_drainage) %>% 
  extract_covariates(Wgroup_aux_road) %>% 
  extract_covariates(Wgroup_main_road) 

variable.names(Wgroup_jag_stat)

Wgroup_jag_stat_track <- amt::mk_track(Wgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Wgroup_jag_stat_track <- Wgroup_jag_stat_track %>% 
  extract_covariates(Wgroup_agro_bi) %>%  
  extract_covariates(Wgroup_agro_dist) %>% 
  extract_covariates(Wgroup_agro_patch) %>%
  extract_covariates(Wgroup_forest_bi) %>%  
  extract_covariates(Wgroup_forest_dist) %>% 
  extract_covariates(Wgroup_forest_patch) %>% 
  extract_covariates(Wgroup_drainage) %>% 
  extract_covariates(Wgroup_aux_road) %>% 
  extract_covariates(Wgroup_main_road) 


variable.names(Wgroup_track)

Wgroup_track <- rename(Wgroup_track, 
                       agro_bin= X11_Wgroup_Atlantic_21S_HABMAT_agro,
                       agro_dist = X11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X11_Wgroup_Atlantic_21S_HABMAT,
                       forest_dist = X11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST,
                       forest_patch = X11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA,
                       drainage_dist = W_dist_drainage,
                       aux_dist = W_dist_aux_road,
                       main_dist = W_dist_main_road)


Wgroup_track$group <- "W"

variable.names(Wgroup_jag_stat_track )

Wgroup_jag_stat_track  <- rename(Wgroup_jag_stat_track , 
                                 agro_bin= X11_Wgroup_Atlantic_21S_HABMAT_agro,
                                 agro_dist = X11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X11_Wgroup_Atlantic_21S_HABMAT,
                                 forest_dist = X11_Wgroup_Atlantic_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X11_Wgroup_Atlantic_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = W_dist_drainage,
                                 aux_dist = W_dist_aux_road,
                                 main_dist = W_dist_main_road)

Wgroup_jag_stat_track$group <- "W"


# Y group -----------------------------------------------------------------

## 
j42 <- filter(jaguar, individual.local.identifier== "42")
j42$timestampTZ <- as.POSIXct(j42$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3")
j42 <- j42[-543,]
plot(j42$X, j42$Y)
j42_track <- amt::mk_track(as.data.frame(j42), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j42 <- track_resample(j42_track, rate=hours(4), tolareance = minutes(15), start=1)
j42$speed<- amt::speed(j42)
boxplot(j42$speed)


j90 <- filter(jaguar, individual.local.identifier== "90")
j90$timestampTZ <- as.POSIXct(j90$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3")
plot(j90$X, j90$Y)
j90_track <- amt::mk_track(as.data.frame(j90), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j90 <- track_resample(j90_track, rate=hours(4), tolareance = minutes(15), start=1)
j90$speed<- amt::speed(j90)
boxplot(j90$speed)

speed_outlier <- which(j90$speed > 0.17)
j90<-   j90[- speed_outlier,]



Ygroup_jag <- bind_rows(j42,j90)
Ygroup_jag <- as.data.frame(Ygroup_jag)

Ygroup_mov <- move(x=Ygroup_jag$x_, y=Ygroup_jag$y_, time= as.POSIXct(Ygroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Ygroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Ygroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 42
j42_mov <- Ygroup_mov[["X42"]]
j42_recurse = getRecursions(j42_mov , 250) 
j42_recurse_df <-  as.data.frame(j42_recurse$revisitStats)
j42_recurse_df$id <- '42'
j42_recurse_df$clumpy <- 0.782
j42$visits <- j42_recurse$revisits
plot(j42_recurse,j42_mov)

j42_track <- amt::mk_track(as.data.frame(j42_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j42_track <- arrange(j42_track, t_)

j42$angle<- amt::direction_rel(j42_track)
j42$sl <- amt::step_lengths(j42_track)
j42$speed<- amt::speed(j42_track)
j42$clumpy <- 0.782

### Outliers review
### 
boxplot(j42$visi)
boxplot(j42_recurse_df$timeInside)
boxplot(j42_recurse_df$timeSinceLastVisit)
boxplot(j42$speed)

summary(j42$speed)


#### JAGUAR 090
j90_mov <- Ygroup_mov[["X90"]]
j90_recurse = getRecursions(j90_mov , 250) 
j90_recurse_df <-  as.data.frame(j90_recurse$revisitStats)
j90_recurse_df$id <- '90'
j90_recurse_df$clumpy <- 0.876
j90$visits <- j90_recurse$revisits
plot(j90_recurse,j90_mov)

j90_track <- amt::mk_track(as.data.frame(j90_mov),x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j90_track <- arrange(j90_track, t_)

j90$angle<- amt::direction_rel(j90_track)
j90$sl <- amt::step_lengths(j90_track)
j90$speed<- amt::speed(j90_track)
j90$clumpy <- 0.876

### Outliers review
### 
boxplot(j90$visits)
boxplot(j90_recurse_df$timeInside)
boxplot(j90_recurse_df$timeSinceLastVisit)
boxplot(j90$speed)

summary(j90$speed)


# Final step --------------------------------------------------------------

Ygroup_jag <- bind_rows(j42,j90)


Ygroup_jag_stat <-bind_rows(j42_recurse_df, j90_recurse_df)

Ygroup_jag  <- arrange(Ygroup_jag,id,t_)

Ygroup_jag <- as.data.frame(Ygroup_jag)

Ygroup_mov <- move(x=Ygroup_jag$x_, y=Ygroup_jag$y_, time= as.POSIXct(Ygroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Ygroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Ygroup_jag$id,, clumpy=clumpy)

Ygroup_track <- amt::mk_track(as.data.frame(Ygroup_mov),x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed,clumpy=clumpy)

Ygroup_track <- Ygroup_track %>% 
  extract_covariates(Ygroup_agro_bi) %>%  
  extract_covariates(Ygroup_agro_dist) %>% 
  extract_covariates(Ygroup_agro_patch) %>%
  extract_covariates(Ygroup_forest_bi) %>%  
  extract_covariates(Ygroup_forest_dist) %>% 
  extract_covariates(Ygroup_forest_patch) %>% 
  extract_covariates(Ygroup_drainage) %>% 
  extract_covariates(Ygroup_aux_road) %>% 
  extract_covariates(Ygroup_main_road)

variable.names(Ygroup_jag_stat)

Ygroup_jag_stat_track <- amt::mk_track(Ygroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit,clumpy=clumpy)

Ygroup_jag_stat_track <- Ygroup_jag_stat_track %>% 
  extract_covariates(Ygroup_agro_bi) %>%  
  extract_covariates(Ygroup_agro_dist) %>% 
  extract_covariates(Ygroup_agro_patch) %>%
  extract_covariates(Ygroup_forest_bi) %>%  
  extract_covariates(Ygroup_forest_dist) %>% 
  extract_covariates(Ygroup_forest_patch) %>% 
  extract_covariates(Ygroup_drainage) %>% 
  extract_covariates(Ygroup_aux_road) %>% 
  extract_covariates(Ygroup_main_road)

variable.names(Ygroup_track)

Ygroup_track <- rename(Ygroup_track, 
                       agro_bin= X12_Ygroup_Atlantic_21S_HABMAT_agro,
                       agro_dist = X12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X12_Ygroup_Atlantic_21S_HABMAT,
                       forest_dist = X12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST,
                       forest_patch = X12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA,
                       drainage_dist = Y_dist_drainage,
                       aux_dist = Y_dist_aux_road,
                       main_dist = Y_dist_main_road)

Ygroup_track$group <- "Y"

variable.names(Ygroup_jag_stat_track)

Ygroup_jag_stat_track  <- rename(Ygroup_jag_stat_track , 
                                 agro_bin= X12_Ygroup_Atlantic_21S_HABMAT_agro,
                                 agro_dist = X12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X12_Ygroup_Atlantic_21S_HABMAT,
                                 forest_dist = X12_Ygroup_Atlantic_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X12_Ygroup_Atlantic_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = Y_dist_drainage,
                                 aux_dist = Y_dist_aux_road,
                                 main_dist = Y_dist_main_road)

Ygroup_jag_stat_track$group <- "Y"



# Z group -----------------------------------------------------------------

## 
j78 <- filter(jaguar, individual.local.identifier== "78")
j78$timestampTZ <- as.POSIXct(j78$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3")
plot(j78$X, j78$Y)
j78_track <- amt::mk_track(as.data.frame(j78), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j78 <- track_resample(j78_track, rate=hours(4), tolareance = minutes(15), start=1)

j78$speed<- amt::speed(j78)
boxplot(j78$speed)

speed_outlier <- which(j78$speed > 0.20)
j78<-   j78[- speed_outlier,]


Zgroup_jag <- j78
Zgroup_jag <- as.data.frame(Zgroup_jag)

variable.names(Zgroup_jag)

Zgroup_mov <- move(x=Zgroup_jag$x_, y=Zgroup_jag$y_, time= as.POSIXct(Zgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Zgroup_jag, proj=CRS("+init=epsg:32721"), animal=Zgroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 78
j78_mov <- Zgroup_mov
j78_recurse = getRecursions(j78_mov , 250) 
j78_recurse_df <-  as.data.frame(j78_recurse$revisitStats)
j78_recurse_df$id <- '78'
j78_recurse_df$clumpy <- 0.801
j78$visits <- j78_recurse$revisits
plot(j78_recurse,j78_mov)

j78_track <- amt::mk_track(as.data.frame(j78_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j78_track <- arrange(j78_track, t_)

j78$angle<- amt::direction_rel(j78_track)
j78$sl <- amt::step_lengths(j78_track)
j78$speed<- amt::speed(j78_track)
j78$clumpy <- 0.801

### Outliers review
### 
boxplot(j78$visits)
boxplot(j78_recurse_df$timeInside)
boxplot(j78_recurse_df$timeSinceLastVisit)
boxplot(j78$speed)

summary(j78$speed)

# Final step --------------------------------------------------------------

Zgroup_jag <- j78


Zgroup_jag_stat <-j78_recurse_df

Zgroup_jag  <- arrange(Zgroup_jag ,id,t_)

Zgroup_mov <- move(x=Zgroup_jag$x_, y=Zgroup_jag$y_, time= as.POSIXct(Zgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+3"), data= Zgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Zgroup_jag$id, clumpy=clumpy)

Zgroup_track <- amt::mk_track(as.data.frame(Zgroup_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Zgroup_track <- Zgroup_track %>% 
  extract_covariates(Zgroup_agro_bi) %>%  
  extract_covariates(Zgroup_agro_dist) %>% 
  extract_covariates(Zgroup_agro_patch) %>%
  extract_covariates(Zgroup_forest_bi) %>%  
  extract_covariates(Zgroup_forest_dist) %>% 
  extract_covariates(Zgroup_forest_patch) %>% 
  extract_covariates(Zgroup_drainage) %>% 
  extract_covariates(Zgroup_aux_road) %>% 
  extract_covariates(Zgroup_main_road)  

variable.names(Zgroup_jag_stat)

Zgroup_jag_stat_track <- amt::mk_track(Zgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Zgroup_jag_stat_track <- Zgroup_jag_stat_track %>% 
  extract_covariates(Zgroup_agro_bi) %>%  
  extract_covariates(Zgroup_agro_dist) %>% 
  extract_covariates(Zgroup_agro_patch) %>%
  extract_covariates(Zgroup_forest_bi) %>%  
  extract_covariates(Zgroup_forest_dist) %>% 
  extract_covariates(Zgroup_forest_patch) %>% 
  extract_covariates(Zgroup_drainage) %>% 
  extract_covariates(Zgroup_aux_road) %>% 
  extract_covariates(Zgroup_main_road) 

variable.names(Zgroup_track)

Zgroup_track <- rename(Zgroup_track, 
                       agro_bin= X13_Zgroup_Atlantic_21S_HABMAT_agro,
                       agro_dist = X13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X13_Zgroup_Atlantic_21S_HABMAT,
                       forest_dist = X13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST,
                       forest_patch = X13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA,
                       drainage_dist = Z_dist_drainage,
                       aux_dist = Z_dist_aux_road,
                       main_dist = Z_dist_main_road)

Zgroup_track$group <- "Z"

variable.names(Zgroup_jag_stat_track)

Zgroup_jag_stat_track  <- rename(Zgroup_jag_stat_track , 
                                 agro_bin= X13_Zgroup_Atlantic_21S_HABMAT_agro,
                                 agro_dist = X13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X13_Zgroup_Atlantic_21S_HABMAT,
                                 forest_dist = X13_Zgroup_Atlantic_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X13_Zgroup_Atlantic_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = Z_dist_drainage,
                                 aux_dist = Z_dist_aux_road,
                                 main_dist = Z_dist_main_road)

Zgroup_jag_stat_track$group <- "Z"


# Atlantic joined ---------------------------------------------------------

Atlantic_trk <- rbind(Wgroup_track,Ygroup_track,Zgroup_track)


Atlantic_stat_trak <- rbind(Wgroup_jag_stat_track,Ygroup_jag_stat_track,Zgroup_jag_stat_track)


Atlantic_stat_trak$region <-  "Atlantic"

Atlantic_trk$region <- "Atlantic"


# Caatinga ---------------------------------------------------------
##### G group
Ggroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Agricultural_metrics/02_Ggroup_Caatinga_23S_HABMAT_agro.tif")

Ggroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Agricultural_metrics/02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST_agro.tif")

Ggroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Agricultural_metrics/02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA_agro.tif")

Ggroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Forest_metrics/02_Ggroup_Caatinga_23S_HABMAT.tif")

Ggroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Forest_metrics/02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST.tif")

Ggroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/Forest_metrics/02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA.tif")

Ggroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/G_dist_drainage.tif")

Ggroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/G_dist_aux_road.tif")

Ggroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Caatinga/G_dist_main_road.tif")

# G GROUP -----------------------------------------------------------------

j20 <- filter(jaguar, individual.local.identifier== "20")
j20$timestampTZ <- as.POSIXct(j20$timestampTZ,format="%Y-%m-%d %H:%M",tz="America/Fortaleza")
plot(j20$X,j20$Y)
j20_track <- amt::mk_track(as.data.frame(j20), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j20 <- track_resample(j20_track, rate=hours(4), tolareance = minutes(15), start=1)
j20$speed<- amt::speed(j20)
boxplot(j20$speed)

speed_outlier <- which(j20$speed > 0.3)
j20<-   j20[- speed_outlier,]


j50 <- filter(jaguar, individual.local.identifier== "50")
j50$timestampTZ <- as.POSIXct(j50$timestampTZ,format="%Y-%m-%d %H:%M",tz="America/Fortaleza")
plot(j50$X,j50$Y)
j50_track <- amt::mk_track(as.data.frame(j50), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j50 <- track_resample(j50_track, rate=hours(4), tolareance = minutes(15), start=1)

j50$speed<- amt::speed(j50)
boxplot(j50$speed)

speed_outlier <- which(j50$speed > 0.30)
j50<-   j50[- speed_outlier,]

Ggroup_jag <- bind_rows(j20,j50)
Ggroup_jag <- as.data.frame(Ggroup_jag)

Ggroup_mov <- move(x=Ggroup_jag$x_, y=Ggroup_jag$y_, time= as.POSIXct(Ggroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Fortaleza"), data= Ggroup_jag, proj=CRS("+init=epsg:32723"), animal=Ggroup_jag$id)


# Prepare columns movement ------------------------------------------------

#### JAGUAR 020
j20_mov <- Ggroup_mov[["X20"]]
j20_recurse = getRecursions(j20_mov , 250) 
j20_recurse_df <-  as.data.frame(j20_recurse$revisitStats)
j20_recurse_df$id <- "20"
j20_recurse_df$clumpy <- 0.671
j20$visits <- j20_recurse$revisits
plot(j20_recurse,j20_mov)


j20_track <- amt::mk_track(as.data.frame(j20_mov),x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32723"), sex=sex, season=season, moon.phase=moon.phase, event=event)

j20_track <- arrange(j20_track, t_)

j20$angle<- amt::direction_rel(j20_track)
j20$sl <- amt::step_lengths(j20_track)
j20$speed<- amt::speed(j20_track)
j20$clumpy <- 0.671

### Outliers review
### 
boxplot(j20$visits)
boxplot(j20_recurse_df$timeInside)
boxplot(j20_recurse_df$timeSinceLastVisit)
boxplot(j20$speed)

summary(j20$speed)

#### JAGUAR 050
j50_mov <- Ggroup_mov[["X50"]]
j50_recurse = getRecursions(j50_mov , 250) 
j50_recurse_df <-  as.data.frame(j50_recurse$revisitStats)
j50_recurse_df$id <- "50"
j50_recurse_df$clumpy <- 0.637
j50$visits <- j50_recurse$revisits
plot(j50_recurse,j50_mov)

j50_track <- amt::mk_track(as.data.frame(j50_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32723"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j50_track <- arrange(j50_track, t_)

j50$angle<- amt::direction_rel(j50_track)
j50$sl <- amt::step_lengths(j50_track)
j50$speed<- amt::speed(j50_track)
j50$clumpy <- 0.637

### Outliers review
### 
boxplot(j50$visits)
boxplot(j50_recurse_df$timeInside)
boxplot(j50_recurse_df$timeSinceLastVisit)
boxplot(j50$speed)

summary(j50$speed)


# Final step --------------------------------------------------------------

Ggroup_jag <- bind_rows(j20, j50)

Ggroup_jag_stat <-bind_rows(j20_recurse_df, j50_recurse_df)

Ggroup_jag  <- arrange(Ggroup_jag ,id,t_)
Ggroup_jag <- as.data.frame(Ggroup_jag)

Ggroup_mov <- move(x=Ggroup_jag$x_, y=Ggroup_jag$y_, time= as.POSIXct(Ggroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Fortaleza"), data= Ggroup_jag, proj=CRS("+init=epsg:32723"), animal=Ggroup_jag$id, clumpy=clumpy)

Ggroup_track <- amt::mk_track(as.data.frame(Ggroup_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32723"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Ggroup_track <- Ggroup_track %>% 
  extract_covariates(Ggroup_agro_bi) %>%  
  extract_covariates(Ggroup_agro_dist) %>% 
  extract_covariates(Ggroup_agro_patch) %>%
  extract_covariates(Ggroup_forest_bi) %>%  
  extract_covariates(Ggroup_forest_dist) %>% 
  extract_covariates(Ggroup_forest_patch) %>% 
  extract_covariates(Ggroup_drainage) %>% 
  extract_covariates(Ggroup_aux_road) %>% 
  extract_covariates(Ggroup_main_road) 

variable.names(Ggroup_jag_stat)

Ggroup_jag_stat_track <- amt::mk_track(Ggroup_jag_stat, x,y, id= id, 
                                       crs=crs("+init=epsg:32723"), 
                                       coordIdx= coordIdx, visitIdx=visitIdx,
                                       entranceTime=entranceTime, 
                                       exitTime=exitTime,
                                       timeInside=timeInside, 
                                       timeSinceLastVisit=timeSinceLastVisit,
                                       clumpy=clumpy)

Ggroup_jag_stat_track <- Ggroup_jag_stat_track %>% 
  extract_covariates(Ggroup_agro_bi) %>%  
  extract_covariates(Ggroup_agro_dist) %>% 
  extract_covariates(Ggroup_agro_patch) %>%
  extract_covariates(Ggroup_forest_bi) %>%  
  extract_covariates(Ggroup_forest_dist) %>% 
  extract_covariates(Ggroup_forest_patch) %>% 
  extract_covariates(Ggroup_drainage) %>% 
  extract_covariates(Ggroup_aux_road) %>% 
  extract_covariates(Ggroup_main_road) 

variable.names(Ggroup_track)

Ggroup_track <- rename(Ggroup_track, 
                       agro_bin= X02_Ggroup_Caatinga_23S_HABMAT_agro,
                       agro_dist = X02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X02_Ggroup_Caatinga_23S_HABMAT,
                       forest_dist = X02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST,
                       forest_patch = X02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA,
                       drainage_dist = G_dist_drainage,
                       aux_dist = G_dist_aux_road,
                       main_dist = G_dist_main_road)

Ggroup_track$group <- "G"

variable.names(Ggroup_jag_stat_track )

Ggroup_jag_stat_track  <- rename(Ggroup_jag_stat_track , 
                                 agro_bin= X02_Ggroup_Caatinga_23S_HABMAT_agro,
                                 agro_dist = X02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X02_Ggroup_Caatinga_23S_HABMAT,
                                 forest_dist = X02_Ggroup_Caatinga_23S_HABMAT_EDGE_DIST,
                                 forest_patch = X02_Ggroup_Caatinga_23S_HABMAT_patch_AreaHA,
                                 drainage_dist = G_dist_drainage,
                                 aux_dist = G_dist_aux_road,
                                 main_dist = G_dist_main_road)

Ggroup_jag_stat_track$group <- "G"

# Caatinga joined ---------------------------------------------------------

Caatinga_trk <- Ggroup_track


Caatinga_stat_trak <- Ggroup_jag_stat_track


Caatinga_stat_trak$region <-  "Caatinga"

Caatinga_trk$region <- "Caatinga"




# Cerrado  ---------------------------------------------------------

##### H group
Hgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Agricultural_metrics/03_Hgroup_Cerrado_22S_HABMAT_agro.tif")

Hgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Agricultural_metrics/03_Hgroup_Cerrado_22S_HABMAT_EDGE_DIST_agro.tif")

Hgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Agricultural_metrics/03_Hgroup_Cerrado_22S_HABMAT_patch_AreaHA_agro.tif")

Hgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Forest_metrics/03_Hgroup_Cerrado_22S_HABMAT.tif")

Hgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Forest_metrics/03_Hgroup_Cerrado_22S_HABMAT_EDGE_DIST.tif")

Hgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/Forest_metrics/03_Hgroup_Cerrado_22S_HABMAT_patch_AreaHA.tif")

Hgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/H_dist_drainage.tif")

Hgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/H_dist_aux_road.tif")

Hgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Cerrado/H_dist_main_road.tif")


# H group -----------------------------------------------------------------
## 
j89 <- filter(jaguar, individual.local.identifier== "89")
j89$timestampTZ <- as.POSIXct(j89$timestampTZ,format="%Y-%m-%d %H:%M", tz="Etc/GMT+3")
j89_track <- amt::mk_track(as.data.frame(j89), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j89 <- track_resample(j89_track, rate=hours(4), tolareance = minutes(15), start=1)

j89$speed<- amt::speed(j89)
boxplot(j89$speed)

speed_outlier <- which(j89$speed > 0.6)
j89<-   j89[- speed_outlier,]


Hgroup_jag <- j89

Hgroup_jag <- as.data.frame(Hgroup_jag)

Hgroup_mov <- move(x=Hgroup_jag$x_, y=Hgroup_jag$y_, time= as.POSIXct(Hgroup_jag$t_,format="%Y-%m-%d %H:%M", tz="Etc/GMT+3"), data= Hgroup_jag, prefer_proj=CRS("+init=epsg:32722"), animal=Hgroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 089
j89_mov <- Hgroup_mov
j89_recurse = getRecursions(j89_mov , 250) 
j89_recurse_df <-  as.data.frame(j89_recurse$revisitStats)
j89_recurse_df$id <- "89"
j89_recurse_df$clumpy <- 0.395
j89$visits <- j89_recurse$revisits
plot(j89_recurse,j89_mov)

j89_track <- amt::mk_track(as.data.frame(j89_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j89_track <- arrange(j89_track, t_)

j89$angle<- amt::direction_rel(j89_track)
j89$sl <- amt::step_lengths(j89_track)
j89$speed<- amt::speed(j89_track)
j89$clumpy <- 0.395

### Outliers review
### 
boxplot(j89$visits)
boxplot(j89_recurse_df$timeInside)
boxplot(j89_recurse_df$timeSinceLastVisit)
boxplot(j89$speed)

summary(j89$speed)

# Final step --------------------------------------------------------------

Hgroup_jag <- bind_rows(j89)

Hgroup_jag_stat <-bind_rows(j89_recurse_df)

Hgroup_jag  <- arrange(Hgroup_jag ,id, t_)

Hgroup_jag <-  as.data.frame(Hgroup_jag)

Hgroup_mov <- move(x=Hgroup_jag$x_, y=Hgroup_jag$y_, time= as.POSIXct(Hgroup_jag$t_,format="%Y-%m-%d %H:%M", tz="Etc/GMT+3"), data= Hgroup_jag, prefer_proj=CRS("+init=epsg:32722"), animal=Hgroup_jag$id, clumpy=clumpy)

Hgroup_track <- amt::mk_track(as.data.frame(Hgroup_mov),  x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32722"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Hgroup_track <- Hgroup_track %>% 
  extract_covariates(Hgroup_agro_bi) %>%  
  extract_covariates(Hgroup_agro_dist) %>% 
  extract_covariates(Hgroup_agro_patch) %>%
  extract_covariates(Hgroup_forest_bi) %>%  
  extract_covariates(Hgroup_forest_dist) %>% 
  extract_covariates(Hgroup_forest_patch) %>% 
  extract_covariates(Hgroup_drainage) %>% 
  extract_covariates(Hgroup_aux_road) %>% 
  extract_covariates(Hgroup_main_road) 

variable.names(Hgroup_jag_stat)

Hgroup_jag_stat_track <- amt::mk_track(Hgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32722"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime, timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Hgroup_jag_stat_track <- Hgroup_jag_stat_track %>% 
  extract_covariates(Hgroup_agro_bi) %>%  
  extract_covariates(Hgroup_agro_dist) %>% 
  extract_covariates(Hgroup_agro_patch) %>%
  extract_covariates(Hgroup_forest_bi) %>%  
  extract_covariates(Hgroup_forest_dist) %>% 
  extract_covariates(Hgroup_forest_patch) %>% 
  extract_covariates(Hgroup_drainage) %>% 
  extract_covariates(Hgroup_aux_road) %>% 
  extract_covariates(Hgroup_main_road)

variable.names(Hgroup_track)

Hgroup_track <- rename(Hgroup_track, 
                       agro_bin= X03_Hgroup_Cerrado_22s_HABMAT_agro,
                       agro_dist = X03_Hgroup_Cerrado_22s_HABMAT_EDGE_DIST_agro,
                       agro_patch = X03_Hgroup_Cerrado_22s_HABMAT_patch_AreaHA_agro,
                       forest_bin= X03_Hgroup_Cerrado_22s_HABMAT,
                       forest_dist = X03_Hgroup_Cerrado_22s_HABMAT_EDGE_DIST,
                       forest_patch = X03_Hgroup_Cerrado_22s_HABMAT_patch_AreaHA,
                       drainage_dist = H_dist_drainage,
                       aux_dist = H_dist_aux_road,
                       main_dist = H_dist_main_road)

Hgroup_track$group <- "H"

variable.names(Hgroup_jag_stat_track)

Hgroup_jag_stat_track  <- rename(Hgroup_jag_stat_track , 
                                 agro_bin= X03_Hgroup_Cerrado_22s_HABMAT_agro,
                                 agro_dist = X03_Hgroup_Cerrado_22s_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X03_Hgroup_Cerrado_22s_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X03_Hgroup_Cerrado_22s_HABMAT,
                                 forest_dist = X03_Hgroup_Cerrado_22s_HABMAT_EDGE_DIST,
                                 forest_patch = X03_Hgroup_Cerrado_22s_HABMAT_patch_AreaHA,
                                 drainage_dist = H_dist_drainage,
                                 aux_dist = H_dist_aux_road,
                                 main_dist = H_dist_main_road)

Hgroup_jag_stat_track$group <- "H"

# Cerrado joined ---------------------------------------------------------

Cerrado_trk <- Hgroup_track

Cerrado_stat_trak <- Hgroup_jag_stat_track

Cerrado_stat_trak$region <-  "Cerrado"

Cerrado_trk$region <- "Cerrado"

# Pantanal--------------------------------------------------------

##### Group J

Jgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/04_Jgroup_Pantanal_21S_HABMAT_agro.tif")

Jgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro.tif")

Jgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro.tif")

Jgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/04_Jgroup_Pantanal_21S_HABMAT.tif")

Jgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST.tif")

Jgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA.tif")

Jgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/J_dist_drainage.tif")

Jgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/J_dist_aux_road.tif")

Jgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/J_dist_main_road.tif")


##### Group K

Kgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/05_Kgroup_Pantanal_21S_HABMAT_agro.tif")

Kgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro.tif")

Kgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro.tif")

Kgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/05_Kgroup_Pantanal_21S_HABMAT.tif")

Kgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST.tif")

Kgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA.tif")

Kgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/K_dist_drainage.tif")

Kgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/K_dist_aux_road.tif")

Kgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/K_dist_main_road.tif")


##### GROUP L 


Lgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/06_Lgroup_Pantanal_21S_HABMAT_agro.tif")

Lgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro.tif")

Lgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro.tif")

Lgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/06_Lgroup_Pantanal_21S_HABMAT.tif")

Lgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST.tif")

Lgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA.tif")

Lgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/L_dist_drainage.tif")

Lgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/L_dist_aux_road.tif")

Lgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/L_dist_main_road.tif")

##### GROUP N 

Ngroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/07_Ngroup_Pantanal_21S_HABMAT_agro.tif")

Ngroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST_agro.tif")

Ngroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA_agro.tif")

Ngroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/07_Ngroup_Pantanal_21S_HABMAT.tif")

Ngroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST.tif")

Ngroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA.tif")

Ngroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/N_dist_drainage.tif")

Ngroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/N_dist_aux_road.tif")

Ngroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/N_dist_main_road.tif")

##### GROUP O 

Ogroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/08_Ogroup_Pantanal_21S_HABMAT_agro.tif")

Ogroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST_agro.tif")

Ogroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Agricultural_metrics/08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA_agro.tif")

Ogroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/08_Ogroup_Pantanal_21S_HABMAT.tif")

Ogroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST.tif")

Ogroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/Forest_metrics/08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA.tif")

Ogroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/O_dist_drainage.tif")

Ogroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/O_dist_aux_road.tif")

Ogroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Pantanal/O_dist_main_road.tif")

# J GROUP -----------------------------------------------------------------

## 

j12 <- dplyr::filter(jaguar, individual.local.identifier== "12")
j12$timestampTZ <- as.POSIXct(j12$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j12_track <- amt::mk_track(as.data.frame(j12), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j12 <- track_resample(j12_track, rate=hours(4), tolareance = minutes(15), start=1)

j12$speed<- amt::speed(j12)
boxplot(j12$speed)

speed_outlier <- which(j12$speed > 0.25)
j12<-   j12[- speed_outlier,]



j13 <- filter(jaguar, individual.local.identifier== "13")
j13$timestampTZ <- as.POSIXct(j13$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j13 <- j13[-c(1349),]
j13_track <- amt::mk_track(as.data.frame(j13), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j13 <- track_resample(j13_track, rate=hours(4), tolareance = minutes(15), start=1)

j13$speed<- amt::speed(j13)
boxplot(j13$speed)

speed_outlier <- which(j13$speed > 0.3)
j13<-   j13[- speed_outlier,]


j18 <- filter(jaguar, individual.local.identifier== "18")
j18$timestampTZ <- as.POSIXct(j18$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j18 <- j18[-c(1430),]
j18_track <- amt::mk_track(as.data.frame(j18), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j18 <- track_resample(j18_track, rate=hours(4), tolareance = minutes(15), start=1)

j18$speed<- amt::speed(j18)
boxplot(j18$speed)

speed_outlier <- which(j18$speed > 0.3)
j18<-   j18[- speed_outlier,]

j22 <- filter(jaguar, individual.local.identifier== "22")
j22$timestampTZ <- as.POSIXct(j22$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j22 <- j22[-c(2742),]
j22_track <- amt::mk_track(as.data.frame(j22), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j22 <- track_resample(j22_track, rate=hours(4), tolareance = minutes(15), start=1)

j22$speed<- amt::speed(j22)
boxplot(j22$speed)


j23 <- filter(jaguar, individual.local.identifier== "23")
j23$timestampTZ <- as.POSIXct(j23$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j23_track <- amt::mk_track(as.data.frame(j23), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j23 <- track_resample(j23_track, rate=hours(4), tolareance = minutes(15), start=1)

j23$speed<- amt::speed(j23)
boxplot(j23$speed)

speed_outlier <- which(j23$speed > 0.1)
j23<-   j23[- speed_outlier,]

j41 <- filter(jaguar, individual.local.identifier== "41")
j41$timestampTZ <- as.POSIXct(j41$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j41 <- j41[-c(1174),]
j41_track <- amt::mk_track(as.data.frame(j41), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j41 <- track_resample(j41_track, rate=hours(4), tolareance = minutes(15), start=1)

j41$speed<- amt::speed(j41)
boxplot(j41$speed)

speed_outlier <- which(j41$speed > 0.14)
j41<-   j41[- speed_outlier,]

j52 <- filter(jaguar, individual.local.identifier== "52")
j52$timestampTZ <- as.POSIXct(j52$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j52_track <- amt::mk_track(as.data.frame(j52), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j52 <- track_resample(j52_track, rate=hours(4), tolareance = minutes(15), start=1)

j52$speed<- amt::speed(j52)
boxplot(j52$speed)

speed_outlier <- which(j52$speed > 0.14)
j52<-   j52[- speed_outlier,]


j81 <- filter(jaguar, individual.local.identifier== "81")
j81$timestampTZ <- as.POSIXct(j81$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j81 <- j81[-c(9206),]
j81_track <- amt::mk_track(as.data.frame(j81), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j81 <- track_resample(j81_track, rate=hours(4), tolareance = minutes(15), start=1)

j81$speed<- amt::speed(j81)
boxplot(j81$speed)

speed_outlier <- which(j81$speed > 0.25)
j81<-   j81[- speed_outlier,]


j88 <- filter(jaguar, individual.local.identifier== "88")
j88$timestampTZ <- as.POSIXct(j88$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j88_track <- amt::mk_track(as.data.frame(j88), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j88 <- track_resample(j88_track, rate=hours(4), tolareance = minutes(15), start=1)

j88$speed<- amt::speed(j88)
boxplot(j88$speed)

speed_outlier <- which(j88$speed > 0.14)
j88<-   j88[- speed_outlier,]


j116 <- filter(jaguar, individual.local.identifier== "116")
j116$timestampTZ <- as.POSIXct(j116$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j116_track <- amt::mk_track(as.data.frame(j116), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j116 <- track_resample(j116_track, rate=hours(4), tolareance = minutes(15), start=1)

j116$speed<- amt::speed(j116)
boxplot(j116$speed)

speed_outlier <- which(j116$speed > 0.3)
j116<-   j116[- speed_outlier,]

j117 <- filter(jaguar, individual.local.identifier== "117")
j117$timestampTZ <- as.POSIXct(j117$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
j117_track <- amt::mk_track(as.data.frame(j117), X,Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j117 <- track_resample(j117_track, rate=hours(4), tolareance = minutes(15), start=1)

j117$speed<- amt::speed(j117)
boxplot(j117$speed)

speed_outlier <- which(j117$speed > 0.15)
j117<-   j117[- speed_outlier,]


Jgroup_jag <- bind_rows(j12, j13,j18,j22,j23,j41, j52, j81, j88, j116, j117)
Jgroup_jag <- as.data.frame(Jgroup_jag)


Jgroup_mov <- move(x=Jgroup_jag$x_,  y=Jgroup_jag$y_, time= as.POSIXct(Jgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Cuiaba"), data= Jgroup_jag, proj=CRS("+init=epsg:32721"), animal=Jgroup_jag$id)


# Prepare columns movement ------------------------------------------------

#### JAGUAR 012
j12_mov <- Jgroup_mov[["X12"]]
j12_recurse = getRecursions(j12_mov , 250) 
j12_recurse_df <-  as.data.frame(j12_recurse$revisitStats)
j12_recurse_df$id <- "12"
j12_recurse_df$clumpy <- 0.573
j12$visits <- j12_recurse$revisits
plot(j12_recurse,j12_mov)

j12_track <- amt::mk_track(as.data.frame(j12_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j12_track <- arrange(j12_track, t_)

j12$angle<- amt::direction_rel(j12_track)
j12$sl <- amt::step_lengths(j12_track)
j12$speed<- amt::speed(j12_track)
j12$clumpy <- 0.573

### Outliers review
### 
boxplot(j12$visits)
boxplot(j12_recurse_df$timeInside)
boxplot(j12_recurse_df$timeSinceLastVisit)
boxplot(j12$speed)

summary(j12$speed)

#### JAGUAR 013
j13_mov <- Jgroup_mov[["X13"]]
j13_recurse = getRecursions(j13_mov , 250) 
j13_recurse_df <-  as.data.frame(j13_recurse$revisitStats)
j13_recurse_df$id <- "13"
j13_recurse_df$clumpy <- 0.471
j13$visits <- j13_recurse$revisits
plot(j13_recurse,j13_mov)

j13_track <- amt::mk_track(as.data.frame(j13_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j13_track <- arrange(j13_track, t_)

j13$angle<- amt::direction_rel(j13_track)
j13$sl <- amt::step_lengths(j13_track)
j13$speed<- amt::speed(j13_track)
j13$clumpy <- 0.471

### Outliers review
### 
boxplot(j13$visits)
boxplot(j13_recurse_df$timeInside)
boxplot(j13_recurse_df$timeSinceLastVisit)
boxplot(j13$speed)

summary(j13$speed)

#### JAGUAR 018
j18_mov <- Jgroup_mov[["X18"]]
j18_recurse = getRecursions(j18_mov , 250) 
j18_recurse_df <-  as.data.frame(j18_recurse$revisitStats)
j18_recurse_df$id <- "18"
j18_recurse_df$clumpy <- 0.597
j18$visits <- j18_recurse$revisits
plot(j18_recurse,j18_mov)

j18_track <- amt::mk_track(as.data.frame(j18_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j18_track <- arrange(j18_track, t_)

j18$angle<- amt::direction_rel(j18_track)
j18$sl <- amt::step_lengths(j18_track)
j18$speed<- amt::speed(j18_track)
j18$clumpy <- 0.597

### Outliers review
### 
boxplot(j18$visits)
boxplot(j18_recurse_df$timeInside)
boxplot(j18_recurse_df$timeSinceLastVisit)
boxplot(j18$speed)

summary(j18$speed)

#### JAGUAR 022
j22_mov <- Jgroup_mov[["X22"]]

j22_recurse = getRecursions(j22_mov , 250) 
j22_recurse_df <-  as.data.frame(j22_recurse$revisitStats)
j22_recurse_df$id <- "22"
j22_recurse_df$clumpy <- 0.552
j22$visits <- j22_recurse$revisits
plot(j22_recurse,j22_mov)

j22_track <- amt::mk_track(as.data.frame(j22_mov), x_,y_, .t= t_, id= id,
                           sex=sex, season=season, moon.phase=moon.phase, 
                           event=event)


j22_track <- arrange(j22_track, t_)

j22$angle<- amt::direction_rel(j22_track)
j22$sl <- amt::step_lengths(j22_track)
j22$speed<- amt::speed(j22_track)
j22$clumpy <- 0.552

### Outliers review
### 
boxplot(j22$visits)
boxplot(j22_recurse_df$timeInside)
boxplot(j22_recurse_df$timeSinceLastVisit)
boxplot(j22$speed)

summary(j22$speed)


#### JAGUAR 023
j23_mov <- Jgroup_mov[["X23"]]
j23_recurse = getRecursions(j23_mov , 250) 
j23_recurse_df <-  as.data.frame(j23_recurse$revisitStats)
j23_recurse_df$id <- "23"
j23_recurse_df$clumpy <- 0.570
j23$visits <- j23_recurse$revisits
plot(j23_recurse,j23_mov)

j23_track <- amt::mk_track(as.data.frame(j23_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j23_track <- arrange(j23_track, t_)

j23$angle<- amt::direction_rel(j23_track)
j23$sl <- amt::step_lengths(j23_track)
j23$speed<- amt::speed(j23_track)
j23$clumpy <- 0.570

### Outliers review
### 
boxplot(j23$visits)
boxplot(j23_recurse_df$timeInside)
boxplot(j23_recurse_df$timeSinceLastVisit)
boxplot(j23$speed)

summary(j23$speed)

#### JAGUAR 041
j41_mov <- Jgroup_mov[["X41"]]
j41_recurse = getRecursions(j41_mov , 250) 
j41_recurse_df <-  as.data.frame(j41_recurse$revisitStats)
j41_recurse_df$id <- "41"
j41_recurse_df$clumpy <- 0.561
j41$visits <- j41_recurse$revisits
plot(j41_recurse,j41_mov)

j41_track <- amt::mk_track(as.data.frame(j41_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j41_track <- arrange(j41_track, t_)

j41$angle<- amt::direction_rel(j41_track)
j41$sl <- amt::step_lengths(j41_track)
j41$speed<- amt::speed(j41_track)
j41$clumpy <- 0.561

### Outliers review
### 
boxplot(j41$visits)
boxplot(j41_recurse_df$timeInside)
boxplot(j41_recurse_df$timeSinceLastVisit)
boxplot(j41$speed)

summary(j41$speed)

#### JAGUAR 052
j52_mov <- Jgroup_mov[["X52"]]
j52_recurse = getRecursions(j52_mov , 250) 
j52_recurse_df <-  as.data.frame(j52_recurse$revisitStats)
j52_recurse_df$id <- "52"
j52_recurse_df$clumpy <- 0.480
j52$visits <- j52_recurse$revisits
plot(j52_recurse,j52_mov)

j52_track <- amt::mk_track(as.data.frame(j52_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j52_track <- arrange(j52_track, t_)

j52$angle<- amt::direction_rel(j52_track)
j52$sl <- amt::step_lengths(j52_track)
j52$speed<- amt::speed(j52_track)
j52$clumpy <- 0.480

### Outliers review
### 
boxplot(j52$visits)
boxplot(j52_recurse_df$timeInside)
boxplot(j52_recurse_df$timeSinceLastVisit)
boxplot(j52$speed)

summary(j52$speed)

#### JAGUAR 081
j81_mov <- Jgroup_mov[["X81"]]
j81_recurse = getRecursions(j81_mov , 250) 
j81_recurse_df <-  as.data.frame(j81_recurse$revisitStats)
j81_recurse_df$id <- "81"
j81_recurse_df$clumpy <- 0.602
j81$visits <- j81_recurse$revisits
plot(j81_recurse,j81_mov)

j81_track <- amt::mk_track(as.data.frame(j81_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j81_track <- arrange(j81_track, t_)

j81$angle<- amt::direction_rel(j81_track)
j81$sl <- amt::step_lengths(j81_track)
j81$speed<- amt::speed(j81_track)
j81$clumpy <- 0.602

### Outliers review
### 
boxplot(j81$visits)
boxplot(j81_recurse_df$timeInside)
boxplot(j81_recurse_df$timeSinceLastVisit)
boxplot(j81$speed)

summary(j81$speed)

#### JAGUAR 088
j88_mov <- Jgroup_mov[["X88"]]
j88_recurse = getRecursions(j88_mov , 250) 
j88_recurse_df <-  as.data.frame(j88_recurse$revisitStats)
j88_recurse_df$id <- "88"
j88_recurse_df$clumpy <- 0.590
j88$visits <- j88_recurse$revisits
plot(j88_recurse,j88_mov)

j88_track <- amt::mk_track(as.data.frame(j88_mov), x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j88_track <- arrange(j88_track, t_)

j88$angle<- amt::direction_rel(j88_track)
j88$sl <- amt::step_lengths(j88_track)
j88$speed<- amt::speed(j88_track)
j88$clumpy <- 0.590

### Outliers review
### 
boxplot(j88$visits)
boxplot(j88_recurse_df$timeInside)
boxplot(j88_recurse_df$timeSinceLastVisit)
boxplot(j88$speed)

summary(j88$speed)

#### JAGUAR 116
j116_mov <- Jgroup_mov[["X116"]]
j116_recurse = getRecursions(j116_mov , 250) 
j116_recurse_df <-  as.data.frame(j116_recurse$revisitStats)
j116_recurse_df$id <- "116"
j116_recurse_df$clumpy <- 0.572
j116$visits <- j116_recurse$revisits
plot(j116_recurse,j116_mov)

j116_track <- amt::mk_track(as.data.frame(j116_mov), x_,y_, .t= t_, id= id, sex=sex, season=season, moon.phase=moon.phase, event=event)


j116_track <- arrange(j116_track, t_)

j116$angle<- amt::direction_rel(j116_track)
j116$sl <- amt::step_lengths(j116_track)
j116$speed<- amt::speed(j116_track)
j116$clumpy <- 0.572

plot(j116$x_, j116$y_)

### Outliers review
### 
boxplot(j116$visits)
boxplot(j116_recurse_df$timeInside)
boxplot(j116_recurse_df$timeSinceLastVisit)
boxplot(j116$speed)

summary(j116$speed)


#### JAGUAR 117
j117_mov <- Jgroup_mov[["X117"]]
j117_recurse = getRecursions(j117_mov , 250) 
j117_recurse_df <-  as.data.frame(j117_recurse$revisitStats)
j117_recurse_df$id <- "117"
j117_recurse_df$clumpy <- 0.504
j117$visits <- j117_recurse$revisits
plot(j117_recurse,j117_mov)

j117_track <- amt::mk_track(as.data.frame(j117_mov),x_,y_, .t= t_, id= id,sex=sex, season=season, moon.phase=moon.phase, event=event)


j117_track <- arrange(j117_track, t_)

j117$angle<- amt::direction_rel(j117_track)
j117$sl <- amt::step_lengths(j117_track)
j117$speed<- amt::speed(j117_track)
j117$clumpy <- 0.504

plot(j117$x_, j117$y_)

### Outliers review
### 
boxplot(j117$visits)
boxplot(j117_recurse_df$timeInside)
boxplot(j117_recurse_df$timeSinceLastVisit)
boxplot(j117$speed)

summary(j117$speed)

# Final step --------------------------------------------------------------


Jgroup_jag <- bind_rows(j12, j13,j18,j22,j23,j41, j52, j81, j88, j116, j117)

Jgroup_jag$group <- "J"

Jgroup_jag_stat <-bind_rows(j12_recurse_df, j13_recurse_df,j18_recurse_df,
                            j22_recurse_df,j23_recurse_df,j41_recurse_df, j52_recurse_df,
                            j81_recurse_df, j88_recurse_df,
                            j116_recurse_df, j117_recurse_df)

Jgroup_jag  <- arrange(Jgroup_jag ,id,t_)

Jgroup_jag <- as.data.frame(Jgroup_jag)

Jgroup_mov <- move(x=Jgroup_jag$x_, y=Jgroup_jag$y_, time= as.POSIXct(Jgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Cuiaba"), data= Jgroup_jag, proj=CRS("+init=epsg:32721"), animal=Jgroup_jag$id, clumpy=clumpy)

Jgroup_track <- amt::mk_track(as.data.frame(Jgroup_mov), x_, y_, .t= t_, id= id, sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)


Jgroup_track <- Jgroup_track %>% 
  extract_covariates(Jgroup_agro_bi) %>%  
  extract_covariates(Jgroup_agro_dist) %>% 
  extract_covariates(Jgroup_agro_patch) %>%
  extract_covariates(Jgroup_forest_bi) %>%  
  extract_covariates(Jgroup_forest_dist) %>% 
  extract_covariates(Jgroup_forest_patch) %>% 
  extract_covariates(Jgroup_drainage) %>% 
  extract_covariates(Jgroup_aux_road) %>% 
  extract_covariates(Jgroup_main_road) 


Jgroup_jag_stat_track <- amt::mk_track(Jgroup_jag_stat, x,y, id= id, coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Jgroup_jag_stat_track <- Jgroup_jag_stat_track %>% 
  extract_covariates(Jgroup_agro_bi) %>%  
  extract_covariates(Jgroup_agro_dist) %>% 
  extract_covariates(Jgroup_agro_patch) %>%
  extract_covariates(Jgroup_forest_bi) %>%  
  extract_covariates(Jgroup_forest_dist) %>% 
  extract_covariates(Jgroup_forest_patch) %>% 
  extract_covariates(Jgroup_drainage) %>% 
  extract_covariates(Jgroup_aux_road) %>% 
  extract_covariates(Jgroup_main_road) 

variable.names(Jgroup_track)

Jgroup_track <- rename(Jgroup_track,
                       agro_bin= X04_Jgroup_Pantanal_21S_HABMAT_agro,
                       agro_dist = X04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X04_Jgroup_Pantanal_21S_HABMAT,
                       forest_dist = X04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                       forest_patch = X04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                       drainage_dist = J_dist_drainage,
                       aux_dist = J_dist_aux_road,
                       main_dist = J_dist_main_road)

Jgroup_track$group <- "J"

variable.names(Jgroup_jag_stat_track)

Jgroup_jag_stat_track  <- rename(Jgroup_jag_stat_track , 
                                 agro_bin= X04_Jgroup_Pantanal_21S_HABMAT_agro,
                                 agro_dist = X04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X04_Jgroup_Pantanal_21S_HABMAT,
                                 forest_dist = X04_Jgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X04_Jgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = J_dist_drainage,
                                 aux_dist = J_dist_aux_road,
                                 main_dist = J_dist_main_road)

Jgroup_jag_stat_track$group <- "J"

# K group -----------------------------------------------------------------

## 

j27 <- filter(jaguar, individual.local.identifier== "27")
j27$timestampTZ <- as.POSIXct(j27$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j27$X, j27$Y)
j27_track <- amt::mk_track(as.data.frame(j27), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j27 <- track_resample(j27_track, rate=hours(4), tolareance = minutes(15), start=1)
j27$speed<- amt::speed(j27)
boxplot(j27$speed)

speed_outlier <- which(j27$speed > 0.25)
j27<-   j27[- speed_outlier,]



j31 <- filter(jaguar, individual.local.identifier== "31")
j31$timestampTZ <- as.POSIXct(j31$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j31$X, j31$Y)
j31_track <- amt::mk_track(as.data.frame(j31),X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j31 <- track_resample(j31_track, rate=hours(4), tolareance = minutes(15), start=1)

j31$speed<- amt::speed(j31)
boxplot(j31$speed)

speed_outlier <- which(j31$speed > 0.10)
j31<-   j31[- speed_outlier,]


j32 <- filter(jaguar, individual.local.identifier== "32")
j32$timestampTZ <- as.POSIXct(j32$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j32$X, j32$Y)
j32_track <- amt::mk_track(as.data.frame(j32),X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j32 <- track_resample(j32_track, rate=hours(4), tolareance = minutes(15), start=1)

j32$speed<- amt::speed(j32)
boxplot(j32$speed)

speed_outlier <- which(j32$speed > 0.25)
j32<-   j32[- speed_outlier,]


j33 <- filter(jaguar, individual.local.identifier== "33")
j33$timestampTZ <- as.POSIXct(j33$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j33$X, j33$Y)
j33_track <- amt::mk_track(as.data.frame(j33), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j33 <- track_resample(j33_track, rate=hours(4), tolareance = minutes(15), start=1)

j33$speed<- amt::speed(j33)
boxplot(j33$speed)


j53 <- filter(jaguar, individual.local.identifier== "53")
j53$timestampTZ <- as.POSIXct(j53$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j53$X, j53$Y)
j53_track <- amt::mk_track(as.data.frame(j53), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j53 <- track_resample(j53_track, rate=hours(4), tolareance = minutes(15), start=1)

j53$speed<- amt::speed(j53)
boxplot(j53$speed)

speed_outlier <- which(j53$speed > 0.30)
j53 <-   j53[- speed_outlier,]


j55 <- filter(jaguar, individual.local.identifier== "55")
j55$timestampTZ <- as.POSIXct(j55$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j55$X, j55$Y)
point_outlier <- which(j55$X > 546000)
j55 <-   j55[- point_outlier,]
plot(j55$X, j55$Y)
j55_track <- amt::mk_track(as.data.frame(j55), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j55 <- track_resample(j55_track, rate=hours(4), tolareance = minutes(15), start=1)

j55$speed<- amt::speed(j55)
boxplot(j55$speed)

speed_outlier <- which(j55$speed > 0.20)
j55 <-   j55[- speed_outlier,]

j59 <- filter(jaguar, individual.local.identifier== "59")
j59$timestampTZ <- as.POSIXct(j59$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j59$X, j59$Y)
j59_track <- amt::mk_track(as.data.frame(j59), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j59 <- track_resample(j59_track, rate=hours(4), tolareance = minutes(15), start=1)

j59$speed<- amt::speed(j59)
boxplot(j59$speed)

j60 <- filter(jaguar, individual.local.identifier== "60")
j60$timestampTZ <- as.POSIXct(j60$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j60$X, j60$Y)
j60_track <- amt::mk_track(as.data.frame(j60), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j60 <- track_resample(j60_track, rate=hours(4), tolareance = minutes(15), start=1)

j60$speed<- amt::speed(j60)
boxplot(j60$speed)

speed_outlier <- which(j60$speed > 0.40)
j60 <-   j60[- speed_outlier,]

j61 <- filter(jaguar, individual.local.identifier== "61")
j61$timestampTZ <- as.POSIXct(j61$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j61$X, j61$Y)
j61_track <- amt::mk_track(as.data.frame(j61), X, Y, .t= timestampTZ, id= individual.local.identifier,sex=sex, season=season, moon.phase=moon.phase, event=event)
j61 <- track_resample(j61_track, rate=hours(4), tolareance = minutes(15), start=1)

j61$speed<- amt::speed(j61)
boxplot(j61$speed)

speed_outlier <- which(j61$speed > 0.15)
j61 <-   j61[- speed_outlier,]

Kgroup_jag <- bind_rows(j27, j31,j32,j33,j53,j55,j59,j60,j61)
Kgroup_jag <- as.data.frame(Kgroup_jag)


Kgroup_mov <- move(x=Kgroup_jag$x_,  y=Kgroup_jag$y_, time= as.POSIXct(Kgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Cuiaba"), data= Kgroup_jag, proj=CRS("+init=epsg:32721"), animal=Kgroup_jag$id)


# Prepare columns movement ------------------------------------------------

#### JAGUAR 027
j27_mov <- Kgroup_mov[["X27"]]
j27_recurse = getRecursions(j27_mov , 250) 
j27_recurse_df <-  as.data.frame(j27_recurse$revisitStats)
j27_recurse_df$id <- "27"
j27_recurse_df$clumpy <- 0.638
j27$visits <- j27_recurse$revisits
plot(j27_recurse,j27_mov)

j27_track <- amt::mk_track(as.data.frame(j27_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j27_track <- arrange(j27_track, t_)

j27$angle<- amt::direction_rel(j27_track)
j27$sl <- amt::step_lengths(j27_track)
j27$speed<- amt::speed(j27_track)
j27$clumpy <- 0.638

### Outliers review
### 
boxplot(j27$visits)
boxplot(j27_recurse_df$timeInside)
boxplot(j27_recurse_df$timeSinceLastVisit)
boxplot(j27$speed)

summary(j27$speed)

#### JAGUAR 031
j31_mov <- Kgroup_mov[["X31"]]
j31_recurse = getRecursions(j31_mov , 250) 
j31_recurse_df <-  as.data.frame(j31_recurse$revisitStats)
j31_recurse_df$id <- "31"
j31_recurse_df$clumpy <- 0.678
j31$visits <- j31_recurse$revisits
plot(j31_recurse,j31_mov)

j31_track <- amt::mk_track(as.data.frame(j31_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j31_track <- arrange(j31_track, t_)

j31$angle<- amt::direction_rel(j31_track)
j31$sl <- amt::step_lengths(j31_track)
j31$speed<- amt::speed(j31_track)
j31$clumpy <- 0.678

### Outliers review
### 
boxplot(j31$visits)
boxplot(j31_recurse_df$timeInside)
boxplot(j31_recurse_df$timeSinceLastVisit)
boxplot(j31$speed)

summary(j31$speed)


#### JAGUAR 032
j32_mov <- Kgroup_mov[["X32"]]
j32_recurse = getRecursions(j32_mov , 250) 
j32_recurse_df <-  as.data.frame(j32_recurse$revisitStats)
j32_recurse_df$id <- "32"
j32_recurse_df$clumpy <- 0.600
j32$visits <- j32_recurse$revisits
plot(j32_recurse,j32_mov)

j32_track <- amt::mk_track(as.data.frame(j32_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j32_track <- arrange(j32_track, t_)

j32$angle<- amt::direction_rel(j32_track)
j32$sl <- amt::step_lengths(j32_track)
j32$speed<- amt::speed(j32_track)
j32$clumpy <- 0.600

### Outliers review
### 
boxplot(j32$visits)
boxplot(j32_recurse_df$timeInside)
boxplot(j32_recurse_df$timeSinceLastVisit)
boxplot(j32$speed)

summary(j32$speed)


#### JAGUAR 033
j33_mov <- Kgroup_mov[["X33"]]
j33_recurse = getRecursions(j33_mov , 250) 
j33_recurse_df <-  as.data.frame(j33_recurse$revisitStats)
j33_recurse_df$id <- "33"
j33_recurse_df$clumpy <- 0.630
j33$visits <- j33_recurse$revisits
plot(j33_recurse,j33_mov)

j33_track <- amt::mk_track(as.data.frame(j33_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j33_track <- arrange(j33_track, t_)

j33$angle<- amt::direction_rel(j33_track)
j33$sl <- amt::step_lengths(j33_track)
j33$speed<- amt::speed(j33_track)
j33$clumpy <- 0.630

### Outliers review
### 
boxplot(j33$visits)
boxplot(j33_recurse_df$timeInside)
boxplot(j33_recurse_df$timeSinceLastVisit)
boxplot(j33$speed)

summary(j33$speed)


#### JAGUAR 053
j53_mov <- Kgroup_mov[["X53"]]
j53_recurse = getRecursions(j53_mov , 250) 
j53_recurse_df <-  as.data.frame(j53_recurse$revisitStats)
j53_recurse_df$id <- "53"
j53_recurse_df$clumpy <- 0.611
j53$visits <- j53_recurse$revisits
plot(j53_recurse,j53_mov)

j53_track <- amt::mk_track(as.data.frame(j53_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j53_track <- arrange(j53_track, t_)

j53$angle<- amt::direction_rel(j53_track)
j53$sl <- amt::step_lengths(j53_track)
j53$speed<- amt::speed(j53_track)
j53$clumpy <- 0.611

### Outliers review
### 
boxplot(j53$visits)
boxplot(j53_recurse_df$timeInside)
boxplot(j53_recurse_df$timeSinceLastVisit)
boxplot(j53$speed)

summary(j53$speed)

#### JAGUAR 055
j55_mov <- Kgroup_mov[["X55"]]
j55_recurse = getRecursions(j55_mov , 250) 
j55_recurse_df <-  as.data.frame(j55_recurse$revisitStats)
j55_recurse_df$id <- "55"
j55_recurse_df$clumpy <- 0.693
j55$visits <- j55_recurse$revisits
plot(j55_recurse,j55_mov)

j55_track <- amt::mk_track(as.data.frame(j55_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j55_track <- arrange(j55_track, t_)

j55$angle<- amt::direction_rel(j55_track)
j55$sl <- amt::step_lengths(j55_track)
j55$speed<- amt::speed(j55_track)
j55$clumpy <- 0.693

### Outliers review
### 
boxplot(j55$visits)
boxplot(j55_recurse_df$timeInside)
boxplot(j55_recurse_df$timeSinceLastVisit)
boxplot(j55$speed)

summary(j55$speed)


#### JAGUAR 059
j59_mov <- Kgroup_mov[["X59"]]
j59_recurse = getRecursions(j59_mov , 250) 
j59_recurse_df <-  as.data.frame(j59_recurse$revisitStats)
j59_recurse_df$id <- "59"
j59_recurse_df$clumpy <- 0.606
j59$visits <- j59_recurse$revisits
plot(j59_recurse,j59_mov)

j59_track <- amt::mk_track(as.data.frame(j59_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j59_track <- arrange(j59_track, t_)

j59$angle<- amt::direction_rel(j59_track)
j59$sl <- amt::step_lengths(j59_track)
j59$speed<- amt::speed(j59_track)
j59$clumpy <- 0.606

### Outliers review
### 
boxplot(j59$visits)
boxplot(j59_recurse_df$timeInside)
boxplot(j59_recurse_df$timeSinceLastVisit)
boxplot(j59$speed)

summary(j59$speed)


#### JAGUAR 060
j60_mov <- Kgroup_mov[["X60"]]
j60_recurse = getRecursions(j60_mov , 250) 
j60_recurse_df <-  as.data.frame(j60_recurse$revisitStats)
j60_recurse_df$id <- "60"
j60_recurse_df$clumpy <- 0.620
j60$visits <- j60_recurse$revisits
plot(j60_recurse,j60_mov)

j60_track <- amt::mk_track(as.data.frame(j60_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j60_track <- arrange(j60_track, t_)

j60$angle<- amt::direction_rel(j60_track)
j60$sl <- amt::step_lengths(j60_track)
j60$speed<- amt::speed(j60_track)
j60$clumpy <- 0.620

### Outliers review
### 
boxplot(j60$visits)
boxplot(j60_recurse_df$timeInside)
boxplot(j60_recurse_df$timeSinceLastVisit)
boxplot(j60$speed)

summary(j60$speed)

#### JAGUAR 061
j61_mov <- Kgroup_mov[["X61"]]
j61_recurse = getRecursions(j61_mov , 250) 
j61_recurse_df <-  as.data.frame(j61_recurse$revisitStats)
j61_recurse_df$id <- "61"
j61_recurse_df$clumpy <- 0.637
j61$visits <- j61_recurse$revisits
plot(j61_recurse,j61_mov)

j61_track <- amt::mk_track(as.data.frame(j61_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j61_track <- arrange(j61_track, t_)

j61$angle<- amt::direction_rel(j61_track)
j61$sl <- amt::step_lengths(j61_track)
j61$speed<- amt::speed(j61_track)
j61$clumpy <- 0.637

### Outliers review
### 
boxplot(j61$visits)
boxplot(j61_recurse_df$timeInside)
boxplot(j61_recurse_df$timeSinceLastVisit)
boxplot(j61$speed)

summary(j61$speed)


# Final step --------------------------------------------------------------
# 
Kgroup_jag <- bind_rows(j27, j31,j32,j33,j53,j55,j59,j60,j61)


Kgroup_jag_stat <-bind_rows(j27_recurse_df, j31_recurse_df,
                            j32_recurse_df,j33_recurse_df,j53_recurse_df,
                            j55_recurse_df,j59_recurse_df,j60_recurse_df,
                            j61_recurse_df)

Kgroup_jag  <- arrange(Kgroup_jag ,id,t_)
Kgroup_jag <- as.data.frame(Kgroup_jag)

Kgroup_mov <- move(x=Kgroup_jag$x_,y=Kgroup_jag$y_, time= as.POSIXct(Kgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Kgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Kgroup_jag$id, clumpy=clumpy)

Kgroup_track <- amt::mk_track(as.data.frame(Kgroup_mov), x_, y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Kgroup_track <- Kgroup_track %>% 
  extract_covariates(Kgroup_agro_bi) %>%  
  extract_covariates(Kgroup_agro_dist) %>% 
  extract_covariates(Kgroup_agro_patch) %>%
  extract_covariates(Kgroup_forest_bi) %>%  
  extract_covariates(Kgroup_forest_dist) %>% 
  extract_covariates(Kgroup_forest_patch) %>% 
  extract_covariates(Kgroup_drainage) %>% 
  extract_covariates(Kgroup_aux_road) %>% 
  extract_covariates(Kgroup_main_road) 

variable.names(Kgroup_jag_stat)



Kgroup_jag_stat_track <- amt::mk_track(Kgroup_jag_stat, x, y, id= id, crs=crs("+init=epsg:32721"),  coordIdx= coordIdx, visitIdx=visitIdx,
entranceTime=entranceTime, exitTime=exitTime,
timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Kgroup_jag_stat_track <- Kgroup_jag_stat_track %>% 
  extract_covariates(Kgroup_agro_bi) %>%  
  extract_covariates(Kgroup_agro_dist) %>% 
  extract_covariates(Kgroup_agro_patch) %>%
  extract_covariates(Kgroup_forest_bi) %>%  
  extract_covariates(Kgroup_forest_dist) %>% 
  extract_covariates(Kgroup_forest_patch) %>% 
  extract_covariates(Kgroup_drainage) %>% 
  extract_covariates(Kgroup_aux_road) %>% 
  extract_covariates(Kgroup_main_road) 

variable.names(Kgroup_track)

Kgroup_track <- rename(Kgroup_track, 
                       agro_bin= X05_Kgroup_Pantanal_21S_HABMAT_agro,
                       agro_dist = X05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X05_Kgroup_Pantanal_21S_HABMAT,
                       forest_dist = X05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                       forest_patch = X05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                       drainage_dist = K_dist_drainage,
                       aux_dist = K_dist_aux_road,
                       main_dist = K_dist_main_road)

Kgroup_track$group <- "K"

variable.names(Kgroup_jag_stat_track )

Kgroup_jag_stat_track  <- rename(Kgroup_jag_stat_track , 
                                 agro_bin= X05_Kgroup_Pantanal_21S_HABMAT_agro,
                                 agro_dist = X05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X05_Kgroup_Pantanal_21S_HABMAT,
                                 forest_dist = X05_Kgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X05_Kgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = K_dist_drainage,
                                 aux_dist = K_dist_aux_road,
                                 main_dist = K_dist_main_road)

Kgroup_jag_stat_track$group <- "K"


# L Group -------------------------------------------------------------------

j28 <- filter(jaguar, individual.local.identifier== "28")
j28$timestampTZ <- as.POSIXct(j28$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j28$X, j28$Y)
j28_track <- amt::mk_track(as.data.frame(j28), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j28 <- track_resample(j28_track, rate=hours(4), tolareance = minutes(15), start=1)

j28$speed<- amt::speed(j28)
boxplot(j28$speed)

speed_outlier <- which(j28$speed > 0.15)
j28 <-   j28[- speed_outlier,]


j54 <- filter(jaguar, individual.local.identifier== "54")
j54$timestampTZ <- as.POSIXct(j54$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j54$X, j54$Y)
j54_track <- amt::mk_track(as.data.frame(j54), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex,moon.phase=moon.phase, event=event)
j54 <- track_resample(j54_track, rate=hours(4), tolareance = minutes(15), start=1)

j54$speed<- amt::speed(j54)
boxplot(j54$speed)

speed_outlier <- which(j54$speed > 0.10)
j54 <- j54[- speed_outlier,]

j56 <- filter(jaguar, individual.local.identifier== "56")
j56$timestampTZ <- as.POSIXct(j56$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j56$X, j56$Y)
j56_track <- amt::mk_track(as.data.frame(j56), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex,moon.phase=moon.phase, event=event)
j56 <- track_resample(j56_track, rate=hours(4), tolareance = minutes(15), start=1)

j56$speed<- amt::speed(j56)
boxplot(j56$speed)

speed_outlier <- which(j56$speed > 0.13)
j56 <- j56[- speed_outlier,]

j57 <- filter(jaguar, individual.local.identifier== "57")
j57$timestampTZ <- as.POSIXct(j57$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j57$X, j57$Y)
j57_track <- amt::mk_track(as.data.frame(j57), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex,moon.phase=moon.phase, event=event)
j57 <- track_resample(j57_track, rate=hours(4), tolareance = minutes(15), start=1)

j57$speed<- amt::speed(j57)
boxplot(j57$speed)


Lgroup_jag <- bind_rows(j28, j54, j56, j57)

Lgroup_jag <- as.data.frame(Lgroup_jag)

Lgroup_mov <- move(x=Lgroup_jag$x_, y=Lgroup_jag$y_, time= as.POSIXct(Lgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Lgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal= Lgroup_jag$id)


# Prepare columns movement ------------------------------------------------

#### JAGUAR 028
j28_mov <- Lgroup_mov[["X28"]]
j28_recurse = getRecursions(j28_mov , 250) 
j28_recurse_df <-  as.data.frame(j28_recurse$revisitStats)
j28_recurse_df$id <- "28"
j28_recurse_df$clumpy <- 0.645
j28$visits <- j28_recurse$revisits
plot(j28_recurse,j28_mov)


j28_track <- amt::mk_track(as.data.frame(j28_mov),  x_,y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)

variable.names(as.data.frame(j28_mov))

j28_track <- arrange(j28_track, t_)

j28$angle<- amt::direction_rel(j28_track)
j28$sl <- amt::step_lengths(j28_track)
j28$speed<- amt::speed(j28_track)
j28$clumpy <- 0.645

### Outliers review
### 
boxplot(j28$visits)
boxplot(j28_recurse_df$timeInside)
boxplot(j28_recurse_df$timeSinceLastVisit)
boxplot(j28$speed)

summary(j28$speed)

#### JAGUAR 054
j54_mov <- Lgroup_mov[["X54"]]
j54_recurse = getRecursions(j54_mov , 250) 
j54_recurse_df <-  as.data.frame(j54_recurse$revisitStats)
j54_recurse_df$id <- "54"
j54_recurse_df$clumpy <- 0.692
j54$visits <- j54_recurse$revisits
plot(j54_recurse,j54_mov)

j54_track <- amt::mk_track(as.data.frame(j54_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j54_track <- arrange(j54_track, t_)

j54$angle<- amt::direction_rel(j54_track)
j54$sl <- amt::step_lengths(j54_track)
j54$speed<- amt::speed(j54_track)
j54$clumpy <- 0.692

### Outliers review
### 
boxplot(j54$visits)
boxplot(j54_recurse_df$timeInside)
boxplot(j54_recurse_df$timeSinceLastVisit)
boxplot(j54$speed)

summary(j54$speed)

#### JAGUAR 056
j56_mov <- Lgroup_mov[["X56"]]
j56_recurse = getRecursions(j56_mov , 250) 
j56_recurse_df <-  as.data.frame(j56_recurse$revisitStats)
j56_recurse_df$id <- "56"
j56_recurse_df$clumpy <- 0.812
j56$visits <- j56_recurse$revisits
plot(j56_recurse,j56_mov)

j56_track <- amt::mk_track(as.data.frame(j56_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j56_track <- arrange(j56_track, t_)

j56$angle<- amt::direction_rel(j56_track)
j56$sl <- amt::step_lengths(j56_track)
j56$speed<- amt::speed(j56_track)
j56$clumpy <- 0.812

### Outliers review
### 
boxplot(j56$visits)
boxplot(j56_recurse_df$timeInside)
boxplot(j56_recurse_df$timeSinceLastVisit)
boxplot(j56$speed)

summary(j56$speed)

#### JAGUAR 057
j57_mov <- Lgroup_mov[["X57"]]
j57_recurse = getRecursions(j57_mov , 250) 
j57_recurse_df <-  as.data.frame(j57_recurse$revisitStats)
j57_recurse_df$id <- "57"
j57_recurse_df$clumpy <- 0.702
j57$visits <- j57_recurse$revisits
plot(j57_recurse,j57_mov)

j57_track <- amt::mk_track(as.data.frame(j57_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j57_track <- arrange(j57_track, t_)

j57$angle<- amt::direction_rel(j57_track)
j57$sl <- amt::step_lengths(j57_track)
j57$speed<- amt::speed(j57_track)
j57$clumpy <- 0.702

### Outliers review
### 
boxplot(j57$visits)
boxplot(j57_recurse_df$timeInside)
boxplot(j57_recurse_df$timeSinceLastVisit)
boxplot(j57$speed)

summary(j57$speed)

# Final step --------------------------------------------------------------

Lgroup_jag <- bind_rows(j28, j54, j56, j57)

Lgroup_jag_stat<- bind_rows(j28_recurse_df,
                            j54_recurse_df, j56_recurse_df, j57_recurse_df)


Lgroup_jag  <- arrange(Lgroup_jag ,id, t_)

Lgroup_jag <- as.data.frame(Lgroup_jag)

Lgroup_mov <- move(x=Lgroup_jag$x_, y=Lgroup_jag$y_, time= as.POSIXct(Lgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Lgroup_jag, proj=CRS("+init=epsg:32721"), animal=Lgroup_jag$id, clumpy=clumpy)

Lgroup_track <- amt::mk_track(as.data.frame(Lgroup_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Lgroup_track <- Lgroup_track %>% 
  extract_covariates(Lgroup_agro_bi) %>%  
  extract_covariates(Lgroup_agro_dist) %>% 
  extract_covariates(Lgroup_agro_patch) %>%
  extract_covariates(Lgroup_forest_bi) %>%  
  extract_covariates(Lgroup_forest_dist) %>% 
  extract_covariates(Lgroup_forest_patch) %>% 
  extract_covariates(Lgroup_drainage) %>% 
  extract_covariates(Lgroup_aux_road) %>% 
  extract_covariates(Lgroup_main_road) 


Lgroup_jag_stat_track <- amt::mk_track(Lgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Lgroup_jag_stat_track <- Lgroup_jag_stat_track %>% 
  extract_covariates(Lgroup_agro_bi) %>%  
  extract_covariates(Lgroup_agro_dist) %>% 
  extract_covariates(Lgroup_agro_patch) %>%
  extract_covariates(Lgroup_forest_bi) %>%  
  extract_covariates(Lgroup_forest_dist) %>% 
  extract_covariates(Lgroup_forest_patch) %>% 
  extract_covariates(Lgroup_drainage) %>% 
  extract_covariates(Lgroup_aux_road) %>% 
  extract_covariates(Lgroup_main_road) 

variable.names(Lgroup_track)

Lgroup_track <- rename(Lgroup_track,  
                       agro_bin= X06_Lgroup_Pantanal_21S_HABMAT_agro,
                       agro_dist = X06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X06_Lgroup_Pantanal_21S_HABMAT,
                       forest_dist = X06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                       forest_patch = X06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                       drainage_dist = L_dist_drainage,
                       aux_dist = L_dist_aux_road,
                       main_dist = L_dist_main_road)

Lgroup_track$group <- "L"

variable.names(Lgroup_jag_stat_track )

Lgroup_jag_stat_track  <- rename(Lgroup_jag_stat_track , 
                                 agro_bin= X06_Lgroup_Pantanal_21S_HABMAT_agro,
                                 agro_dist = X06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X06_Lgroup_Pantanal_21S_HABMAT,
                                 forest_dist = X06_Lgroup_Pantanal_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X06_Lgroup_Pantanal_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = L_dist_drainage,
                                 aux_dist = L_dist_aux_road,
                                 main_dist = L_dist_main_road)


Lgroup_jag_stat_track$group <- "L"

# N GROUP -----------------------------------------------------------------

## 

j14 <- filter(jaguar, individual.local.identifier== "14")
j14$timestampTZ <- as.POSIXct(j14$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j14$X, j14$Y)
j14_track <- amt::mk_track(as.data.frame(j14), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j14 <- track_resample(j14_track, rate=hours(4), tolareance = minutes(15), start=1)
j14$speed<- amt::speed(j14)
boxplot(j14$speed)

speed_outlier <- which(j14$speed > 0.20)
j14<- j14[- speed_outlier,]

j15 <- filter(jaguar, individual.local.identifier== "15")
j15$timestampTZ <- as.POSIXct(j15$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j15$X, j15$Y)
j15_track <- amt::mk_track(as.data.frame(j15), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j15 <- track_resample(j15_track, rate=hours(4), tolareance = minutes(15), start=1)
j15$speed<- amt::speed(j15)
boxplot(j15$speed)

j19 <- filter(jaguar, individual.local.identifier== "19")
j19$timestampTZ <- as.POSIXct(j19$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j19$X, j19$Y)
j19_track <- amt::mk_track(as.data.frame(j19), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j19 <- track_resample(j19_track, rate=hours(4), tolareance = minutes(15), start=1)
j19$speed<- amt::speed(j19)
boxplot(j19$speed)

speed_outlier <- which(j19$speed > 0.30)
j19<- j19[- speed_outlier,]

j25 <- filter(jaguar, individual.local.identifier== "25")
j25$timestampTZ <- as.POSIXct(j25$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j25$X, j25$Y)
j25_track <- amt::mk_track(as.data.frame(j25), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j25 <- track_resample(j25_track, rate=hours(4), tolareance = minutes(15), start=1)
j25$speed<- amt::speed(j25)
boxplot(j25$speed)

speed_outlier <- which(j25$speed > 0.5)
j25<- j25[- speed_outlier,]


j68 <- filter(jaguar, individual.local.identifier== "68")
j68$timestampTZ <- as.POSIXct(j68$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j68$X, j68$Y)
j68_track <- amt::mk_track(as.data.frame(j68), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j68 <- track_resample(j68_track, rate=hours(4), tolareance = minutes(15), start=1)
j68$speed<- amt::speed(j68)
boxplot(j68$speed)


j69 <- filter(jaguar, individual.local.identifier== "69")
j69$timestampTZ <- as.POSIXct(j69$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j69$X, j69$Y)
j69_track <- amt::mk_track(as.data.frame(j69), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j69 <- track_resample(j69_track, rate=hours(4), tolareance = minutes(15), start=1)
j69$speed<- amt::speed(j69)
boxplot(j69$speed)

speed_outlier <- which(j69$speed > 0.50)
j69 <- j69[- speed_outlier,]


j79 <- filter(jaguar, individual.local.identifier== "79")
j79$timestampTZ <- as.POSIXct(j79$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j79$X, j79$Y)
j79_track <- amt::mk_track(as.data.frame(j79), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j79 <- track_resample(j79_track, rate=hours(4), tolareance = minutes(15), start=1)
j79$speed<- amt::speed(j79)
boxplot(j79$speed)

speed_outlier <- which(j79$speed > 0.30)
j79<- j79[- speed_outlier,]



j84 <- filter(jaguar, individual.local.identifier== "84")
j84$timestampTZ <- as.POSIXct(j84$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j84$X, j84$Y)
j84_track <- amt::mk_track(as.data.frame(j84), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j84 <- track_resample(j84_track, rate=hours(4), tolareance = minutes(15), start=1)
j84$speed<- amt::speed(j84)
boxplot(j84$speed)

speed_outlier <- which(j84$speed > 0.40)
j84<- j84[- speed_outlier,]



j86 <- filter(jaguar, individual.local.identifier== "86")
j86$timestampTZ <- as.POSIXct(j86$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j86$X, j86$Y)
j86_track <- amt::mk_track(as.data.frame(j86), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j86 <- track_resample(j86_track, rate=hours(4), tolareance = minutes(15), start=1)
j86$speed<- amt::speed(j86)
boxplot(j86$speed)


j87 <- filter(jaguar, individual.local.identifier== "87")
j87$timestampTZ <- as.POSIXct(j87$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j87$X, j87$Y)
point_outlier <- which(j87$X > 578000)
j87 <-   j87[- point_outlier,]
plot(j87$X, j87$Y)
j87_track <- amt::mk_track(as.data.frame(j87), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j87 <- track_resample(j87_track, rate=hours(4), tolareance = minutes(15), start=1)

j87$speed<- amt::speed(j87)
boxplot(j87$speed)

speed_outlier <- which(j87$speed > 0.15)
j87<- j87[- speed_outlier,]



j102 <- filter(jaguar, individual.local.identifier== "102")
j102$timestampTZ <- as.POSIXct(j102$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j102$X, j102$Y)
j102_track <- amt::mk_track(as.data.frame(j102), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j102 <- track_resample(j102_track, rate=hours(4), tolareance = minutes(15), start=1)
j102$speed<- amt::speed(j102)
boxplot(j102$speed)

speed_outlier <- which(j102$speed > 0.23)
j102 <- j102[- speed_outlier,]


Ngroup_jag <- bind_rows(j14,j15,j19,j25,j68,j69,j79,j84,j86,j87,j102)

Ngroup_jag <- as.data.frame(Ngroup_jag)

Ngroup_mov <- move(x=Ngroup_jag$x_, y=Ngroup_jag$y_, time= as.POSIXct(Ngroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Ngroup_jag, prefer_proj=CRS("+init=epsg: 32721"), animal=Ngroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 014
j14_mov <- Ngroup_mov[["X14"]]
j14_recurse = getRecursions(j14_mov , 250) 
j14_recurse_df <-  as.data.frame(j14_recurse$revisitStats)
j14_recurse_df$id <- "14"
j14_recurse_df$clumpy <- 0.728
j14$visits <- j14_recurse$revisits
plot(j14_recurse,j14_mov)

j14_track <- amt::mk_track(as.data.frame(j14_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j14_track <- arrange(j14_track, t_)

j14$angle<- amt::direction_rel(j14_track)
j14$sl <- amt::step_lengths(j14_track)
j14$speed<- amt::speed(j14_track)
j14$clumpy <- 0.728

### Outliers review
### 
boxplot(j14$visits)
boxplot(j14_recurse_df$timeInside)
boxplot(j14_recurse_df$timeSinceLastVisit)
boxplot(j14$speed)

summary(j14$speed)

#### JAGUAR 015
j15_mov <- Ngroup_mov[["X15"]]
j15_recurse = getRecursions(j15_mov , 250) 
j15_recurse_df <-  as.data.frame(j15_recurse$revisitStats)
j15_recurse_df$id <- "15"
j15_recurse_df$clumpy <- 0.736
j15$visits <- j15_recurse$revisits
plot(j15_recurse,j15_mov)

j15_track <- amt::mk_track(as.data.frame(j15_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j15_track <- arrange(j15_track, t_)

j15$angle<- amt::direction_rel(j15_track)
j15$sl <- amt::step_lengths(j15_track)
j15$speed<- amt::speed(j15_track)
j15$clumpy <- 0.736

### Outliers review
### 
boxplot(j15$visits)
boxplot(j15_recurse_df$timeInside)
boxplot(j15_recurse_df$timeSinceLastVisit)
boxplot(j15$speed)

summary(j15$speed)

#### JAGUAR 019
j19_mov <- Ngroup_mov[["X19"]]
j19_recurse = getRecursions(j19_mov , 250) 
j19_recurse_df <-  as.data.frame(j19_recurse$revisitStats)
j19_recurse_df$id <- "19"
j19_recurse_df$clumpy <- 0.796
j19$visits <- j19_recurse$revisits
plot(j19_recurse,j19_mov)

j19_track <- amt::mk_track(as.data.frame(j19_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j19_track <- arrange(j19_track, t_)

j19$angle<- amt::direction_rel(j19_track)
j19$sl <- amt::step_lengths(j19_track)
j19$speed<- amt::speed(j19_track)
j19$clumpy <- 0.796

### Outliers review
### 
boxplot(j19$visits)
boxplot(j19_recurse_df$timeInside)
boxplot(j19_recurse_df$timeSinceLastVisit)
boxplot(j19$speed)

summary(j19$speed)

#### JAGUAR 025
j25_mov <- Ngroup_mov[["X25"]]
j25_recurse = getRecursions(j25_mov , 250) 
j25_recurse_df <-  as.data.frame(j25_recurse$revisitStats)
j25_recurse_df$id <- "25"
j25_recurse_df$clumpy <- 0.623
j25$visits <- j25_recurse$revisits
plot(j25_recurse,j25_mov)

j25_track <- amt::mk_track(as.data.frame(j25_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j25_track <- arrange(j25_track, t_)

j25$angle<- amt::direction_rel(j25_track)
j25$sl <- amt::step_lengths(j25_track)
j25$speed<- amt::speed(j25_track)
j25$clumpy <- 0.623

### Outliers review
### 
boxplot(j25$visits)
boxplot(j25_recurse_df$timeInside)
boxplot(j25_recurse_df$timeSinceLastVisit)
boxplot(j25$speed)

summary(j25$speed)

#### JAGUAR 068
j68_mov <- Ngroup_mov[["X68"]]
j68_recurse = getRecursions(j68_mov , 250) 
j68_recurse_df <-  as.data.frame(j68_recurse$revisitStats)
j68_recurse_df$id <- "68"
j68_recurse_df$clumpy <- 0.773
j68$visits <- j68_recurse$revisits
plot(j68_recurse,j68_mov)

j68_track <- amt::mk_track(as.data.frame(j68_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j68_track <- arrange(j68_track, t_)

j68$angle<- amt::direction_rel(j68_track)
j68$sl <- amt::step_lengths(j68_track)
j68$speed<- amt::speed(j68_track)
j68$clumpy <- 0.773

### Outliers review
### 
boxplot(j68$visits)
boxplot(j68_recurse_df$timeInside)
boxplot(j68_recurse_df$timeSinceLastVisit)
boxplot(j68$speed)

summary(j68$speed)

#### JAGUAR 069
j69_mov <- Ngroup_mov[["X69"]]
j69_recurse = getRecursions(j69_mov , 250) 
j69_recurse_df <-  as.data.frame(j69_recurse$revisitStats)
j69_recurse_df$id <- "69"
j69_recurse_df$clumpy <- 0.621
j69$visits <- j69_recurse$revisits
plot(j69_recurse,j69_mov)

j69_track <- amt::mk_track(as.data.frame(j69_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j69_track <- arrange(j69_track, t_)

j69$angle<- amt::direction_rel(j69_track)
j69$sl <- amt::step_lengths(j69_track)
j69$speed<- amt::speed(j69_track)
j69$clumpy <- 0.621

### Outliers review
### 
boxplot(j69$visits)
boxplot(j69_recurse_df$timeInside)
boxplot(j69_recurse_df$timeSinceLastVisit)
boxplot(j69$speed)

summary(j69$speed)

#### JAGUAR 079
j79_mov <- Ngroup_mov[["X79"]]
j79_recurse = getRecursions(j79_mov , 250) 
j79_recurse_df <-  as.data.frame(j79_recurse$revisitStats)
j79_recurse_df$id <- "79"
j79_recurse_df$clumpy <- 0.747
j79$visits <- j79_recurse$revisits
plot(j79_recurse,j79_mov)

j79_track <- amt::mk_track(as.data.frame(j79_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j79_track <- arrange(j79_track, t_)

j79$angle<- amt::direction_rel(j79_track)
j79$sl <- amt::step_lengths(j79_track)
j79$speed<- amt::speed(j79_track)
j79$clumpy <- 0.747

### Outliers review
### 
boxplot(j79$visits)
boxplot(j79_recurse_df$timeInside)
boxplot(j79_recurse_df$timeSinceLastVisit)
boxplot(j79$speed)

summary(j79$speed)

#### JAGUAR 084
j84_mov <- Ngroup_mov[["X84"]]
j84_recurse = getRecursions(j84_mov , 250) 
j84_recurse_df <-  as.data.frame(j84_recurse$revisitStats)
j84_recurse_df$id <- "84"
j84_recurse_df$clumpy <- 0.797
j84$visits <- j84_recurse$revisits
plot(j84_recurse,j84_mov)

j84_track <- amt::mk_track(as.data.frame(j84_mov),  x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j84_track <- arrange(j84_track, t_)

j84$angle<- amt::direction_rel(j84_track)
j84$sl <- amt::step_lengths(j84_track)
j84$speed<- amt::speed(j84_track)
j84$clumpy <- 0.797

### Outliers review
### 
boxplot(j84$visits)
boxplot(j84_recurse_df$timeInside)
boxplot(j84_recurse_df$timeSinceLastVisit)
boxplot(j84$speed)

summary(j84$speed)

#### JAGUAR 086
j86_mov <- Ngroup_mov[["X86"]]
j86_recurse = getRecursions(j86_mov , 250) 
j86_recurse_df <-  as.data.frame(j86_recurse$revisitStats)
j86_recurse_df$id <- "86"
j86_recurse_df$clumpy <- 0.739
j86$visits <- j86_recurse$revisits
plot(j86_recurse,j86_mov)

j86_track <- amt::mk_track(as.data.frame(j86_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j86_track <- arrange(j86_track, t_)

j86$angle<- amt::direction_rel(j86_track)
j86$sl <- amt::step_lengths(j86_track)
j86$speed<- amt::speed(j86_track)
j86$clumpy <- 0.739

### Outliers review
### 
boxplot(j86$visits)
boxplot(j86_recurse_df$timeInside)
boxplot(j86_recurse_df$timeSinceLastVisit)
boxplot(j86$speed)

summary(j86$speed)

#### JAGUAR 087
j87_mov <- Ngroup_mov[["X87"]]
j87_recurse = getRecursions(j87_mov , 250) 
j87_recurse_df <-  as.data.frame(j87_recurse$revisitStats)
j87_recurse_df$id <- "87"
j87_recurse_df$clumpy <- 0.684
j87$visits <- j87_recurse$revisits
plot(j87_recurse,j87_mov)

j87_track <- amt::mk_track(as.data.frame(j87_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j87_track <- arrange(j87_track, t_)

j87$angle<- amt::direction_rel(j87_track)
j87$sl <- amt::step_lengths(j87_track)
j87$speed<- amt::speed(j87_track)
j87$clumpy <- 0.684

### Outliers review
### 
boxplot(j87$visits)
boxplot(j87_recurse_df$timeInside)
boxplot(j87_recurse_df$timeSinceLastVisit)
boxplot(j87$speed)

summary(j87$speed)

#### JAGUAR 102
j102_mov <- Ngroup_mov[["X102"]]
j102_recurse = getRecursions(j102_mov , 250) 
j102_recurse_df <-  as.data.frame(j102_recurse$revisitStats)
j102_recurse_df$id <- "102"
j102_recurse_df$clumpy <- 0.664
j102$visits <- j102_recurse$revisits
plot(j102_recurse,j102_mov)

j102_track <- amt::mk_track(as.data.frame(j102_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j102_track <- arrange(j102_track, t_)

j102$angle<- amt::direction_rel(j102_track)
j102$sl <- amt::step_lengths(j102_track)
j102$speed<- amt::speed(j102_track)
j102$clumpy <- 0.664

### Outliers review
### 
boxplot(j102$visits)
boxplot(j102_recurse_df$timeInside)
boxplot(j102_recurse_df$timeSinceLastVisit)
boxplot(j102$speed)

summary(j102$speed)


# Final step --------------------------------------------------------------


Ngroup_jag <- bind_rows(j14,j15,j19,j25,j68,j69,j79,j84,j86,j87,j102)

Ngroup_jag_stat <- bind_rows(j14_recurse_df,j15_recurse_df,j19_recurse_df,
                             j25_recurse_df,j68_recurse_df,j69_recurse_df,
                             j79_recurse_df,j84_recurse_df,j86_recurse_df,
                             j87_recurse_df,j102_recurse_df)

Ngroup_jag  <- arrange(Ngroup_jag ,id, t_)

Ngroup_jag <- as.data.frame(Ngroup_jag)

Ngroup_mov <- move(x=Ngroup_jag$x_, y=Ngroup_jag$y_, time= as.POSIXct(Ngroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Ngroup_jag, prefer_proj=CRS("+init=epsg: 32721"), animal=Ngroup_jag$id, clumpy=clumpy)

Ngroup_track <- amt::mk_track(as.data.frame(Ngroup_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Ngroup_track <- Ngroup_track %>% 
  extract_covariates(Ngroup_agro_bi) %>%  
  extract_covariates(Ngroup_agro_dist) %>% 
  extract_covariates(Ngroup_agro_patch) %>%
  extract_covariates(Ngroup_forest_bi) %>%  
  extract_covariates(Ngroup_forest_dist) %>% 
  extract_covariates(Ngroup_forest_patch) %>% 
  extract_covariates(Ngroup_drainage) %>% 
  extract_covariates(Ngroup_aux_road) %>% 
  extract_covariates(Ngroup_main_road) 


Ngroup_jag_stat_track <- amt::mk_track(Ngroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime, timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Ngroup_jag_stat_track <- Ngroup_jag_stat_track %>% 
  extract_covariates(Ngroup_agro_bi) %>%  
  extract_covariates(Ngroup_agro_dist) %>% 
  extract_covariates(Ngroup_agro_patch) %>%
  extract_covariates(Ngroup_forest_bi) %>%  
  extract_covariates(Ngroup_forest_dist) %>% 
  extract_covariates(Ngroup_forest_patch) %>% 
  extract_covariates(Ngroup_drainage) %>% 
  extract_covariates(Ngroup_aux_road) %>% 
  extract_covariates(Ngroup_main_road) 

variable.names(Ngroup_track)

Ngroup_track <- rename(Ngroup_track, 
                       agro_bin= X07_Ngroup_Pantanal_21S_HABMAT_agro,
                       agro_dist = X07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X07_Ngroup_Pantanal_21S_HABMAT,
                       forest_dist = X07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST,
                       forest_patch = X07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA,
                       drainage_dist = N_dist_drainage,
                       aux_dist = N_dist_aux_road,
                       main_dist = N_dist_main_road)

Ngroup_track$group <- "N"

variable.names(Ngroup_jag_stat_track )

Ngroup_jag_stat_track  <- rename(Ngroup_jag_stat_track , 
                                 agro_bin= X07_Ngroup_Pantanal_21S_HABMAT_agro,
                                 agro_dist = X07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X07_Ngroup_Pantanal_21S_HABMAT,
                                 forest_dist = X07_Ngroup_Pantanal_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X07_Ngroup_Pantanal_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = N_dist_drainage,
                                 aux_dist = N_dist_aux_road,
                                 main_dist = N_dist_main_road)
Ngroup_jag_stat_track$group <- "N"

# O GROUP -----------------------------------------------------------------

## 

j74 <- filter(jaguar, individual.local.identifier== "74")
j74$timestampTZ <- as.POSIXct(j74$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j74$X,j74$Y)
j74_track <- amt::mk_track(as.data.frame(j74), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j74 <- track_resample(j74_track, rate=hours(4), tolareance = minutes(15), start=1)
j74$speed<- amt::speed(j74)
boxplot(j74$speed)

speed_outlier <- which(j74$speed > 0.35)
j74 <- j74[- speed_outlier,]


j75 <- filter(jaguar, individual.local.identifier== "75")
j75$timestampTZ <- as.POSIXct(j75$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j75$X,j75$Y)
j75_track <- amt::mk_track(as.data.frame(j75), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j75 <- track_resample(j75_track, rate=hours(4), tolareance = minutes(15), start=1)
j75$speed<- amt::speed(j75)
boxplot(j75$speed)

speed_outlier <- which(j75$speed > 0.25)
j75 <- j75[- speed_outlier,]


Ogroup_jag <- bind_rows(j74, j75)
Ogroup_jag <- as.data.frame(Ogroup_jag)

Ogroup_mov <- move(x=Ogroup_jag$x_, y=Ogroup_jag$y_, time= as.POSIXct(Ogroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Ogroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Ogroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 074
j74_mov <- Ogroup_mov[["X74"]]
j74_recurse = getRecursions(j74_mov , 250) 
j74_recurse_df <-  as.data.frame(j74_recurse$revisitStats)
j74_recurse_df$id <-  "74"
j74_recurse_df$clumpy <- 0.585
j74$visits <- j74_recurse$revisits
plot(j74_recurse,j74_mov)

j74_track <- amt::mk_track(as.data.frame(j74_mov),x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j74_track <- arrange(j74_track, t_)

j74$angle<- amt::direction_rel(j74_track)
j74$sl <- amt::step_lengths(j74_track)
j74$speed<- amt::speed(j74_track)
j74$clumpy <- 0.585

### Outliers review
### 
boxplot(j74$visits)
boxplot(j74_recurse_df$timeInside)
boxplot(j74_recurse_df$timeSinceLastVisit)
boxplot(j74$speed)

summary(j74$speed)

#### JAGUAR 075
j75_mov <- Ogroup_mov[["X75"]]
j75_recurse = getRecursions(j75_mov , 250) 
j75_recurse_df <-  as.data.frame(j75_recurse$revisitStats)
j75_recurse_df$id <-  "75"
j75_recurse_df$clumpy <- 0.637
j75$visits <- j75_recurse$revisits
plot(j75_recurse,j75_mov)

j75_track <- amt::mk_track(as.data.frame(j75_mov), x_,y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j75_track <- arrange(j75_track, t_)

j75$angle<- amt::direction_rel(j75_track)
j75$sl <- amt::step_lengths(j75_track)
j75$speed<- amt::speed(j75_track)
j75$clumpy <- 0.637

### Outliers review
### 
boxplot(j75$visits)
boxplot(j75_recurse_df$timeInside)
boxplot(j75_recurse_df$timeSinceLastVisit)
boxplot(j75$speed)

summary(j75$speed)


# Final step --------------------------------------------------------------

Ogroup_jag <- bind_rows(j74, j75)

Ogroup_jag_stat <- bind_rows(j74_recurse_df,j75_recurse_df)

Ogroup_jag  <- arrange(Ogroup_jag ,id, t_)

Ogroup_mov <- move(x=Ogroup_jag$x_, y=Ogroup_jag$y_, time= as.POSIXct(Ogroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Ogroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Ogroup_jag$id, clumpy=clumpy)


Ogroup_track <- amt::mk_track(as.data.frame(Ogroup_mov),x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Ogroup_track <- Ogroup_track %>% 
  extract_covariates(Ogroup_agro_bi) %>%  
  extract_covariates(Ogroup_agro_dist) %>% 
  extract_covariates(Ogroup_agro_patch) %>%
  extract_covariates(Ogroup_forest_bi) %>%  
  extract_covariates(Ogroup_forest_dist) %>% 
  extract_covariates(Ogroup_forest_patch) %>% 
  extract_covariates(Ogroup_drainage) %>% 
  extract_covariates(Ogroup_aux_road) %>% 
  extract_covariates(Ogroup_main_road) 


Ogroup_jag_stat_track <- amt::mk_track(Ogroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime, timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Ogroup_jag_stat_track <- Ogroup_jag_stat_track %>% 
  extract_covariates(Ogroup_agro_bi) %>%  
  extract_covariates(Ogroup_agro_dist) %>% 
  extract_covariates(Ogroup_agro_patch) %>%
  extract_covariates(Ogroup_forest_bi) %>%  
  extract_covariates(Ogroup_forest_dist) %>% 
  extract_covariates(Ogroup_forest_patch) %>% 
  extract_covariates(Ogroup_drainage) %>% 
  extract_covariates(Ogroup_aux_road) %>% 
  extract_covariates(Ogroup_main_road) 

variable.names(Ogroup_track)

Ogroup_track <- rename(Ogroup_track, 
                       agro_bin= X08_Ogroup_Pantanal_21S_HABMAT_agro,
                       agro_dist = X08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X08_Ogroup_Pantanal_21S_HABMAT,
                       forest_dist = X08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST,
                       forest_patch = X08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA,
                       drainage_dist = O_dist_drainage,
                       aux_dist = O_dist_aux_road,
                       main_dist = O_dist_main_road)


Ogroup_track$group <- "O"

variable.names(Ogroup_jag_stat_track)

Ogroup_jag_stat_track  <- rename(Ogroup_jag_stat_track , 
                                 agro_bin= X08_Ogroup_Pantanal_21S_HABMAT_agro,
                                 agro_dist = X08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X08_Ogroup_Pantanal_21S_HABMAT,
                                 forest_dist = X08_Ogroup_Pantanal_21S_HABMAT_EDGE_DIST,
                                 forest_patch = X08_Ogroup_Pantanal_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = O_dist_drainage,
                                 aux_dist = O_dist_aux_road,
                                 main_dist = O_dist_main_road)

Ogroup_jag_stat_track$group <- "O"



# Pantanal joined ---------------------------------------------------------

Pantanal_trk <- rbind(Jgroup_track,Kgroup_track,Lgroup_track,
                      Ngroup_track,Ogroup_track)

Pantanal_stat_trak <- rbind(Jgroup_jag_stat_track,Kgroup_jag_stat_track,
                            Lgroup_jag_stat_track,
                            Ngroup_jag_stat_track, Ogroup_jag_stat_track)


Pantanal_trk$region <- "Pantanal"

Pantanal_stat_trak$region <-  "Pantanal"


# Purus--------------------------------------------------------

##### Group E 

Egroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Agricultural_metrics/01_Egroup_Purus_20S_HABMAT_agro.tif")

Egroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Agricultural_metrics/01_Egroup_Purus_20S_HABMAT_EDGE_DIST_agro.tif")

Egroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Agricultural_metrics/01_Egroup_Purus_20S_HABMAT_patch_AreaHA_agro.tif")

Egroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Forest_metrics/01_Egroup_Purus_20S_HABMAT.tif")

Egroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Forest_metrics/01_Egroup_Purus_20S_HABMAT_EDGE_DIST.tif")

Egroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/Forest_metrics/01_Egroup_Purus_20S_HABMAT_patch_AreaHA.tif")

Egroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/E_dist_drainage.tif")

Egroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/E_dist_aux_road.tif")

Egroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/Purus/E_dist_main_road.tif")




# E GROUP -----------------------------------------------------------------

## 

j95 <- filter(jaguar, individual.local.identifier== "95")
j95$timestampTZ <- as.POSIXct(j95$timestampTZ,format="%Y-%m-%d %H:%M",tz="America/Manaus")
plot(j95$X, j95$Y)
j95_track <- amt::mk_track(as.data.frame(j95), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j95 <- track_resample(j95_track, rate=hours(4), tolareance = minutes(15), start=1)
j95$speed<- amt::speed(j95)
boxplot(j95$speed)

speed_outlier <- which(j95$speed > 0.10)
j95 <- j95[- speed_outlier,]


j99 <- filter(jaguar, individual.local.identifier== "99")
j99$timestampTZ <- as.POSIXct(j99$timestampTZ,format="%Y-%m-%d %H:%M",tz="America/Manaus")
plot(j99$X, j99$Y)
j99_track <- amt::mk_track(as.data.frame(j99), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j99 <- track_resample(j99_track, rate=hours(4), tolareance = minutes(15), start=1)
j99$speed<- amt::speed(j99)
boxplot(j99$speed)

speed_outlier <- which(j99$speed > 0.20)
j99 <- j99[- speed_outlier,]


Egroup_jag <- bind_rows(j95,j99)

Egroup_jag  <- arrange(Egroup_jag ,id, t_)

Egroup_jag <-  as.data.frame(Egroup_jag)

Egroup_mov <- move(x=Egroup_jag$x_, y=Egroup_jag$y_, time= as.POSIXct(Egroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Manaus"), data= Egroup_jag, prefer_proj=CRS("+init=epsg:32720"), animal=Egroup_jag$id)



# Prepare columns movement ------------------------------------------------

#### JAGUAR 095
j95_mov <- Egroup_mov[["X95"]]
j95_recurse = getRecursions(j95_mov , 250) 
j95_recurse_df <-  as.data.frame(j95_recurse$revisitStats)
j95_recurse_df$id <- "95"
j95_recurse_df$clumpy <- 0.767
j95$visits <- j95_recurse$revisits
plot(j95_recurse,j95_mov)

j95_track <- amt::mk_track(as.data.frame(j95_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j95_track <- arrange(j95_track, t_)

j95$angle<- amt::direction_rel(j95_track)
j95$sl <- amt::step_lengths(j95_track)
j95$speed<- amt::speed(j95_track)
j95$clumpy <- 0.767

### Outliers review
### 
boxplot(j95$visits)
boxplot(j95_recurse_df$timeInside)
boxplot(j95_recurse_df$timeSinceLastVisit)
boxplot(j95$speed)

summary(j95$speed)

#### JAGUAR 099
j99_mov <- Egroup_mov[["X99"]]
j99_recurse = getRecursions(j99_mov , 250) 
j99_recurse_df <-  as.data.frame(j99_recurse$revisitStats)
j99_recurse_df$id <- "99"
j99_recurse_df$clumpy <- 0.728
j99$visits <- j99_recurse$revisits
plot(j99_recurse,j99_mov)

j99_track <- amt::mk_track(as.data.frame(j99_mov),  x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j99_track <- arrange(j99_track, t_)

j99$angle<- amt::direction_rel(j99_track)
j99$sl <- amt::step_lengths(j99_track)
j99$speed<- amt::speed(j99_track)
j99$clumpy <- 0.728

### Outliers review
### 
boxplot(j99$visits)
boxplot(j99_recurse_df$timeInside)
boxplot(j99_recurse_df$timeSinceLastVisit)
boxplot(j99$speed)

summary(j99$speed)


# Final step --------------------------------------------------------------

Egroup_jag <- bind_rows(j95, j99)


Egroup_jag_stat <-bind_rows(j95_recurse_df,
                            j99_recurse_df)

Egroup_jag  <- arrange(Egroup_jag ,id, t_)

Egroup_jag <- as.data.frame(Egroup_jag)

Egroup_mov <- move(x=Egroup_jag$x_, y=Egroup_jag$y_, time= as.POSIXct(Egroup_jag$t_,format="%Y-%m-%d %H:%M",tz="America/Manaus"), data= Egroup_jag, prefer_proj=CRS("+init=epsg:32720"), animal=Egroup_jag$id, clumpy=clumpy)



Egroup_track <- amt::mk_track(as.data.frame(Egroup_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Egroup_track <- Egroup_track %>% 
  extract_covariates(Egroup_agro_bi) %>%  
  extract_covariates(Egroup_agro_dist) %>% 
  extract_covariates(Egroup_agro_patch) %>%
  extract_covariates(Egroup_forest_bi) %>%  
  extract_covariates(Egroup_forest_dist) %>% 
  extract_covariates(Egroup_forest_patch) %>% 
  extract_covariates(Egroup_drainage) %>% 
  extract_covariates(Egroup_aux_road) %>% 
  extract_covariates(Egroup_main_road) 

variable.names(Egroup_jag_stat)

Egroup_jag_stat_track <- amt::mk_track(Egroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32720"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Egroup_jag_stat_track <- Egroup_jag_stat_track %>% 
  extract_covariates(Egroup_agro_bi) %>%  
  extract_covariates(Egroup_agro_dist) %>% 
  extract_covariates(Egroup_agro_patch) %>%
  extract_covariates(Egroup_forest_bi) %>%  
  extract_covariates(Egroup_forest_dist) %>% 
  extract_covariates(Egroup_forest_patch) %>% 
  extract_covariates(Egroup_drainage) %>% 
  extract_covariates(Egroup_aux_road) %>% 
  extract_covariates(Egroup_main_road)

variable.names(Egroup_track)

Egroup_track <- rename(Egroup_track, 
                       agro_bin= X01_Egroup_Purus_20S_HABMAT_agro,
                       agro_dist = X01_Egroup_Purus_20S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X01_Egroup_Purus_20S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X01_Egroup_Purus_20S_HABMAT,
                       forest_dist = X01_Egroup_Purus_20S_HABMAT_EDGE_DIST,
                       forest_patch = X01_Egroup_Purus_20S_HABMAT_patch_AreaHA,
                       drainage_dist = E_dist_drainage,
                       aux_dist = E_dist_aux_road,
                       main_dist = E_dist_main_road)

Egroup_track$group <- "E"

variable.names(Egroup_jag_stat_track )

Egroup_jag_stat_track  <- rename(Egroup_jag_stat_track , 
                                 agro_bin= X01_Egroup_Purus_20S_HABMAT_agro,
                                 agro_dist = X01_Egroup_Purus_20S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X01_Egroup_Purus_20S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X01_Egroup_Purus_20S_HABMAT,
                                 forest_dist = X01_Egroup_Purus_20S_HABMAT_EDGE_DIST,
                                 forest_patch = X01_Egroup_Purus_20S_HABMAT_patch_AreaHA,
                                 drainage_dist = E_dist_drainage,
                                 aux_dist = E_dist_aux_road,
                                 main_dist = E_dist_main_road)

Egroup_jag_stat_track$group <- "E"

# Purus joined ---------------------------------------------------------

Purus_trk <- Egroup_track

Purus_stat_trak <- rbind(Egroup_jag_stat_track)

Purus_stat_trak$region <-  "Purus"

Purus_trk$region <- "Purus"

# DryChaco--------------------------------------------------------
##### GROUP R 
##### 
Rgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Agricultural_metrics/09_Rgroup_DryChaco_20S_HABMAT_agro.tif")

Rgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Agricultural_metrics/09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST_agro.tif")

Rgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Agricultural_metrics/09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA_agro.tif")


Rgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Forest_metrics/09_Rgroup_DryChaco_20S_HABMAT.tif")

Rgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Forest_metrics/09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST.tif")

Rgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/Forest_metrics/09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA.tif")


Rgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/R_dist_drainage.tif")

Rgroup_aux_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/R_dist_aux_road.tif")

Rgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/DryChaco/R_dist_main_road.tif")


# R group -----------------------------------------------------------------

## 
j76 <- filter(jaguar, individual.local.identifier== "76")
j76$timestampTZ <- as.POSIXct(j76$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j76$X, j76$Y)
j76_track <- amt::mk_track(as.data.frame(j76), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j76 <- track_resample(j76_track, rate=hours(4), tolareance = minutes(15), start=1)

j76$speed<- amt::speed(j76)
boxplot(j76$speed)

speed_outlier <- which(j76$speed > 0.5)
j76 <- j76[- speed_outlier,]


j77 <- filter(jaguar, individual.local.identifier== "77")
j77$timestampTZ <- as.POSIXct(j77$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j77$X, j77$Y)
j77_track <- amt::mk_track(as.data.frame(j77), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j77 <- track_resample(j77_track, rate=hours(4), tolareance = minutes(15), start=1)

j77$speed<- amt::speed(j77)
boxplot(j77$speed)


Rgroup_jag <- bind_rows(j76, j77)

Rgroup_jag <-  as.data.frame(Rgroup_jag)

Rgroup_mov <- move(x=Rgroup_jag$x_, y=Rgroup_jag$y_, time= as.POSIXct(Rgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Rgroup_jag, prefer_proj=CRS("+init=epsg: 32720"), animal=Rgroup_jag$id)

# Prepare columns movement ------------------------------------------------

#### JAGUAR 76
j76_mov <- Rgroup_mov[["X76"]]
j76_recurse = getRecursions(j76_mov , 250) 
j76_recurse_df <-  as.data.frame(j76_recurse$revisitStats)
j76_recurse_df$id <- "76"
j76_recurse_df$clumpy <- 0.561
j76$visits <- j76_recurse$revisits
plot(j76_recurse,j76_mov)

j76_track <- amt::mk_track(as.data.frame(j76_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j76_track <- arrange(j76_track, t_)

j76$angle<- amt::direction_rel(j76_track)
j76$sl <- amt::step_lengths(j76_track)
j76$speed<- amt::speed(j76_track)
j76$clumpy <- 0.561

### Outliers review
### 
boxplot(j76$visits)
boxplot(j76_recurse_df$timeInside)
boxplot(j76_recurse_df$timeSinceLastVisit)
boxplot(j76$speed)

summary(j76$speed)

#### JAGUAR 77
j77_mov <- Rgroup_mov[["X77"]]
j77_recurse = getRecursions(j77_mov , 250) 
j77_recurse_df <-  as.data.frame(j77_recurse$revisitStats)
j77_recurse_df$id <- "77"
j77_recurse_df$clumpy <- 0.582
j77$visits <- j77_recurse$revisits
plot(j77_recurse,j77_mov)

j77_track <- amt::mk_track(as.data.frame(j77_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j77_track <- arrange(j77_track, t_)

j77$angle<- amt::direction_rel(j77_track)
j77$sl <- amt::step_lengths(j77_track)
j77$speed<- amt::speed(j77_track)
j77$clumpy <- 0.582

### Outliers review
### 
boxplot(j77$visits)
boxplot(j77_recurse_df$timeInside)
boxplot(j77_recurse_df$timeSinceLastVisit)
boxplot(j77$speed)

summary(j77$speed)

# Final step --------------------------------------------------------------

Rgroup_jag <- bind_rows(j76, j77)


Rgroup_jag_stat <-bind_rows(j76_recurse_df, j77_recurse_df)

Rgroup_jag  <- arrange(Rgroup_jag ,id, t_)

Rgroup_jag <- as.data.frame(Rgroup_jag)

Rgroup_mov <- move(x=Rgroup_jag$x_, y=Rgroup_jag$y_, time= as.POSIXct(Rgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Rgroup_jag, prefer_proj=CRS("+init=epsg:32720"), animal=Rgroup_jag$id, clumpy=clumpy)

Rgroup_track <- amt::mk_track(as.data.frame(Rgroup_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32720"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Rgroup_track <- Rgroup_track %>% 
  extract_covariates(Rgroup_agro_bi) %>%  
  extract_covariates(Rgroup_agro_dist) %>% 
  extract_covariates(Rgroup_agro_patch) %>% 
  extract_covariates(Rgroup_forest_bi) %>%  
  extract_covariates(Rgroup_forest_dist) %>% 
  extract_covariates(Rgroup_forest_patch) %>% 
  extract_covariates(Rgroup_drainage) %>% 
  extract_covariates(Rgroup_aux_road) %>% 
  extract_covariates(Rgroup_main_road) 


Rgroup_jag_stat_track <- amt::mk_track(Rgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32720"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Rgroup_jag_stat_track <- Rgroup_jag_stat_track %>% 
  extract_covariates(Rgroup_agro_bi) %>%  
  extract_covariates(Rgroup_agro_dist) %>% 
  extract_covariates(Rgroup_agro_patch) %>% 
  extract_covariates(Rgroup_forest_bi) %>%  
  extract_covariates(Rgroup_forest_dist) %>% 
  extract_covariates(Rgroup_forest_patch) %>% 
  extract_covariates(Rgroup_drainage) %>% 
  extract_covariates(Rgroup_aux_road) %>% 
  extract_covariates(Rgroup_main_road) 

variable.names(Rgroup_track)

Rgroup_track <- rename(Rgroup_track, 
                       agro_bin= X09_Rgroup_DryChaco_20S_HABMAT_agro,
                       agro_dist =X09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST_agro,
                       agro_patch =
                         X09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X09_Rgroup_DryChaco_20S_HABMAT,
                       forest_dist =X09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST,
                       forest_patch =X09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA,
                       drainage_dist = R_dist_drainage,
                       aux_dist = R_dist_aux_road,
                       main_dist = R_dist_main_road)

Rgroup_track$group <- "R"

variable.names(Rgroup_jag_stat_track )

Rgroup_jag_stat_track  <- rename(Rgroup_jag_stat_track , 
                                 agro_bin= X09_Rgroup_DryChaco_20S_HABMAT_agro,
                                 agro_dist =X09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST_agro,
                                 agro_patch =
                                  X09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X09_Rgroup_DryChaco_20S_HABMAT,
                                 forest_dist =X09_Rgroup_DryChaco_20S_HABMAT_EDGE_DIST,
                                 forest_patch =X09_Rgroup_DryChaco_20S_HABMAT_patch_AreaHA,
                                 drainage_dist = R_dist_drainage,
                                 aux_dist = R_dist_aux_road,
                                 main_dist = R_dist_main_road)

Rgroup_jag_stat_track$group <- "R"


# DryChaco joined ---------------------------------------------------------


DryChaco_trk <- Rgroup_track

DryChaco_stat_trak <- Rgroup_jag_stat_track


DryChaco_trk$region <- "DryChaco"

DryChaco_stat_trak$region <-  "DryChaco"


# HumidChaco--------------------------------------------------------

##### Group V 
Vgroup_agro_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Agricultural_metrics/10_Vgroup_HumidChaco_21S_HABMAT_agro.tif")

Vgroup_agro_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Agricultural_metrics/10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST_agro.tif")

Vgroup_agro_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Agricultural_metrics/10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA_agro.tif")


Vgroup_forest_bi <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Forest_metrics/10_Vgroup_HumidChaco_21S_HABMAT.tif")

Vgroup_forest_dist <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Forest_metrics/10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST.tif")

Vgroup_forest_patch <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/Forest_metrics/10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA.tif")


Vgroup_drainage  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/V_dist_drainage.tif")

Vgroup_aux_road <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/V_dist_aux_road.tif")

Vgroup_main_road  <-  raster("E:/Jaguar02/01_Analysis_Methods/01_Data/01_Jaguar02_Map_works/00_variables/10_landcover2023_01_23/HumidChaco/V_dist_main_road.tif")



# V GROUP -----------------------------------------------------------------

## 

j1 <- filter(jaguar, individual.local.identifier== "1")
j1$timestampTZ <- as.POSIXct(j1$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j1$X, j1$Y)
j1_track <- amt::mk_track(as.data.frame(j1), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j1 <- track_resample(j1_track, rate=hours(4), tolareance = minutes(15), start=1)

j1$speed<- amt::speed(j1)
boxplot(j1$speed)

speed_outlier <- which(j1$speed > 0.25)
j1 <- j1[- speed_outlier,]

j3 <- filter(jaguar, individual.local.identifier== "3")
j3$timestampTZ <- as.POSIXct(j3$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j3$X, j3$Y)
j3_track <- amt::mk_track(as.data.frame(j3), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j3 <- track_resample(j3_track, rate=hours(4), tolareance = minutes(15), start=1)

j3$speed<- amt::speed(j3)
boxplot(j3$speed)

speed_outlier <- which(j3$speed > 0.5)
j3 <- j3[- speed_outlier,]

j5 <- filter(jaguar, individual.local.identifier== "5")
j5$timestampTZ <- as.POSIXct(j5$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j5$X, j5$Y)
j5_track <- amt::mk_track(as.data.frame(j5), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j5 <- track_resample(j5_track, rate=hours(4), tolareance = minutes(15), start=1)

j5$speed<- amt::speed(j5)
boxplot(j5$speed)

speed_outlier <- which(j5$speed > 0.20)
j5 <- j5[- speed_outlier,]

j9 <- filter(jaguar, individual.local.identifier== "9")
j9$timestampTZ <- as.POSIXct(j9$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j9$X, j9$Y)
j9_track <- amt::mk_track(as.data.frame(j9), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j9 <- track_resample(j9_track, rate=hours(4), tolareance = minutes(15), start=1)

j9$speed<- amt::speed(j9)
boxplot(j9$speed)

j10 <- filter(jaguar, individual.local.identifier== "10")
j10$timestampTZ <- as.POSIXct(j10$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j10$X, j10$Y)
j10_track <- amt::mk_track(as.data.frame(j10), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j10 <- track_resample(j10_track, rate=hours(4), tolareance = minutes(15), start=1)
j10$speed<- amt::speed(j10)
boxplot(j10$speed)

speed_outlier <- which(j10$speed > 0.27)
j10 <- j10[- speed_outlier,]


j11 <- filter(jaguar, individual.local.identifier== "11")
j11$timestampTZ <- as.POSIXct(j11$timestampTZ,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4")
plot(j11$X, j11$Y)
j11_track <- amt::mk_track(as.data.frame(j11), X, Y, .t= timestampTZ, id= individual.local.identifier, season=season, sex=sex, moon.phase=moon.phase, event=event)
j11 <- track_resample(j11_track, rate=hours(4), tolareance = minutes(15), start=1)
j11$speed<- amt::speed(j11)
boxplot(j11$speed)

speed_outlier <- which(j11$speed > 0.14)
j11 <- j11[- speed_outlier,]

Vgroup_jag <- bind_rows(j1,j3,j5,j9,j10,j11)


Vgroup_jag  <- arrange(Vgroup_jag ,id, t_)

Vgroup_jag <- as.data.frame(Vgroup_jag)

Vgroup_mov <- move(x=Vgroup_jag$x_, y=Vgroup_jag$y_, time= as.POSIXct(Vgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Vgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Vgroup_jag$id)


# Prepare columns movement ------------------------------------------------

#### JAGUAR 01
j1_mov <- Vgroup_mov[["X1"]]
j1_recurse = getRecursions(j1_mov , 250) 
j1_recurse_df <-  as.data.frame(j1_recurse$revisitStats)
j1_recurse_df$id <- "1"
j1_recurse_df$clumpy <- 0.555
j1$visits <- j1_recurse$revisits
plot(j1_recurse,j1_mov)

j1_track <- amt::mk_track(as.data.frame(j1_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j1_track <- arrange(j1_track, t_)

j1$angle<- amt::direction_rel(j1_track)
j1$sl <- amt::step_lengths(j1_track)
j1$speed<- amt::speed(j1_track)
j1$clumpy <- 0.555

### Outliers review
### 
boxplot(j1$visits)
boxplot(j1_recurse_df$timeInside)
boxplot(j1_recurse_df$timeSinceLastVisit)
boxplot(j1$speed)

summary(j1$speed)


#### JAGUAR 03
j3_mov <- Vgroup_mov[["X3"]]
j3_recurse = getRecursions(j3_mov , 250) 
j3_recurse_df <-  as.data.frame(j3_recurse$revisitStats)
j3_recurse_df$id <- "3"
j3_recurse_df$clumpy <- 0.644
j3$visits <- j3_recurse$revisits
plot(j3_recurse,j3_mov)

j3_track <- amt::mk_track(as.data.frame(j3_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j3_track <- arrange(j3_track, t_)

j3$angle<- amt::direction_rel(j3_track)
j3$sl <- amt::step_lengths(j3_track)
j3$speed<- amt::speed(j3_track)
j3$clumpy <- 0.644

### Outliers review
### 
boxplot(j3$visits)
boxplot(j3_recurse_df$timeInside)
boxplot(j3_recurse_df$timeSinceLastVisit)
boxplot(j3$speed)

summary(j3$speed)

#### JAGUAR 05
j5_mov <- Vgroup_mov[["X5"]]
j5_recurse = getRecursions(j5_mov , 250) 
j5_recurse_df <-  as.data.frame(j5_recurse$revisitStats)
j5_recurse_df$id <- "5"
j5_recurse_df$clumpy <- 0.620
j5$visits <- j5_recurse$revisits
plot(j5_recurse,j5_mov)

j5_track <- amt::mk_track(as.data.frame(j5_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j5_track <- arrange(j5_track, t_)

j5$angle<- amt::direction_rel(j5_track)
j5$sl <- amt::step_lengths(j5_track)
j5$speed<- amt::speed(j5_track)
j5$clumpy <- 0.620

### Outliers review
### 
boxplot(j5$visits)
boxplot(j5_recurse_df$timeInside)
boxplot(j5_recurse_df$timeSinceLastVisit)
boxplot(j5$speed)

summary(j5$speed)

#### JAGUAR 09
j9_mov <- Vgroup_mov[["X9"]]
j9_recurse = getRecursions(j9_mov , 250) 
j9_recurse_df <-  as.data.frame(j9_recurse$revisitStats)
j9_recurse_df$id <- "9"
j9_recurse_df$clumpy <- 0.612
j9$visits <- j9_recurse$revisits
plot(j9_recurse,j9_mov)

j9_track <- amt::mk_track(as.data.frame(j9_mov),x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j9_track <- arrange(j9_track, t_)

j9$angle<- amt::direction_rel(j9_track)
j9$sl <- amt::step_lengths(j9_track)
j9$speed<- amt::speed(j9_track)
j9$clumpy <- 0.612

### Outliers review
### 
boxplot(j9$visits)
boxplot(j9_recurse_df$timeInside)
boxplot(j9_recurse_df$timeSinceLastVisit)
boxplot(j9$speed)

summary(j9$speed)

#### JAGUAR 010
j10_mov <- Vgroup_mov[["X10"]]
j10_recurse = getRecursions(j10_mov , 250) 
j10_recurse_df <-  as.data.frame(j10_recurse$revisitStats)
j10_recurse_df$id <- "10"
j10_recurse_df$clumpy <- 0.703
j10$visits <- j10_recurse$revisits
plot(j10_recurse,j10_mov)

j10_track <- amt::mk_track(as.data.frame(j10_mov), x_, y_, .t= t_, id= id,crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j10_track <- arrange(j10_track, t_)

j10$angle<- amt::direction_rel(j10_track)
j10$sl <- amt::step_lengths(j10_track)
j10$speed<- amt::speed(j10_track)
j10$clumpy <- 0.703

### Outliers review
### 
boxplot(j10$visits)
boxplot(j10_recurse_df$timeInside)
boxplot(j10_recurse_df$timeSinceLastVisit)
boxplot(j10$speed)

summary(j10$speed)

#### JAGUAR 011
j11_mov <- Vgroup_mov[["X11"]]
j11_recurse = getRecursions(j11_mov , 250) 
j11_recurse_df <-  as.data.frame(j11_recurse$revisitStats)
j11_recurse_df$id <- "11"
j11_recurse_df$clumpy <- 0.633
j11$visits <- j11_recurse$revisits
plot(j11_recurse,j11_mov)

j11_track <- amt::mk_track(as.data.frame(j11_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event)


j11_track <- arrange(j11_track, t_)

j11$angle<- amt::direction_rel(j11_track)
j11$sl <- amt::step_lengths(j11_track)
j11$speed<- amt::speed(j11_track)
j11$clumpy <- 0.633

### Outliers review
### 
boxplot(j11$visits)
boxplot(j11_recurse_df$timeInside)
boxplot(j11_recurse_df$timeSinceLastVisit)
boxplot(j11$speed)

summary(j11$speed)

# Final step --------------------------------------------------------------

Vgroup_jag <- bind_rows(j1, j3,j5, j9, j10, j11)


Vgroup_jag_stat <-bind_rows(j1_recurse_df, j3_recurse_df,
                            j5_recurse_df,j9_recurse_df,
                            j10_recurse_df, j11_recurse_df)

Vgroup_jag  <- arrange(Vgroup_jag ,id, t_)

Vgroup_jag <- as.data.frame(Vgroup_jag)

Vgroup_mov <- move(x=Vgroup_jag$x_, y=Vgroup_jag$y_, time= as.POSIXct(Vgroup_jag$t_,format="%Y-%m-%d %H:%M",tz="Etc/GMT+4"), data= Vgroup_jag, prefer_proj=CRS("+init=epsg:32721"), animal=Vgroup_jag$id, clumpy=clumpy)


Vgroup_track <- amt::mk_track(as.data.frame(Vgroup_mov), x_, y_, .t= t_, id= id, crs=crs("+init=epsg:32721"), sex=sex, season=season, moon.phase=moon.phase, event=event, visits=visits, angle=angle, sl=sl, speed=speed, clumpy=clumpy)

Vgroup_track <- Vgroup_track %>% 
  extract_covariates(Vgroup_agro_bi) %>%  
  extract_covariates(Vgroup_agro_dist) %>% 
  extract_covariates(Vgroup_agro_patch) %>%
  extract_covariates(Vgroup_forest_bi) %>%  
  extract_covariates(Vgroup_forest_dist) %>% 
  extract_covariates(Vgroup_forest_patch) %>% 
  extract_covariates(Vgroup_drainage) %>% 
  extract_covariates(Vgroup_aux_road) %>% 
  extract_covariates(Vgroup_main_road) 

variable.names(Vgroup_jag_stat)

Vgroup_jag_stat_track <- amt::mk_track(Vgroup_jag_stat, x,y, id= id, crs=crs("+init=epsg:32721"), coordIdx= coordIdx, visitIdx=visitIdx,entranceTime=entranceTime, exitTime=exitTime,
                                       timeInside=timeInside, timeSinceLastVisit=timeSinceLastVisit, clumpy=clumpy)

Vgroup_jag_stat_track <- Vgroup_jag_stat_track %>% 
  extract_covariates(Vgroup_agro_bi) %>%  
  extract_covariates(Vgroup_agro_dist) %>% 
  extract_covariates(Vgroup_agro_patch) %>%
  extract_covariates(Vgroup_forest_bi) %>%  
  extract_covariates(Vgroup_forest_dist) %>% 
  extract_covariates(Vgroup_forest_patch) %>% 
  extract_covariates(Vgroup_drainage) %>% 
  extract_covariates(Vgroup_aux_road) %>% 
  extract_covariates(Vgroup_main_road)  

variable.names(Vgroup_track)

Vgroup_track <- rename(Vgroup_track, 
                       agro_bin= X10_Vgroup_HumidChaco_21S_HABMAT_agro,
                       agro_dist = X10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST_agro,
                       agro_patch = X10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA_agro,
                       forest_bin= X10_Vgroup_HumidChaco_21S_HABMAT,
                       forest_dist = X10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST,
                       forest_patch = 
                         X10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA,
                       drainage_dist = V_dist_drainage,
                       aux_dist = V_dist_aux_road,
                       main_dist = V_dist_main_road)

Vgroup_track$group <- "V"

variable.names(Vgroup_jag_stat_track )

Vgroup_jag_stat_track  <- rename(Vgroup_jag_stat_track , 
                                 agro_bin= X10_Vgroup_HumidChaco_21S_HABMAT_agro,
                                 agro_dist = X10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST_agro,
                                 agro_patch = X10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA_agro,
                                 forest_bin= X10_Vgroup_HumidChaco_21S_HABMAT,
                                 forest_dist = X10_Vgroup_HumidChaco_21S_HABMAT_EDGE_DIST,
                                 forest_patch = 
                                   X10_Vgroup_HumidChaco_21S_HABMAT_patch_AreaHA,
                                 drainage_dist = V_dist_drainage,
                                 aux_dist = V_dist_aux_road,
                                 main_dist = V_dist_main_road)
Vgroup_jag_stat_track$group <- "V"


# HumidChaco joined ---------------------------------------------------------

HumidChaco_trk <- Vgroup_track

HumidChaco_stat_trak <- Vgroup_jag_stat_track

HumidChaco_trk$region <- "HumidChaco"

HumidChaco_stat_trak$region <-  "HumidChaco"


# CREATE THE DATA BASE ----------------------------------------------------
jag_track <- rbind(Atlantic_trk, Caatinga_trk,
                   Cerrado_trk,DryChaco_trk, 
                   HumidChaco_trk, Pantanal_trk,
                   Purus_trk)

write.csv(jag_track, "E:/Jaguar02/01_Analysis_Methods/03_Output/jag_track2023_jan_26.csv")




jag_stat_track <- rbind(Atlantic_stat_trak,Caatinga_stat_trak,
                        Cerrado_stat_trak,DryChaco_stat_trak, 
                        HumidChaco_stat_trak, Pantanal_stat_trak,
                        Purus_stat_trak)


write.csv(jag_stat_track , "E:/Jaguar02/01_Analysis_Methods/03_Output/jag_stat_track2023_jan_26.csv")


