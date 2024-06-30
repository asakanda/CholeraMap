
install.packages("xlsx")
library(xlsx)
install.packages("readxl")
library(readxl)
library(dplyr)
library(sp)
library(raster)
install.packages("ggplot2")
library(ggplot2)
install.packages("forcats")
library(forcats)
install.packages("hrbrthemes")
library(hrbrthemes)
install.packages("viridis")
library(viridis)


file <-read.csv(file="D:/RFF-GABS Project/Write up/CholeraMap_Result_2021_2022.csv", header = TRUE, sep = ",")
#file <-read.csv(file="D:/RFF-GABS Project/Write up/Avg_CholeraMap_Result_2021_2022.csv", header = TRUE, sep = ",")

#option 1

my_colors= c('#ff33ad' ,'#ff8533')
#33adff
# Grouped
file %>%
  mutate(Month = fct_reorder(Month, Risk)) %>%
  mutate(Month = factor(Month, levels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))) %>%
  ggplot(aes(fill=Year, y=Risk, x=Month)) + 
  #geom_violin(position="dodge", trim = FALSE) +
  geom_boxplot(width = 0.8, position = position_dodge(width = 0.9))+
  stat_summary(fun=mean, geom="line", size = 1.1,  aes(group=1)) +
  stat_summary(fun=mean, geom="point")+
  facet_wrap(~Year) +
  #scale_fill_viridis(discrete=TRUE, name="") +
  scale_fill_manual(values = my_colors) +
  xlab("") +
  ylab("Cholera Risk") +
  ylim(0,1)

#The code is adopted from the following website and added in the reference
##https://r-graph-gallery.com/265-grouped-boxplot-with-ggplot2.html

##Reference
#Yan, H. (2018). Grouped boxplot with ggplot2. Retrieved May 6, 2024, from https://r-graph-gallery.com/265-grouped-boxplot-with-ggplot2.html