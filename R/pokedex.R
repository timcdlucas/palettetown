
#' Display pokemon palettes.
#'
#' Display 10 pokemon palettes starting from a name or number.
#' If no name or number is given, 10 of the better palettes are
#' displayed.
#'
#'@inheritParams pokepal
#'
#'@name pokedex
#'@details If \code{spread} is given an integer, the full palette is 
#'  clustered into that many groups (ward clustering in HSV space). 
#'  The most common colour in each cluster is then returned. It is
#'  hoped this will give a good balance between reflecting the pokemons
#'  colouring while giving relatively distinct colours.
#'@examples
#'pokedex()
#'pokedex('Metapod')
#'@export


pokedex <- function(pokemon = NULL, spread = NULL){

  if(is.null(pokemon)){
    pokeNs <- c(6, 17, 114, 137, 156, 191, 193, 283, 311, 318)
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

  oldpar <- par(mgp = c(2, 0.25, 0), mai=c(1.02,0.82,0.82,0.42))
  on.exit(par(oldpar))


  par(mar = c(1, 7, 1, 1))
  plot(1,1,xlim=c(0,xlim), ylim=c(0, 10), type="n", 
       axes=FALSE, bty="n", xlab="", ylab="")

    for(i in 1:10){

      
      rect(xleft = 0:(nCols[i] - 1), 
          ybottom = 10 - i, 
          xright = 1:nCols[i], 
          ytop = 11 - i - 0.2, 
          col = pokepal(pokeNs[i], nCols[i]),
          border="light grey")
    }
    text(rep(-0.1, 10), (10:1) - 0.6, 
      labels = paste(pokeNs, ':', names(pokeColours)[pokeNs]), 
      xpd = TRUE, adj = 1)

}



