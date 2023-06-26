% Create the Genders
male(carlos).
male(vikram).
male(anil).
male(abhay).
male(adarsh).
male(akhil).

female(ansuya).
female(simla).
female(preity).

% Create the Relationships
parent(carlos, vikram).
parent(ansuya, vikram).
parent(carlos, anil).
parent(ansuya, anil).
parent(vikram, abhay).
parent(simla, abhay).
parent(vikram, adarsh).
parent(simla, adarsh).
parent(anil, akhil).
parent(preity, akhil).

% Father
father(Parent, Child) :-
  male(Parent),
  parent(Parent, Child).

% Mother
mother(Parent, Child) :-
  female(Parent),
  parent(Parent, Child).

% Child
child(Child, Parent) :-
  parent(Parent, Child).

% Son
son(Child, Parent) :-
  male(Child),
  child(Child, Parent).

% Daughter
daughter(Child, Parent) :-
  female(Child),
  child(Child, Parent).

% Grandparent
grandparent(GP, GC) :-
  parent(GP, X),
  parent(X, GC).

% Grandmother
grandmother(GM, GC) :-
  female(GM),
  grandparent(GM, GC).

% Grandfather
grandfather(GF, GC) :-
  male(GF),
  grandparent(GF, GC).

% Grandchild
grandchild(GC, GP) :-
  grandparent(GP, GC).

% Grandson
grandson(GS, GP) :-
  male(GS),
  grandchild(GS, GP).

% Granddaughter
granddaughter(GD, GP) :-
  female(GD),
  grandchild(GD, GP).

% Spouse
spouse(Husband, Wife) :-
  married(Husband, Wife).
spouse(Wife, Husband) :-
  married(Husband, Wife).

% Husband
husband(Person, Wife) :-
  male(Person),
  spouse(Person, Wife).

% Wife
wife(Person, Husband) :-
  female(Person),
  spouse(Person, Husband).

% Sibling
sibling(Person1, Person2) :-
  parent(Parent, Person1),
  parent(Parent, Person2),
  Person1 \= Person2.

% Brother
brother(Person, Sibling) :-
  male(Person),
  sibling(Person, Sibling).

% Sister
sister(Person, Sibling) :-
  female(Person),
  sibling(Person, Sibling).

% Aunt
aunt(Person, NieceNephew) :-
  sister(Person, Parent),
  parent(Parent, NieceNephew).

% Uncle
uncle(Person, NieceNephew) :-
  brother(Person, Parent),
  parent(Parent, NieceNephew).

% Nephew
nephew(Person, AuntUncle) :-
  male(Person),
  parent(Parent, Person),
  sibling(Parent, AuntUncle).

% Niece
niece(Person, AuntUncle) :-
  female(Person),
  parent(Parent, Person),
  sibling(Parent, AuntUncle).

% First Cousin
first_cousin(Person1, Person2) :-
  parent(Parent1, Person1),
  parent(Parent2, Person2),
  sibling(Parent1, Parent2).
  
% Nth Cousins
nth_cousins(Person1, Person2, N) :-
  parent(Parent1, Person1),
  parent(Parent2, Person2),
  nth_cousins_helper(Parent1, Parent2, N).