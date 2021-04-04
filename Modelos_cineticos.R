#Ajustes de modelos de cinética de secagem para 
#casca de tangerina Ponkan a velocidade de 1.2 m/s 
#a temperatura de 80°C.

setwd("C:/Users/User/Desktop/Estudos/joaoR")
getwd()
install.packages("seedwater")
install.packages('rpanel')
install.packages('tcltk')

library(rpanel)
library(tcltk)
library(rJava)
library(readxl)
library(dplyr)
library(seedwater)

#Carregando o arquivo xlsx
read_excel("secagem.xlsx")
head(read_excel("secagem.xlsx"))

#Importando uma worksheet para um dataframe
df<-read_excel("secagem.xlsx")
head(df)
View(df)

#Ajeitando os dados antes de realizar as análises 
new_df<-df%>% 
  rename(moisture = BaseSeca)

new_df<-new_df[,-c(1,3)]
time<-as.numeric(new_df$min)
baseumida<-as.numeric(new_df$moisture)
View(new_df)

#Determinando os modelos de secagem
if (interactive()) {
  res <- with(new_df, dryingmodels(moisture = baseumida, time = min))
  summary(res)
}
