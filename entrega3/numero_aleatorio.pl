%Parte 3: Iteración con random e Impresión Recursiva
% Implementa un predicado recursivo para imprimir N números aleatorios entre 1 y 100, 
% usando iteración recursiva.

imprimir(1) :-
    random(1, 100, A),
    write(A), nl,
    write('fin'), nl,
    !.

imprimir(X) :-
    X > 1,
    random(1, 100, A),
    write(A), nl,
    X1 is X - 1,
    imprimir(X1).

% Prueba: ?- imprimir(5).
% Explicación caso base imprimir(1)

% Si es 1, genera un número aleatorio.
% Se escribe el mensaje "fin"
% Con el cut corta el flujo (no se buscan alternativas ni vuelve atrás).
