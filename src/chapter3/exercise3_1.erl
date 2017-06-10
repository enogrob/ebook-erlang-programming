-module(exercise3_1).
-export([sum/1, sum/2]).

-include_lib("eunit/include/eunit.hrl").

sum(N) ->
  round((N*(N+1))/2).

sum(N, M) ->
if
  (M >= N) ->
    sum(M) - sum(N-1);
  true ->
    nok
end.

% Tests
sum1_test() ->
  ?assertEqual(15, sum(5)).

sum2_test() ->
  ?assertEqual(21, sum(6)).

sum3_test() ->
  ?assertEqual(15, sum(1, 5)).

sum4_test() ->
  ?assertEqual(5, sum(5, 5)).
