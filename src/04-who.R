# Library ====
library(tidyverse)

# Lectura de datos ====
# En este caso no aplica porque voy a sacar los datos de las bases de R
# who <- read_csv("data/raw/who.csv")
?who 

# Pivot_longer
who1 <- who %>% pivot_longer(new_sp_m014:newrel_f65, names_to = "aux", values_to = 'casos',
                     values_drop_na = TRUE)

who2 <- who1 %>% mutate(aux = str_replace(aux, "newrel", "new_rel"))

who3 <- who2 %>% separate(aux, c("new", "tipo", "genero_edad")) %>% 
  select(-new)

who3 %>% filter(!str_detect(new, 'new'))

who4 <- who3 %>% separate(genero_edad, into = c("genero", "edad"), sep = 1) 
who5 <- who4 %>%  separate(edad, into = c("edad_low", "edad_high"), sep = -2, 
                           convert = TRUE)

dataset <-  left_join(who5, population, by = c("country", "year")) %>% 
  mutate(rate = casos / population) %>% 
  select(-iso2, iso3)

write_csv(dataset, "data/interim/who_clean.csv")
         