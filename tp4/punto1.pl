%Sentencia random prueba:
%?-X is random (10).

% Punto 1
% Imprimir por pantalla 10 numeros aleatorios.
% Aclaración (Es una recursividad a la derecha).

aleatorio() :- numeros(1).

% Caso Base 
numeros(10) :- X is random(10), write(X), nl.

% Caso General
numeros(C) :- C < 10,
C1 is C + 1,
X is random(10),
write(X), nl,
numeros(C1).
