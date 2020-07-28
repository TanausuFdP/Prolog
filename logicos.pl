fibo(0, 0).
fibo(1, 1).
fibo(N, V) :- N>1, N1 is N-1, N2 is N-2, fibo(N1, V1), fibo(N2, V2), V is V1+V2.

expo(_, 0, 1).
expo(B, N, V) :- N>0, N1 is N-1, expo(B, N1, V1), V is B*V1.

minimo([M], M).
minimo([Primero, Segundo | Resto], M) :- Primero<Segundo, minimo([Primero | Resto], M).
minimo([Primero, Segundo | Resto], M) :- Primero>Segundo, minimo([Segundo | Resto], M).

inserta([], V, [V]) :- !.
inserta([V],  V, [V]) :- !.
inserta([V | Resto], V, [V |Resto]) :- !.
inserta([Primero | Resto], V, [Primero | L1]) :- V>Primero, inserta(Resto, V, L1).
inserta([Primero | Resto], V, [V, Primero | Resto]) :- V<Primero.

concatena([], L, L).
concatena([Primero | Resto1], L, [Primero | Resto2]) :- concatena(Resto1, L, Resto2).

invierte([], []).
invierte([Primero | Resto], L) :- invierte(Resto, RestoI),
    concatena(RestoI, [Primero], L).
    
elimina([X], X, []).
elimina([X], Y, [X]) :- X\==Y.
elimina([Primero | Resto], X, L) :- X==Primero, elimina(Resto, X, L).
elimina([Primero | Resto], X, L) :- X\==Primero, elimina(Resto, X, L1),
    concatena([Primero], L1, L).

repetidos([], []) :- !.
repetidos([X], [X]) :- !.
repetidos(L1, L2) :- invierte(L1, [Ultimo | Resto]), elimina(Resto, Ultimo, EliminadoInvertido),
      invierte(EliminadoInvertido, Eliminado), repetidos(Eliminado, Eliminado2),
      concatena(Eliminado2, [Ultimo], L2).