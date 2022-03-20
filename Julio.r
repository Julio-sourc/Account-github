library(tidyverse)
library(magrittr)

install.packages('dplyr')
library(dplyr)

credi = read.csv('credit_data.csv')

head(credi)

credi$i.clientid <- NULL
#credi %>% select(-clientid) %>% head()

#algumas estátisticas
summary(credi)

credi [credi$age < 0, ]# vazio retorna todas as colunas

credi [credi$age < 0, 1:2]

credi = credi[credi$age > 0, ]

age = credi [credi$age < 0 & !is.na(credi$age)]

credi = credi[credi$age > 0, ]

#calculando a media.
#opção para tratar os dados inconsistentes, e não considera valores negativos.

#mean(credi$age > 0, na.rm= TRUE)

#através da foruma da média na linha 11, mean(credi$age > 0, na.rm= TRUE)
credi$age = ifelse(credi$age < 0, 40.92, credi$age)

credi[is.na(credi$age), ]
credi$age = ifelse(is.na(credi$age), mean(credi$age, na.rm =TRUE), credi$age)
# se a base for igual a nulo preencha a média, senão mantenha 

head(credi)

credi %>%
filter(income=='age') %>%
   group_by(age) %>%
   summarise(mean(loan))

#média de emprestimo por idade
credi %>% group_by(age)%>%
summarise(mean(loan))

#escalonamento padronização
credi[, 1:3] = scale(credi[, 1:3])

library(ggplot2) # `require(ggplot2)` também serve 99.99% usam `library()`

options(scipen = 999)

ggplot(credi, aes(x=age, y=loan))

ggplot(credi, aes(x=age, y=loan))+
geom_point(aes(col=income, size=loan))

ggplot(credi, aes(x=age, y=loan))+
geom_point(aes(col=income, size=loan))+
xlim(c(0, 1.1742218))+
ylim(c(0, 1.6724960))

ggplot(credi, aes(x=age, y=loan))+
geom_point(aes(col=income, size=loan))+
xlim(c(0, 1.1742218))+
ylim(c(0, 1.6724960))+
geom_smooth(method = loess, se=T)+


min(credi)


