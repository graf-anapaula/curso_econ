# Librerías 
library(tidyverse)

# Datos ====
table4a %>% pivot_longer(c('1999', '2000'), names_to = 'year', values_to = 'value')
table4b %>% pivot_longer(c('1999', '2000'), names_to = 'year', values_to = 'value')

people <- tribble(
  ~name,             ~names,  ~values,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
people %>% pivot_wider(names_from = names, values_from = values)



# Separate ====
table3 %>% separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE) %>% 
  mutate(rate = cases / population)
# Unite
table_new <- table3 %>% separate(year, into = c('century', 'year'), sep = 2)
table_new %>% unite(year_clean, century, year, sep = "")

# Who===
?tidyr::who


# Mutatig joins ====
library(nycflights13)

flights
airlines
?weather
flights %>% left_join(airlines, by = 'carrier') %>% 
  rename(carrier_name = name)
weather <- weather %>% filter(year == 2013)

left_join(flights, weather, by = c("year", "month", "day", "hour", "origin")) %>% 
  filter(year == 2013, origin == 'JFK') %>% 
  mutate(fecha = str_c(day, '/', month, '/', year)) %>% 
  group_by(year, month) %>% 
  summarise(temp_media = mean(temp, na.rm = TRUE)) %>% 
  ggplot(aes(str_c(month, "/", year), temp_media)) +
  geom_point()

# Tipos de datos ====
# DATETIME
library(lubridate)
flights_dt <- flights %>% mutate(departure = make_datetime(year, month, day, hour, minute)) %>% 
  select(origin, departure)
flights_dt

flights_dt %>% mutate(
  year = year(departure),
  month = month(departure)
)


flights_dt %>% filter(year(departure) > 2010)

flights_dt %>% mutate(week_day = wday(departure))

flights_dt %>% mutate(year = update(departure, year = 2021))

# Strings ====
vector <- c("Ana Paula", "Graf", NA)
str_length(vector)
#String combine
str_c("Ana Paula", " Graf")

# SUbsetting string
frutas <- c("Manzana", "Pera", "Higos")
str_sub(frutas, 1, 3)
str_sub(frutas, -3, -1)

str_to_lower(frutas)


str_replace(frutas, "Manzana", "Jicama")
str_detect(frutas, "Manzana")
