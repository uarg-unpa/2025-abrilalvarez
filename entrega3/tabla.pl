
% Ejercicio Adicional: 
% Modifica para una tabla de multiplicación recursiva (TP4 ejercicio 2): 
% tabla(N, M) que imprima N*1 hasta N*10, usando recursión (caso base M=10). 

% Caso base: M = 10
tabla(N, 10) :-
    R is N * 10,
    write(N), write(' * 10 = '), write(R), nl,
    write('fin'), nl, !.

% Caso recursivo: desde M hasta 10 (M < 10)
tabla(N, M) :-
    M < 10,
    R is N * M,
    write(N), write(' x '), write(M), write(' = '), write(R), nl,
    M1 is M + 1,
    tabla(N, M1).


