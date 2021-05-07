# EXPLICAR ESTRUCTURA DE CARPETAS y lectura de datos
# Librerías ====
library(tidyverse)
library(nycflights13)

# Lectura de datos ====
# write_csv(flights, "data/raw/flights_nyc.csv")

data <- read_csv("data/raw/flights_nyc.csv")

