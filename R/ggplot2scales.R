

#' Add a pokemon palette to a ggplot2 colour or fill scale.
#'
#' Get a pokemon palette by either giving a pokemon number or name.
#'
#'@inheritParams pokepal
#'
#'@name scale_colour_poke
#'@details If \code{spread} is given an integer, the full palette is 
#'  clustered into that many groups (ward clustering in HSV space). 
#'  The most common colour in each cluster is then returned. It is
#'  hoped this will give a good balance between reflecting the pokemons
#'  colouring while giving relatively distinct colours.
#'@examples
#'qplot(Sepal.Length, Sepal.Width, colour = Species, data=iris) +
#'  scale_colour_poke('Metapod')

#'@rdname scale_colour_poke
#'@export

scale_colour_poke <- function(..., pokemon = 1, spread = NULL){
  scale_colour_manual(values = pokepal(pokemon, spread))
}


#'@rdname scale_colour_poke
#'@export

scale_fill_poke <- function(..., pokemon = 1, spread = NULL){
  scale_fill_manual(values = pokepal(pokemon, spread))
}


#'@rdname scale_colour_poke
#'@export

scale_color_poke <- function(..., pokemon = 1, spread = NULL){
  scale_color_manual(values = pokepal(pokemon, spread))
}



