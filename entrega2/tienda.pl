% Base de productos para la tienda
producto(laptop, 800).
producto(celular, 300).
producto(tablet, 150).

% Clasificación con cut
clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio > 500,
    Categoria = caro,
    !.  % Cut: No backtrack si caro 

clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio >= 200, Precio =< 500,
    Categoria = medio,
    !. % Cut: No backtrack si medio 

clasificar(Producto, Categoria) :-
    producto(Producto, Precio),
    Precio < 200,
    Categoria = barato.

% Prueba:  ?- clasificar(laptop, C).
% C = caro.
% Sin cut Prolog intentaría hacer backtracking y podría devolver varias 
% soluciones incorrectas. Con cut evitamos que siga buscando más 
% categorías una vez clasificado.

% Ejercicio adicional
es_oferta(Producto) :-
    producto(Producto, Precio),
    Precio < 300,
    !.

es_oferta(_) :-
    fail.

% ?- es_oferta(celular).
% Falla: celular cuesta 300. 

% ?es_oferta(tablet).
% Verdadero: tablet cuesta 150 (<300).