% Diagnóstico de causas de mal funcionamiento del ventilador
% diag_ventilador.pl  Fech: 21/2/2020
% Utiliza sireg2P18.pl

/***  Las reglas de producción
1 - Si el motor está trancado, está falto de grasa con FC=0.9.
2 - Si el motor no arranca y no se calienta, el circuito de alimentación está abierto con FC=0.8.
3 - Si el motor no arranca y no se calienta, el problema está en el motor FC=0.2.
4 - Si el motor no arranca y se calienta, sin estar trancado, el problema está en el motor FC=0.8.
5 - Si el motor gira a baja velocidad, sin estar trancado, el problema está en el motor FC=0.8.
6 - Si el motor hace mucho ruido al girar, el problema está en los bujes con FC=0.9.
***/

% Las preguntas
prop(1, 'el motor está trancado', p).
prop(2, 'el motor arranca', p).
prop(3, 'el motor se calienta', p).
prop(4, 'el motor gira a baja velocidad', p).
prop(5, 'el motor hace ruido', p).

% Los objetivos
prop(101, 'el motor está falto de grasa', i).
prop(102, 'el circuito de alimentación está abierto', i).
prop(103, 'el problema está en el motor', i).
prop(104, 'el problema está en los bujes', i).

% Las reglas
regla(1, y, [1], 101, 0.9).
regla(2, y, [-2, -3], 102, 0.8).
regla(3, y, [-2, -3], 103, 0.2).
regla(4, y, [-2, 3, -1], 103, 0.8).
regla(5, y, [4, -1], 103, 0.8).
regla(6, y, [5], 104, 0.9).

clase(1, objetivos, [101, 102, 103, 104]).

% Función principal
main :-
    nl, write('DIAGNÓSTICO DE MAL FUNCIONAMIENTO DE UN VENTILADOR'),
    nl, nl,
    repeat,
        write('CONSULTA'),
        borrar_pesos,
        pesos_clase(1, _, Lw),
        nl, nl, write('RESULTADO'),
        reportar_clase(1, _),
        nl, write('¿Otra consulta? [s/n]: '), read(R),
    (R = s -> fail; true),
    nl, nl, write('FIN'), nl, nl.

% Borrar pesos
borrar_pesos :-
    retract(peso(_, _)),
    fail.
borrar_pesos.

% Calcular pesos de la clase
pesos_clase(Clase, _, Lw) :-
    clase(Clase, _, Objetivos),
    findall(W, (member(O, Objetivos), peso(O, W)), Lw).

% Reportar clase
reportar_clase(Clase, _) :-
    clase(Clase, _, Objetivos),
    write('Diagnóstico: '), nl,
    member(O, Objetivos),
    prop(O, Desc, _),
    peso(O, W),
    format('~w con FC = ~2f~n', [Desc, W]),
    fail.
reportar_clase(_, _).

% Peso de los objetivos
peso(Objetivo, W) :-
    findall(P, (regla(_, y, Conds, Objetivo, P), cumple(Conds)), Pesos),
    sumlist(Pesos, W).

% Verificar condiciones
cumple([]).
cumple([Cond | Conds]) :-
    Cond > 0,
    prop(Cond, Pregunta, p),
    format('¿~w? [s/n]: ', [Pregunta]),
    read(Resp),
    (Resp = s -> cumple(Conds); fail).
cumple([Cond | Conds]) :-
    Cond < 0,
    CondPos is -Cond,
    prop(CondPos, Pregunta, p),
    format('¿~w? [s/n]: ', [Pregunta]),
    read(Resp),
    (Resp = n -> cumple(Conds); fail).