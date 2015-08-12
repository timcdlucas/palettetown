
#'Pokemon inspired colour palettes.
#'
#'@name palettetown
#'@author Tim CD Lucas
#'@docType package
#'@import ggplot2

NULL



#' Get a pokemon palette.
#'
#' Get a pokemon palette by either giving a pokemon number or name.
#'
#'@param pokemon An integer or character pokemon name
#'
#'@name pokepal
#'@examples
#'pal <- pokepal(3)
#'plot(1:length(pal), col = pal)
#'@export

pokepal <- function(pokemon = 1){
    
  # Fix lower case to first letter capitilised.
  if(is.character(pokemon)){
    s <- strsplit(pokemon, " ")[[1]]
    pokemon <- paste(toupper(substring(s, 1,1)), 
                     tolower(substring(s, 2)),
        sep="", collapse=" ")
  }

  return(cols[[pokemon]])
}


