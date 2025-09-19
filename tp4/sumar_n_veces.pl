%Otro Ejercicio diferente
%Sumar N veces un numero
%Probar con sumar_n_veces(2,4,R).

sumar_n_veces(0,-,0).
sumar_n_veces(X,Y,R) :- X =\= 0,
suma(X,Y,0,0,R).

%Caso Base
suma(X,Y,Y,A,A).

%Caso General
suma(X,Y,C,A,R):- C < Y,
A1 is X + A,
C1 is C+1,
suma(X,Y,C1,A1,R).