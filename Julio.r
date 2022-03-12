credi = read.csv('credit_data.csv')

head(credi)

head(credi)

library(tidyverse)
library(magrittr)
credi$clientid - NULL
credi %>% select(-clientid) %>% head()

#algumas estátisticas
summary(credi)

credi [credi$age < 0, ]# vazio retorna todas as colunas

credi [credi$age < 0, 2:3]

credi = credi[credi$age > 0, ]

age = credi [credi$age < 0 & !is.na(credi$age)]

credi = credi[credi$age > 0, ]

#calculando a media.
#opção para tratar os dados inconsistentes, e não considera valores negativos.

#mean(credi$age > 0, na.rm= TRUE)

#através da foruma da média na linha 11, mean(credi$age > 0, na.rm= TRUE)
credi$age = ifelse(credi$age < 0, 40.92, credi$age)

credi[is.na(credi$age)]
base$age = ifelse(is.na(base$age),mean (credi$age, na.rm = TRUE), credi$age)
# se a base for igual a nulo preencha a média, senão mantenha 


credi %>% 
  janitor::clean_names() %>% 
  group_by(incame) %>% 
  summarise(
    n = n(),
    media_idade = mean(age),
    mediana_idade = median(age),
    media_renda = mean(income),
    mediana_renda = median(income)
  ) %>% 
  arrange(-renda)
```
