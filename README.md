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

See palettes:




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





