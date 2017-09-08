

palettetown
======

[![Total Downloads](http://cranlogs.r-pkg.org/badges/grand-total/palettetown)](http://cranlogs.r-pkg.org/badges/grand-total/palettetown/index.html)
[![Build Status](https://travis-ci.org/timcdlucas/palettetown.svg)](https://travis-ci.org/timcdlucas/palettetown)

An R package providing pokemon colour palettes.

This package is very much inspired by [pokepalettes](http://pokepalettes.com/#charizard).

Note that Pokemon, pokedex and all pokemon names are trademarks of Nintendo. I own nothing.



Installation
-------------

### To install from CRAN

```r
install.packages('palettetown')
library(palettetown)
```

### To install development version

```r
library(devtools)
install_github('timcdlucas/palettetown')
library(palettetown)
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
# Get 7 fairly distinct colours for each.
pokedex(155, 7)
```

![plot of chunk pokedex](figure/pokedex-2.png)

```r
# Show ten palettes starting from Metapod
pokedex('Metapod')
```

![plot of chunk pokedex](figure/pokedex-3.png)

```r
# Show ten palettes that are fairly colour blind friendly
pokedex(cb = 1)
```

![plot of chunk pokedex](figure/pokedex-4.png)


### Base graphics


```r
plot(rnorm(20), rnorm(20), col = pokepal(pokemon = 137, spread = 6), pch = 16, cex = 1.8)
```

![plot of chunk base](figure/base-1.png)

### ggplot2

```r
# palettetown doesn't import ggplot2
library(ggplot2)


qplot(Sepal.Length, Sepal.Width, colour = Species, data=iris, size = 2) +
  scale_colour_poke(pokemon = 156, spread = 3)
```

![plot of chunk ggplot2](figure/ggplot2-1.png)

```r
qplot(factor(carb), data=mtcars, geom="bar", 
  fill = factor(carb)) +
  scale_fill_poke(pokemon = 'Quilava', spread = 6)
```

![plot of chunk ggplot2](figure/ggplot2-2.png)






