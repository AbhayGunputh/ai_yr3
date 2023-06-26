/* Create an empty array */
max_list([X], X).

/* Compare the first element with the maximum of the rest of the list */
max_list([X|Rest], Max) :-
  max_list(Rest, MaxRest),
  X >= MaxRest,
  Max is X.
  
/* The maximum is in the rest of the list */
max_list([X|Rest], Max) :-
  max_list(Rest, MaxRest),
  X < MaxRest,
  Max is MaxRest.
