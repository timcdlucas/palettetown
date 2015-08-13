
#' Display pokemon palettes.
#'
#' Display 10 pokemon palettes starting from a name or number.
#' If no name or number is given, 10 of the better palettes are
#' displayed.
#'
#'@param pokemon An integer or character pokemon name
#'
#'@name pokedex
#'@examples
#'pokedex()
#'pokedex('Metapod')
#'@export


pokedex <- function(pokemon = NULL){

  if(is.null(pokemon)){
    pokeNs <- c(6, 17, 114, 137, 156, 191, 193, 283, 311, 318)
  }

  if(is.numeric(pokemon)){
    pokeNs <- pokemon:(pokemon + 9)
  } else if(is.character(pokemon)){
    start <- which(names(cols) == pokemon)
    pokeNs <- start:(start + 9)
  }

  nCols <- sapply(pokeNs, function(x) length(pokepal(x)))
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
          col = pokepal(pokeNs[i]),
          border="light grey")
    }
    text(rep(-0.1, 10), (10:1) - 0.6, 
      labels = paste(pokeNs, ':', names(cols)[pokeNs]), 
      xpd = TRUE, adj = 1)

}



