# Workflow 

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
