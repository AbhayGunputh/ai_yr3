% FACTS. 
mammal(kitty).
mammal(ratatat).
mammal(fido).
claws(kitty).
tail(ratatat).
bestfriend(fido).
feathers(tweety).


has_fur(X) :- mammal(X).
rat(X) :- has_fur(X), tail(X).
cat(X) :- has_fur(X), claws(X).
meows(X) :- cat(X).
bird(X) :- feathers(X).
dog(X) :- bestfriend(X), has_fur(X).
likes(X, Y) :- dog(X), meows(Y).
likes(X, Y) :- cat(X), bird(Y).
likes(X, Y) :- cat(X), rat(Y).
