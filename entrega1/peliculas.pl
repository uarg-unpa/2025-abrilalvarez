%PARTE 1 - REPRESENTAR ENUNCIADOS COMO HECHOS
pelicula(inception, ciencia_ficcion).
actor(leonardo_dicaprio, inception).
director(christopher_nolan, inception).
actor(tom_hanks, forrest_gump).
pelicula(forrest_gump, drama).
director(steven_spielberg, jurrasic_park).
pelicula(jurassic_park, aventura).

%AGREGAR AL MENOS 5 HECHOS ADICIONALES
pelicula(interestellar, ciencia_ficcion).
actor(matthew_mcconaughey, interestellar).
actor(jessica_chastain, interestellar).
actor(robin_wright, forrest_gump).
actor(leonardo_dicaprio, revenant).
pelicula(revenant, aventura).
actor(tom_hanks, naufrago).
pelicula(naufrago, aventura).

?- director(christopher_nolan, TituloPelicula).
TituloPelicula = inception.
