-module(exercises).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

% exercise 2-2: modules and functions
area({square, Side}) ->
  Side * Side ;
area({circle, Radius}) ->
  math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
  S = (A + B + C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C));
area(_Other) ->
  {error, invalid_object}.

% exercises 2-2: tests
area1_test() ->
  ?assertEqual(4, area({square, 2})).

area2_test() ->
  ?assertEqual(math:pi() * 2 * 2, area({circle, 2})).

area3_test() ->
  S = (2 + 3 + 4)/2,
  R = math:sqrt(S*(S-2)*(S-3)*(S-4)),
  ?assertEqual(R, area({triangle, 2, 3, 4})).

area4_test() ->
  ?assertEqual({error, invalid_object}, area({line, 2})).


% exercise 2-3: simple pattern matching
b_not(false) ->
  true;
b_not(true) ->
  false.

b_and(true, true) ->
  true;
b_and(_, _) ->
  false.

b_or(true, _) ->
  true;
b_or(_, true) ->
  true;
b_or(_, _) ->
  false.

b_nand(true, false) ->
  true;
b_nand(false, true) ->
  true;
b_nand(_, _) ->
  false.
