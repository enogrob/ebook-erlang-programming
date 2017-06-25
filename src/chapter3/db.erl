-module(db).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

% exercise 3.4
new() ->
  [].

write(Key, Element, Db) ->
  [{Key, Element} | Db].

destroy(_Db) ->
  [],
  ok.

delete(Key, Db)->
  delete(Key, Db, []).

delete(_, [], Dbnew) ->
  Dbnew;
delete(Key, [H | T], Dbnew) ->
  {K, _E} = H,
  case K of
    Key ->
      delete(Key, T, Dbnew);
    _ ->
      delete(Key, T, [H | Dbnew])
  end.

read(Key, []) ->
  {error, Key};
read(Key, [H | T]) ->
  {K, E} = H,
  case K of
    Key ->
      {ok, E};
    _ ->
      read(Key, T)
  end.

match(Element, Db)->
  match(Element, Db, []).

match(_, [], Ks) ->
  Ks;
match(Element, [H | T], Ks) ->
  {K, E} = H,
  case E of
    Element ->
      match(Element, T, [K | Ks]);
    _ ->
      match(Element, T, Ks)
  end.

% exercise 3.4 tests
new_test() ->
  ?assertEqual([], new()).

write_test() ->
  ?assertEqual([{1, "beto"}], write(1, "beto", [])).

destroy_test() ->
  ?assertEqual(ok, destroy([{1,"beto"}])).

read_test() ->
  ?assertEqual({ok, "beto"}, read(1,[{1,"beto"}])).

delete_test() ->
  ?assertEqual([], delete(1, [{1,"beto"}])).
