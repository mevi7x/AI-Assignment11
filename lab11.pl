start :-
    write('Hi. This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    loop([a, b, c]).

display_menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    write('|: ').

loop(L) :-
    display_menu,
    read(Choice),
    process(Choice, L).

process(1, L) :-
    write(L), nl,
    loop(L).

process(2, L) :-
    write('Enter letter: '), read(X),
    write('Enter position: '), read(Pos),
    insert_element(X, L, Pos, NewL),
    loop(NewL).

process(3, L) :-
    write('Enter letter: '), read(X),
    NewL = [X|L],
    loop(NewL).

process(4, L) :-
    write('Enter letter: '), read(X),
    append(L, [X], NewL),
    loop(NewL).

process(5, L) :-
    write('Enter letter to delete: '), read(X),
    delete(L, X, NewL),
    loop(NewL).

process(6, _) :-
    loop([]).

process(7, _) :-
    true.

process(_, L) :-
    loop(L).

insert_element(X, L, 1, [X|L]).
insert_element(X, [H|T], Pos, [H|T2]) :-
    Pos > 1,
    NextPos is Pos - 1,
    insert_element(X, T, NextPos, T2).