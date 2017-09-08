

#' Combine colours from different pokemon.
#' 
#' 
#' 
#'@param pokemon A vector of integers or a character vector of pokemon name
#'@param n How many colours per pokemon?
#'@param spread How many, fairly distinct, colours should be returned for each pokemon. 
#'  If not null, \code{n} is ignored.
#'@export
#'@name team 

team <- function(pokemon, n = 1, spread = NULL){
  
  
  # Fix lower case to first letter capitilised.
  if(is.character(pokemon)){
    pokemon <- tolower(pokemon)
    
    # Check that pokemon exists
    if(!all(pokemon %in% names(pokeColours))){
      stop('Some pokemon are not spelled correctly or are not available')
    }
  }
  
  if(is.numeric(pokemon) & max(pokemon) > length(pokeColours)){
    stop(paste('Pokemon number too high. First', length(pokeColours), 'pokemon are available.'))
  }
  
  if(is.null(spread)){
    pal_list <- lapply(pokemon, function(x) pokepal(x)[1:n])
    pal_vec <- do.call(c, pal_list)
  } else {
    pal_list <- lapply(pokemon, function(x) pokepal(x, spread = spread))
    pal_vec <- do.call(c, pal_list)
  }
  
  return(pal_vec)
  
}