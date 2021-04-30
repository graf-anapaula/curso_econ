# Librerías =====
library(tidyverse)

# Lectura de datos ====
# data <- read_csv("")

# displ tamaño del motor
# hwy Car fuel's efficiency 

# ¿Cómo graficar?
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# ggplot crea un sistema de coordenadas 
# PRimer argumento: dataset
# Mapping argument
# SIempre va acompañado con aes(), y el argumento dentro de aes() son las 
# variabeles en eje de las x's y y's

ggplot(data = mpg) 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Podemos agregar una tercera variable, por ejemplo, la class del auto
# Size, shape, color
# Color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Alpha
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Shape 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Cambiar color OJO no confundir 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = 'red')

# Objetos geométricos
# Objeto geométrico que se ocupa para representar tu dataset
ggplot(mpg) +
  geom_point(aes(displ, hwy))

ggplot(mpg) +
  geom_smooth(aes(displ, hwy))

# Juntar dos figuras geométricas
ggplot(mpg) +
  geom_smooth(aes(displ, hwy)) +
  geom_point(aes(displ, hwy))

# Una manera más fácil puesto a que no estoy 


# AGregar una tercera variable a una sola
ggplot(mpg) +
  geom_smooth(aes(displ, hwy)) +
  geom_point(aes(displ, hwy, color = class))
 







# FACETS ====
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class)