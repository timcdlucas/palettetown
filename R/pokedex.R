
#' Display pokemon palettes.
#'
#' Display 10 pokemon palettes starting from a name or number.
#' If no name or number is given, 10 of the better palettes are
#' displayed. Pokedex is a Trademark of Nintendo.
#'
#'@inheritParams pokepal
#'@param cb A number between 1 and 4 to select ten of 40 colourblind friendly 
#'  (Deuteranomaly) palettes. \code{pokemon} is ignored if used, but \code{spread}
#'  works as normal.
#'
#'@name pokedex
#'@details If \code{spread} is given an integer, the full palette is 
#'  clustered into that many groups (ward clustering in HSV space). 
#'  The most common colour in each cluster is then returned. It is
#'  hoped this will give a good balance between reflecting the pokemons
#'  colouring while giving relatively distinct colours.
#'
#'  Thanks to Luis Verde for the colourblind suitable selection.
#'@examples
#'pokedex()
#'pokedex('Metapod')
#'pokedex(5, spread = 2)
#'pokedex(cb = 3)
#'pokedex(cb = 2, spread = 6)
#'@export


pokedex <- function(pokemon = NULL, spread = NULL, cb = NULL){

  if(is.null(pokemon)){
    pokeNs <- c(6, 17, 114, 137, 156, 191, 193, 283, 311, 318)
  }


  colourblindFriendly <- c(1,2,3,9,10,12,18,19,29,32,39,42,43,44,61,
    63,65,66,69,72,73,101,109,107,109,110,116,126,128,130,131,134,
    135,136,140,141,149,150,156,157)

  if(is.numeric(cb)){
    if(cb > 4) stop('cb must be between 1 and 4')
    pokemon <- NULL
    pokeNs <- colourblindFriendly[((cb - 1) * 10 + 1):((cb - 1) * 10 + 10)]
  }
    
  
  # ensure lower case.
  if(is.character(pokemon)){
    pokemon <- tolower(pokemon)
  }

  
  if(is.numeric(pokemon)){
    pokeNs <- pokemon:(pokemon + 9)
  } else if(is.character(pokemon)){
    start <- which(names(pokeColours) == pokemon)
    pokeNs <- start:(start + 9)
  }

  if(is.null(spread)){
    nCols <- sapply(pokeNs, function(x) length(pokepal(x)))
  } else {
    nCols <- sapply(pokeNs, function(x) length(pokepal(x)))
    nCols[nCols > spread] <- spread
    
  }
  xlim <- max(nCols)

  oldpar <- graphics::par(mgp = c(2, 0.25, 0), mai=c(1.02,0.82,0.82,0.42))
  on.exit(graphics::par(oldpar))


  graphics::par(mar = c(1, 7, 1, 1))
  graphics::plot(1,1,xlim=c(0,xlim), ylim=c(0, 10), type="n", 
       axes=FALSE, bty="n", xlab="", ylab="")

    for(i in 1:10){

      if(is.null(spread)){
        nColours <- NULL
      } else {
        nColours <- nCols[i]
      }      

      graphics::rect(xleft = 0:(nCols[i] - 1), 
          ybottom = 10 - i, 
          xright = 1:nCols[i], 
          ytop = 11 - i - 0.2, 
          col = pokepal(pokeNs[i], nColours),
          border="light grey")
    }
    graphics::text(rep(-0.1, 10), (10:1) - 0.6, 
      labels = paste(pokeNs, ':', names(pokeColours)[pokeNs]), 
      xpd = TRUE, adj = 1)

}



