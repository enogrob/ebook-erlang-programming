-module(exercise3_2).
-export([create/1, reverse_create/1]).

-include_lib("eunit/include/eunit.hrl").

% Write a function that returns a list of the format [1,2,..,N-1,N].
% Example:
% create(3) ⇒ [1,2,3].
create(N) ->
  create(N, []).

create(N, O) ->
  if
    (N == 1) ->
      [N] ++ O;
    true ->
      create(N-1, [N] ++ O)
  end.

% Write a function that returns a list of the format [N, N-1,..,2,1].
% Example:
% reverse_create(3) ⇒ [3,2,1].
reverse_create(N) ->
  reverse_create(N, []).

reverse_create(N, O) ->
  if
    (N == 1) ->
      O ++ [N];
    true ->
      reverse_create(N-1, O ++ [N])
  end.

% Tests
create1_test() ->
  ?assertEqual([1,2,3], create(3)).

reverse_create1_test() ->
  ?assertEqual([3,2,1], reverse_create(3)).
