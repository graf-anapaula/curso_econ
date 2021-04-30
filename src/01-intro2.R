# Instalación de paquetes 
# install.packages("tidyverse")

# Run code cntrl + enter (Windows) o cmd + enter (Mac)

# Asignación de variables
# Short cut: alt + '-'
x <- 1
2 * x

x <- x/2

caracter <- "hello world"
class(caracter)

x1 <- c(1, 2, 3, 4, 5)
x2 <- c(1, 4, 5, 7, 7)


x3 <- x1 + x2
x3
x4 <- c(1, 2)
x3 + x4

x1 <- 3.5 * x1
x1


# Diferentes dara types
logic_num <- TRUE
logic_num

typeof(logic_num)
typeof(caracter)


typeof(x1)


# Jerarquía de operaciones
(1+ 3)/2
1+ 3/2

# Otras operaciones importantes
sqrt(11)
mean(x1)
var(x2)
sd(x1)

# Operaciones racionales
2 > 1 # TRUE
2 >= 1 # TRUE
2 < 1 # FALSE
2 == 1 # FALSE
# DIFERENTE DE
2 != 1 # TRUE
# And &
10 > 20 & 10 < 20 # No se cumplen ambas condiciones -> FALSE
# Or |
10 > 20 | 10 < 20 # Se cumple por lo menos una condición -> TRUE
# Not ! # Negación de la afirmación
(10 == 3)
!(10 == 3)
 