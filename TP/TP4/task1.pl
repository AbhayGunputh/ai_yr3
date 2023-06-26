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

/* Breadth-First Search */
bfs(Node, Node, [Node], _).
bfs(Start, Node, [Start|Path], Visited) :-
  connected(Start, Next),
  \+ member(Next, Visited), /* Avoid revisiting visited nodes */
  append(Visited, [Next], UpdatedVisited),
  bfs(Next, Node, Path, UpdatedVisited).

/* Search for a specific node in the graph using breadth-first search */
search_bfs(Node, Path) :-
  bfs(a, Node, Path, [a]). /* Start the search from node 'a' */
