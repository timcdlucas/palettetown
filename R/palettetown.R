
#'Pokemon inspired colour palettes.
#'
#'@name palettetown
#'@author Tim CD Lucas
#'@docType package


NULL



#' Get a pokemon palette.
#'
#' Get a pokemon palette by either giving a pokemon number or name.
#'
#'@param pokemon An integer or character pokemon name
#'@param spread How many, quite distinct, colours should be returned. See details.
#'
#'@name pokepal
#'@details If \code{spread} if given an integer, the full palette is 
#'  clustered into that many groups (ward clustering in HSV space). 
#'  The most common colour in each cluster is then returned. It is
#'  hoped this will give a good balance between reflecting the pokemons
#'  colouring while giving relatively distinct colours.
#'@examples
#'pal <- pokepal(3)
#'plot(1:length(pal), col = pal)
#'@export

pokepal <- function(pokemon = 1, spread = NULL){
    
  # Fix lower case to first letter capitilised.
  if(is.character(pokemon)){
    s <- strsplit(pokemon, " ")[[1]]
    pokemon <- paste(toupper(substring(s, 1,1)), 
                     tolower(substring(s, 2)),
        sep="", collapse=" ")
  }

  # Reorder palette if spread is numeric.
  if(is.numeric(spread)){
    if(length(pokeColours[[pokemon]]) < spread){
      stop('Not enough colours available')
    }
    clusts <- cutree(hclust(dist( 
      t(rgb2hsv(col2rgb(pokeColours[[pokemon]])))
    ), method = 'ward.D'),
    k = spread)
    # First occurence of each cluster number in clusts
    #   is always the most common.
    #   clusNums is a hacky way of seperating the more similar clusters in output
    clusNums <- suppressWarnings(
      c(matrix(c(1:floor(spread/2), spread:floor((spread/2 + 1))), 
      2, byrow = T))[1:spread] 
    )
    pal <- sapply(clusNums, function(x) pokeColours[[pokemon]][which(clusts == x)[1]])
            
  } else {
    pal <- pokeColours[[pokemon]]
  }
  
  return(pal)
}


