%ewanzel

-module(queens).
-export([queens/1]).

queens(0) -> [[]];
queens(N) ->
	[[Row | Columns] ||
		Columns <- queens(N -1),
		Row <- [1,2,3,4,5,6,7,8] -- Columns,
		safe(Row, Columns, 1)].

safe(_Row,[],_N) -> true;
safe(Row,[Column|_Columns],N) ->
	(Row /= Column + N) andalso (Row /= Column - N) andalso
	safe(Row, Column, (N+1)).

