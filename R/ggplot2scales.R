

#' Add a pokemon palette to a ggplot2 colour or fill scale.
#'
#' Get a pokemon palette by either giving a pokemon number or name.
#'
#'@param pokemon An integer or character pokemon name
#'
#'@name scale_colour_poke
#'@examples
#'qplot(Sepal.Length, Sepal.Width, colour = Species, data=iris) +
#'  scale_colour_poke('Metapod')

#'@rdname scale_colour_poke
#'@export

scale_colour_poke <- function(..., pokemon = 1){
  scale_colour_manual(values = pokepal(pokemon))
}


#'@rdname scale_colour_poke
#'@export

scale_fill_poke <- function(..., pokemon = 1){
  scale_fill_manual(values = pokepal(pokemon))
}


#'@rdname scale_colour_poke
#'@export

scale_color_poke <- function(..., pokemon = 1){
  scale_color_manual(values = pokepal(pokemon))
}



