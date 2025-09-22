% Implementar un predicado recursivo “aumento_productos” que aplique un aumento del 
% 5% a todos los productos de la categoría E, actualizando sus precios en la base de hechos 
% utilizando retract y assert. 

producto(manzana, 100, e). % 100 * 1.05 = $105.0
producto(leche, 200, f).
producto(banana, 80, e). % 80 * 1.05 = $84.0
producto(yogurt, 180, f).
producto(pan, 100, e). % 100 * 1.05 = $105.0

aumento_productos :-
    producto(Nombre, Precio, e),
    retract(producto(Nombre, Precio, e)),
    NuevoPrecio is Precio * 1.05,
    assertz(producto(Nombre, NuevoPrecio, e)),
    write(Nombre), write(' - Nuevo precio: $'), write(NuevoPrecio),
    write(' - Categoría: e'), nl,
    fail.
aumento_productos.


