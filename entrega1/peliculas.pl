%PARTE 1 - REPRESENTAR ENUNCIADOS COMO HECHOS
pelicula(inception, ciencia_ficcion).
pelicula(forrest_gump, drama).
pelicula(jurassic_park, aventura).

actor(leonardo_dicaprio, inception).
actor(tom_hanks, forrest_gump).

director(christopher_nolan, inception).
director(steven_spielberg, jurassic_park).

%AGREGAR AL MENOS 5 HECHOS ADICIONALES
pelicula(interestellar, ciencia_ficcion).
pelicula(revenant, aventura).
pelicula(naufrago, aventura).

actor(matthew_mcconaughey, interestellar).
actor(jessica_chastain, interestellar).
actor(robin_wright, forrest_gump).
actor(leonardo_dicaprio, revenant).
actor(tom_hanks, naufrago).

% PARTE 2
% a) Consulta 1 
?- director(christopher_nolan, TituloPelicula).
% Recorre la base buscando hechos director, donde el nombre del director sea christopher_nolan. 
% Compara todos los hechos director en el orden que están escritos y luego determina cuales si son verdaderos.
% Si encuentra christopher_nolan, sigue con el siguiente argumento (la otra parte de la consulta).
% encuentra director(christopher_nolan, inception). Es verdadero.
    % christopher_nolan coincide -> continua con el siguiente argumento.
    % TituloPelicula es variable -> sustituye por inception.
%Sigue recorriendo y compara. No encuentra más hechos director que coincidan.
%Salida: TituloPelicula = inception.

% b) Consulta 2
?-pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
%Primero busca hechos película que sean de ciencia_ficcion.
%Compara todos los hechos película en el orden que están escritos y luego determina cuales si son verdaderos.
%Encuentra pelicula(inception, ciencia_ficcion).
    % ciencia_ficcion coincide -> sustituye TituloPelicula por inception.
%Encuentra pelicula(interestellar, ciencia_ficcion).
    % ciencia_ficcion coincide -> sustituye TituloPelicula por interestellar.
%Obtiene los títulos de las películas que son ciencia_ficcion y los pasa a la derecha.
%Reemplaza en la consulta actor. Sustituye el TituloPelicula por inception.
    %actor(NombreActor, inception)
%Busca hechos actor en la base que coincidan con el título inception.
% Compara todos los hechos actor en el orden que están escritos y luego determina cuales si son verdaderos.
%Encuentra actor(leonardo_dicaprio, inception). Es verdadero.
    % NombreActor es una variable -> sustituye por leonardo_dicaprio.
%Encuentra actor(matthew_mcconaughey, interestellar). Es verdadero.
    % NombreActor es una variable -> sustituye por matthew_mcconaughey.
%Encuentra actor(jessica_chastain, interestellar). Es verdadero.
    % NombreActor es una variable -> sustituye por jessica_chastain.
%Salida:
%TituloPelicula = inception,
%NombreActor = leonardo_dicaprio;
%TituloPelicula = interestellar,
%NombreActor = matthew_mcconaughey;
%TituloPelicula = interestellar,
%NombreActor = jessica_chastain.

% c) Consulta 3
?-pelicula(TituloPelicula,Genero).
%Recorre la base buscando hechos de pelicula.
%Compara todos los hechos de película en el orden que están escritos.
%Encuentra pelicula(inception, ciencia_ficcion):
    % TituloPelicula es una variable -> sustituye por inception.
    % Genero es una variable -> sustituye por ciencia_ficcion.
%Encuentra pelicula(forrest_gump, drama):
    % TituloPelicula es una variable -> sustituye por forrest_gump.
    % Genero es una variable -> sustituye por drama.
%Encuentra pelicula(jurassic_park, aventura):
    % TituloPelicula es una variable -> sustituye por jurassic_park.
    % Genero es una variable -> sustituye por aventura.
%Encuentra pelicula(interestellar, ciencia_ficcion):
    %TituloPelicula es una variable -> sustituye por interestellar.
    %Genero es una variable -> sustituye por ciencia_ficcion.
%Encuentra pelicula(revenant, aventura):
    %TituloPelicula es una variable -> sustituye por revenant.
    %Genero es una variable -> sustituye por aventura.
%Encuentra pelicula(naufrago, aventura):
    %TituloPelicula es una variable -> sustituye por naufrago.
    %Genero es una variable -> sustituye por aventura.
%Sigue recorriendo. No encuentra más hechos de pelicula.
%Salida:
%TituloPelicula = inception,
%Genero = ciencia_ficcion;
%TituloPelicula = forrest_gump,
%Genero = drama;
%TituloPelicula = jurassic_park,
%Genero = aventura;
%TituloPelicula = interestellar,
%Genero = ciencia_ficcion;
%TituloPelicula = revenant,
%Genero = aventura;
%TituloPelicula = naufrago,
%Genero = aventura.

% d) Consulta 4 
?-actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Recorre la base buscandos actores que actuen en inception.
% Compara todos los hechos actor en el orden que están escritos.
% Obtiene el nombre y pasa a la derecha. 
% Busca hechos actor en la base que coincidan con el nombre del actor de la anterior consulta y actuen en otra película.
% Compara que el nombre de la película sea distinto a inception. Si se cumple, entonces la consulta es verdadera y retorna el resultado.

% Consultas propias

% Consulta 5

% Consulta 6

%PARTE 3

% a) Verdadero si el actor actúa en una película de ese género.
actua_en_genero(NombreActor, Genero) :- 
    actor(NombreActor, TituloPelicula), 
    pelicula(TituloPelicula, Genero).
% b) Verdadero si dos actores actúan en la misma película.
colaboracion(NombreActor1, NombreActor2) :- 
    actor(NombreActor1, TituloPelicula), 
    actor(NombreActor2, TituloPelicula), 
    NombreActor1 \= NombreActor2.
% c) Verdadero si el director dirige una película de ese género.
director_de_genero(NombreDirector, Genero) :- 
    director(NombreDirector, TituloPelicula), 
    pelicula(TituloPelicula, Genero).
% d)  Verdadero si una película tiene al menos dos actores distintos.
pelicula_con_colaboracion(TituloPelicula) :- 
    pelicula(TituloPelicula, Genero), 
    actor(NombreActor1, TituloPelicula), 
    actor(NombreActor2, TituloPelicula), 
    NombreActor1 \= NombreActor2.
% regla propia: 
es_famosa(TituloPelicula) :- 
    director(NombreDirector, TituloPelicula), 
    actor(NombreActor, TituloPelicula).

%PARTE 4

% 1)

% 2)

sexo(leonardo_dicaprio, masculino).
sexo(tom_hanks, masculino).
sexo(matthew_mcconaughey, masculino).
sexo(jessica_chastain, femenino).
sexo(robin_wright, femenino).

% Regla: actriz_en_pelicula es verdadero si el sexo del actor es femenino y actua en esa película.
actriz_en_pelicula(NombreActriz, TituloPelicula) :-
    sexo(NombreActriz, femenino),
actor(NombreActriz, TituloPelicula).


