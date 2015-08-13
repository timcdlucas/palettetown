palettetown
======


An R package providing pokemon colour palettes.

This package is very much inspired by [pokepalletes](http://pokepalettes.com/#charizard).



Installation
-------------


```r
library(devtools)
install_github('timcdlucas/encounteR')
library(encounteR)
```

Usage
------

### See palettes




```r
# Show ten of the better palettes
pokedex()
```

![plot of chunk pokedex](figure/pokedex-1.png) 

```r
# Show ten palettes starting from pokemon #155
pokedex(155)
```

![plot of chunk pokedex](figure/pokedex-2.png) 

```r
# Show ten palettes starting from Metapod
pokedex('Metapod')
```

![plot of chunk pokedex](figure/pokedex-3.png) 


### Base graphics


```r
plot(rnorm(20), rnorm(20), col = pokepal(137), pch = 16)
```

![plot of chunk base](figure/base-1.png) 

### ggplot2

```r
# palettetown doesn't import ggplot2
library(ggplot2)


qplot(Sepal.Length, Sepal.Width, colour = Species, data=iris) +
  scale_colour_poke(pokemon = 318)
```

![plot of chunk ggplot2](figure/ggplot2-1.png) 

```r
qplot(factor(carb), data=mtcars, geom="bar", 
  fill = factor(carb)) +
  scale_fill_poke(pokemon = 'Sunkern')
```

![plot of chunk ggplot2](figure/ggplot2-2.png) 






