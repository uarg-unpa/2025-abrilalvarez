%PARTE 1 - REPRESENTAR ENUNCIADOS COMO HECHOS
pelicula(inception, ciencia_ficcion).
pelicula(forrest_gump, drama).
pelicula(jurassic_park, aventura).

actor(leonardo_dicaprio, inception).
actor(tom_hanks, forrest_gump).

director(christopher_nolan, inception).
director(steven_spielberg, jurassic_park).

%AGREGAR AL MENOS 5 HECHOS ADICIONALES
pelicula(interstellar, ciencia_ficcion).
pelicula(revenant, aventura).
pelicula(naufrago, aventura).

actor(matthew_mcconaughey, interstellar).
actor(jessica_chastain, interstellar).
actor(robin_wright, forrest_gump).
actor(leonardo_dicaprio, revenant).
actor(tom_hanks, naufrago).

% PARTE 2
% a) Consulta 1 
?- director(christopher_nolan, TituloPelicula).
% Recorre la base buscando hechos director, donde el nombre del director sea christopher_nolan. 
% Compara todos los hechos director en el orden que están escritos y luego determina cuales si son verdaderos.
% Si encuentra christopher_nolan, sigue con la otra parte de la consulta.
% encuentra director(christopher_nolan, inception). Es verdadero.
    % christopher_nolan coincide -> continua con la siguiente parte.
    % TituloPelicula es variable -> sustituye y unifica por inception.
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
%TituloPelicula = interstellar,
%NombreActor = matthew_mcconaughey;
%TituloPelicula = interstellar,
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
%Encuentra pelicula(interstellar, ciencia_ficcion):
    %TituloPelicula es una variable -> sustituye por interstellar.
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
%TituloPelicula = interstellar,
%Genero = ciencia_ficcion;
%TituloPelicula = revenant,
%Genero = aventura;
%TituloPelicula = naufrago,
%Genero = aventura.

% d) Consulta 4 
?-actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Recorre la base buscandos actores que actuen en inception.
% Compara todos los hechos actor en el orden que están escritos.
% Encuentra el primer hecho actor(leonardo_dicaprio, inception). Inception coincide, por lo tanto, unifica y sustituye NombreActor por leonardo_dicaprio. 
% Sigue recorriendo la base hasta el final comparando los hechos actor. No encuentra más coincidencias.
% Obtiene el nombre leonardo_dicaprio y pasa a la derecha. Reemplaza en actor(NombreActor, OtraPelicula) el nombre del actor por leonardo_dicaprio.
% Busca hechos actor en toda la base que coincidan con el nombre del actor y actuen en otra película (que no sea inception).
% Compara todos los hechos actor en el orden que están escritos y encuentra actor(leonardo_dicaprio, revenant). Es verdadero. 
% Llega al final y no encuentra más hechos de actor que coincidan.
% Salida:
% NombreActor = leonardo_dicaprio,
% OtraPelicula = revenant.

% Consultas propias

% Consulta 5: ¿Qué películas dirigió Steven Spielberg y cuál es el género de cada una?
?-director(steven_spielberg, TituloPelicula), pelicula(TituloPelicula, Genero).
% Recorre la base buscando hechos director donde el nombre del director sea steven_spielberg.
% Encuentra director(steven_spielberg, jurassic_park).
    % Sustituye y unifica TituloPelicula por jurassic_park.
% Luego pasa a la segunda parte de la consulta: pelicula(jurassic_park, Genero).
% Busca hechos pelicula donde el titulo de película sea jurassic_park.
% Encuentra pelicula(jurassic_park, aventura).
    % Sustituye Genero por aventura.
% Salida:
% Titulo = jurassic_park,
% Genero = aventura.

% Consulta 6: ¿Qué director dirigió jurassic park y cuál es su género?
?-director(NombreDirector, jurassic_park), pelicula(jurassic_park, Genero).
% Recorre la base buscando hechos director donde el segundo argumento sea jurassic_park.
% Encuentra director(steven_spielberg, jurassic_park).
    % Sustituye NombreDirector por steven_spielberg.
% Luego pasa a la segunda parte de la consulta: pelicula(jurassic_park, Genero).
% Busca hechos pelicula donde el titulo de la pelicula sea jurassic_park.
% Encuentra pelicula(jurassic_park, aventura).
    % Sustituye Genero por aventura.
% Salida:
% NombreDirector = steven_spielberg,
% Genero = aventura.

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
% regla propia: es_famosa(TituloPelicula): Verdadero si una película tiene al menos un actor y un director asociados.
es_famosa(TituloPelicula) :- 
    director(NombreDirector, TituloPelicula), 
    actor(NombreActor, TituloPelicula).

%PARTE 4

% 1)

?-pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).

% En la consulta ?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula)., 
% Prolog primero intenta resolver la consulta pelicula(TituloPelicula, ciencia_ficcion). 
% Para ello recorre los hechos de la base en el orden que fueron escritos y busca coincidencias. 
% Al encontrar, por ejemplo, pelicula(inception, ciencia_ficcion), unifica los términos: 
% TituloPelicula (variable) se sustituye por inception, ya que ambos ocupan la misma posición y son idénticos. 
% Luego aplica esta sustitución a la derecha, obteniendo actor(NombreActor, inception). 
% Prolog busca ahora actores de esa película en la base y, al encontrar actor(leonardo_dicaprio, inception), unifica NombreActor con leonardo_dicaprio. 
% La solución parcial se completa y se devuelve como respuesta.

% Cuando el usuario solicita más soluciones (;), Prolog inicia el proceso de backtracking. 
% Busca si existen más actores en la misma película de ciencia ficción. 
% Si los hubiera, devuelve nuevas respuestas unificando la variable NombreActor con esos hechos alternativos. 
% Una vez finalizadas esas opciones, retrocede a pelicula(TituloPelicula, ciencia_ficcion).
% y prueba con otra coincidencia, por ejemplo pelicula(interstellar, ciencia_ficcion). Con esa nueva sustitución, repite el proceso para actor. 
% Así, mediante unificación y backtracking, Prolog va encadenando los resultados hasta enumerar todas las soluciones posibles.

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


