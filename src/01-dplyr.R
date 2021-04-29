# Workflow 
# Estructuras de carpetas

# Librerias ====
library(tidyverse)
# install.packages("nycflights13")
library(nycflights13)

# Lectura de datos ====
write_csv(flights, "primera_clase/data/raw/flights.csv")
flights <- read_csv("primera_clase/data/raw/flights.csv")

# Poder ver la base de datos
View(flights)
head(flights, 10)
?flights

# Dplyr basics ====
filter() # Seleccionar observaciones por sus valores
arrange() # Reordenar columnas
select() # seleccionar distintas columnas
mutate() # Crear una nueva variable a partir de variables existentes o columnas existentes
summarise() # Colapsar muchas observacioines en una sola
group_by() # Group-by-group

# Todos trabajan igual
# Primer argumento es el dataset
# Lo siguiente es describe qué haver con el dataset, llamando al nombre de las variables
# Lo que regresa es un nuevo dataaset

# FILTER ====
jan1 <- filter(flights, month == 1, day == 1)
dec25 <- filter(flights, month == 12, day == 25)

# Operaciones lógicas con foto en RMD
filter(flights, month == 11 | month == 12)
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

# Missing values
NA # Nullo

# No se puden hacer operaciones con nulos ejmeplo:_
x <- NA
x + 1
x > 3

is.na(x)

lista <- tibble(x = c(1, NA, 3))
filter(lista, is.na(x))
filter(lista, !is.na(x))


# Usar between
# %in%

# Más ejercicios con filter
filter(flights, is.na(dep_time))
filter(flights, between(month, 1, 5))
filter(flights, month %in% c(11, 12))
summer <- c(6, 7, 8)
filter(flights, month %in% summer)

# ARRANGE ====
arrange(flights, year, month, day) # Por omisión me los arregla de forma ascendente
arrange(flights, desc(dep_delay))

# Missing values are always sorted at the end
arrange(lista, desc(x))
arrange(lista, x)

# SELECT ====
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

#Starts_with
select(flights, starts_with("dep"))
select(flights, ends_with("time"))

# En el orden que yo elija seleccionar va ser el orden de mi nueva tabla
select(flights, dep_time, arr_time, everything())

# MUTATE ====
flights_sel <- select(flights, year:day, distance, air_time)
# Air time en minutos y distance en kms y quiero kms/ hora
flights_sl2 <- mutate(flights_sel, air_time_hr = air_time / 60)
mutate(flights_sl2, speed = distance / air_time * 60,
                    speed_alt = distance / air_time_hr)
# NO agrega, solo calcula
transmute(flights_sl2, speed = distance / air_time_hr)


# SUMMARISE ====
summarise(flights, delay = mean(dep_delay)) # Encontró missing values
summarise(flights, delay = mean(dep_delay, na.rm = T))

# Normalmante vamos a acompañar a un summarise con GROUP_BY() 
# Podemos usar los verbos de DPLYR en datos agrupados, agrupados por
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


# COMBINING WITH PIPES ====
# Imaginemos que queremos hacer más de una cosa a la vez, agrupar por destinos,
# contar cuántas veces se viajó a cada destio, la media de la distancia para llegar
# a ese destino y después de ello filtrar los valores 

# El código se puede ver de dos formas:
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest, count = n(), dist = mean(distance, na.rm = TRUE))
delay <- filter(delay, count > 20, dest != 'HNL')

# Podemos hacer uso de las un pipe %>% 
# Shortcut: ctrl + Shift + M (en Windows)
# En MAC cmd + Shift + M
# Si te ayuda pronuncia el código como 'then', 'después'
# LO primero que debo poner es mi base de datos
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(count = n(), dist = mean(distance, na.rm = TRUE)) %>% 
  filter(count > 20, dest != 'HNL') # HAWAII HONOLU

not_cancelled <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay)) # OJO aquí ya no puse na.rm = TRUE ¿Por qué?

not_cancelled %>% 
  group_by(dest) %>% 
  summarise(distance_mean = mean(distance),
            distance_sd = sd(distance)) %>% 
  arrange(desc(distance_sd))
  









