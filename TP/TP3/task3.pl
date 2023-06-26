% Given facts
father(paul, jack).
father(paul, joe).
father(joe, lana).
father(jack, lina).
% Rule to determine if X and Y are brothers
brother(X, Y) :-
    father(F, X),
    father(F, Y),
    X \= Y.

% Rule to determine if X and Y are cousins
cousin(X, Y) :-
    father(F1, X),
    father(F2, Y),
    brother(F1, F2),
    X \= Y.

% Rule to determine if X is a grandson of Y
grandson(X, Y) :-
    father(Y, F),
    father(F, X).

% Rule to determine if X is a descendant of Y
descendent(X, Y) :-
    father(Y, X).
descendent(X, Y) :-
    father(Y, Z),
    descendent(X, Z).