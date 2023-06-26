/* Facts */
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(e, h).
edge(f, i).
edge(g, i).

/* Rule */
connected(X, Y) :-
  edge(X, Y).

/* Depth-First Search */
dfs(Node, Node, [Node], _).
dfs(Start, Node, [Start|Path], Visited) :-
  connected(Start, Next),
  \+ member(Next, Visited), /* Avoid revisiting visited nodes */
  dfs(Next, Node, Path, [Next|Visited]).

/* Search for a specific node in the graph using depth-first search */
search_dfs(Node, Path) :-
  dfs(a, Node, Path, [a]). /* Start the search from node 'a' */
