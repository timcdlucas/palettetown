


if(FALSE){
  extraPals <- list(
                 # http://bulbapedia.bulbagarden.net/wiki/File:Team_Rocket_party_Original_series.png
                 teamrocket = c(pokepal('meowth')[12], 
                                pokepal('lickitung')[1], 
                                pokepal('victreebel')[c(2, 4)], 
                                pokepal('arbok')[1],
                                pokepal('weezing')[8]),
             starterspairs  = c(pokepal('venusaur')[c(1, 2)],
                                pokepal('charizard')[c(3, 2)],
                                pokepal('blastoise')[c(2, 3)]),
             startersDark    = c(pokepal('ivysaur')[5],
                                pokepal('charizard')[6],
                                pokepal('wartortle')[c(1, 11)],                              
                                #pokepal('squirtle')[3],
                                pokepal('charmeleon')[c(7, 9)])
                )
    

  pokeColours <- c(pokeColours, extraPals)
}
