% Declarar predicados dinámicos
:- dynamic libro/2.
:- dynamic prestado/2.

libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").

% 1. Repaso de dynamic: En tu código, :- dynamic libro/2. permite modificar libro/2 Explica 
% por qué es necesario dynamic.

% En Prolog, al declarar :- dynamic libro/2 indica que el predicado libro/2 
% puede modificarse en tiempo de ejecución. Esto es necesario porque la 
% base de conocimiento biblioteca no es estática: se usan operaciones como 
% asserta/1 o assertz/1 para agregar hechos nuevos y retract/1 para eliminar
% hechos ya existentes. Sin esta declaración, Prolog daría error al intentar 
% usar asserta, assertz o retract sobre ese predicado.  

% 2. Implementa eliminar_libro(Titulo): Verifica si el libro existe y no está prestado, 
% elimínalo con retract, e imprime un mensaje. Si está prestado, usa fail para fallar y 
% mostrar un error.

eliminar_libro(Titulo):-
    libro(Titulo, _), 
    \+ prestado(Titulo, _), 
    retract(libro(Titulo, _)), 
    write('Libro eliminado: '),
    write(Titulo), nl. 

eliminar_libro(Titulo) :- 
    prestado(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,
    fail.

eliminar_libro(Titulo) :-
    \+ libro(Titulo, _),
    write('Error: Libro '), write(Titulo), write(' no existe.'), nl,
    fail.

% Prueba: ?- eliminar_libro("1984").
% Prolog busca libro("1984", Autor) en la base de conocimiento.
% Existe el hecho libro("1984", "george_orwell"). Da verdadero.
% Verifica que no esté prestado con \+ prestado(Titulo, _). No está prestado.
% Ejecuta retract(libro("1984", _)) y elimina el libro de la base.
% Muestra el mensaje.

% Salida: 
% Libro eliminado: 1984.
% true.

% Prueba: ?- eliminar_libro("el_principito").
% Prolog busca el hecho libro("el_principito", Autor).
% Existe el hecho libro("el_principito", "antoine_de_saint_exupery"). Da verdadero.
% Verifica que no esté prestado con \+ prestado(Titulo, _). Falla porque si está prestado.
% Muestra el mensaje de error en pantalla.

% Salida: Libro el_principito está prestado.

% Ejercicio Adicional
eliminar_prestamo(Titulo) :-
    prestado(Titulo, _),
    retract(prestado(Titulo, _)),
    write('Préstamo eliminado: '), write(Titulo), nl.

eliminar_prestamo(Titulo) :-
    \+ prestado(Titulo, _),
    write('Error: No existe préstamo para '), write(Titulo), nl,
    fail.







