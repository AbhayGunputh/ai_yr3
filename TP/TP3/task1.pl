/* To check if an item is in a list */
in_list(Item, [Item|_]).
in_list(Item, [_|Rest]) :-
  in_list(Item, Rest).

/* Calculate the length of a list */
list_length([], 0).
list_length([_|Rest], Length) :-
  list_length(Rest, RestLength),
  Length is RestLength + 1.

/* Concatenate two lists */
concat_lists([], List, List).
concat_lists([X|List1], List2, [X|Result]) :-
  concat_lists(List1, List2, Result).

/* Delete an item from a list */
delete_item(Item, [Item|Rest], Rest).
delete_item(Item, [X|Rest], [X|Result]) :-
  delete_item(Item, Rest, Result).

/* Append an item to a list */
append_item(Item, List, Result) :-
  concat_lists(List, [Item], Result).

/* Insert an item in a list */
insert_item(Item, List, Result) :-
  delete_item(Item, Result, List).

