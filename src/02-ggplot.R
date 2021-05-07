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
# Forma alterna, un atributo de ggplot es el aes() vamos agregando figuras sobre el plano
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

# que pasa si arego aes(color)
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  geom_smooth()

# Se puede agregar atributos en el aes() sólo para una figura
# Igual tiene más sentido hacer esto. Tiene que ir dentro de un aes, 
# de otra forma mi código no va a correr
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()

# Smooth ajusta con una recta, entre sus atributos está el metodo con el que quiero ajustar los datos
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(method = 'lm')

# FACETS ====
# No olvidar que son variables categóricas
# Wrap: separar las gráficas por una categoría
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
# Agregar y ~ x
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(cyl ~ drv)

# Gráficas comunes
ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar()

ggplot(diamonds, aes(cut, color = cut)) +
  geom_bar()

# Análogo a transformar la tabla para luego
diamonds_count <- diamonds %>%
  group_by(cut) %>% 
  count()

ggplot(diamonds_count, aes(cut, n)) +
  geom_bar(aes(fill = cut), stat = 'identity')

ggplot(diamonds_count, aes(cut, n)) +
  geom_bar(aes(fill = cut), stat = 'identity')

ggplot(diamonds, aes(cut)) +
  geom_bar()

ggplot(diamonds, aes(cut)) +
  geom_bar(aes(fill = clarity), alpha = 0.25)

# si quiero saber la proporción por atributo
ggplot(diamonds) +
  geom_bar(aes(x = cut, fill = clarity), position = 'fill')

ggplot(diamonds, aes(cut)) +
  geom_bar(aes(fill = clarity), position = 'dodge')

# BOXPLOT
ggplot(mpg, aes(class, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()