% Clase práctica 15/09/25

% Base de conocimiento
nodo(7,4,8).
nodo(4,2,9).
nodo(2,nil, nil).
nodo(9, nil, nil).
nodo(8,5,1).
nodo(5, nil, nil).
nodo(1, 6,nil).
nodo(6, nil, nil).

% Reglas

% Caso Base:
% cuando el arbol está vacío
preorden(nil) :- !.

% Caso General:
% hay un elemento (no está vacío)
preorden(R) :- 
    write(R),
    nodo(R, I, D),
    preorden(I),
    preorden(D).

% Preorden(7): 7 - 4 - 2 - 9 - 8 - 5 - 1 - 6.
% Hace backtracking para subir en el arbol y buscar los D.

% Nodo: 7, Hijo izq: 4, Hijo der: 8.
% Hijo izq de 7: 4, izq: 2, der: 9.
% Hijo der de 7: 8, izq: 5, der: 1.
% Hijo der de 1: 6.

inorden(nil) :- !.

inorden(R) :- 
    
    nodo(R, I, D),
    inorden(I),
    write(R),
    inorden(D).

posorden(R) :- 
    nodo(R, I, D),
    posorden(I),
    posorden(D),
    write(R).

% Preorden: R I D
% Inorden: I R D
% Posorden: I D R
% Mayor.

