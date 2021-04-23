# Introducción

R es un ambiente de programación formado por un conjunto de herramientas
flexibles que pueden utilizarse fácilmente mediante paquetes, librerías
(9000+) o definiendo funciones propias

-   Código abierto, gratuito y de open source. Además es una herramienta
    estadística estable, confiable y a la vanguardia, ya que está
    sometida a una actualización permanente

Es un lenguaje de programación estadístico, gratuituo y open source.

## ¿Por qué R?

Actualmente, se está conviertiendo en un lenguaje muy popular y de gran
relevancia. Es considerado uno de los mejores lenguajes para hacer Data
Science.

Veáse en:

-   [Towards Data
    Science](https://towardsdatascience.com/top-9-languages-for-data-science-in-2020-824239f930c)

-   [The Most Popular Programming
    Languages](https://statisticsanddata.org/most-popular-programming-languages/)

## Primeros pasos

Instala Tidyverse:

``` r
install.packages('tidyverse')
```

Si ya lo tienes instalado nada más hazlo llamar como:

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.3     v purrr   0.3.4
    ## v tibble  3.1.0     v dplyr   1.0.5
    ## v tidyr   1.1.3     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Te recomiendo los siguientes pasos:

1.  Entra a **Tools**

2.  **Global Options**

3.  En **Workspace** desactiva donde dice: Restore .RData into workspace
    at startup

4.  En **Workspace** donde dice Save workspace to .RData when exit
    activa **never**.

## Paquetes

-   Base R: ya instalados cuando bajamos R

-   Contribuited packages: códigos de R que todos pueden bajar y obtener
    más funciones

Paquetes que vamos a usar:

``` r
library(dplyr) # Manipular bases de datos
library(tidyr) # Limpiar informatción
library(stringr) # Trabajar con strings o texto
library(lubridate) # Trabajar con fechas y horas
library(ggplot2) # Paquete más común para hacer gráficas
library(rmarkdown) # Reportes
```

Entre otros.

## Tipos de datos

| Datos     | Valores            |
|-----------|--------------------|
| Logic     | True, False        |
| Numeric   | 1, 2, 10000, 1e10  |
| Integer   | 3L, 4L, 40L        |
| Character | ‘a’, ‘Hello World’ |

## Workflow

-   Rproject

-   Estructura de carpetas

-   ETL

![](images/data-science.png)

-   El proceso de **tidy** consume alrededor del 70% u 80% del tiempo de
    un *Data Scientist*.

### Operaciones logicas

![](images/transform-logical.png)
