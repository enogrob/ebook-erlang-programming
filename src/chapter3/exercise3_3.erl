-module(exercise3_3).
-export([print_integers/1, print_even_integers/1]).

-include_lib("eunit/include/eunit.hrl").

% Write a function that prints out the integers between 1 and N. Hint: use io:format("Number:~p~n",[N]).
print_integers(N) ->
  print_integers(N, 1).

print_integers(N, C) ->
  if
    (N /= C)  ->
      io:format("~p~n",[C]),
      print_integers(N, C+1);
    true ->
      io:format("~p~n",[C])
  end.

% Write a function that prints out the even integers between 1 and N. Hint: use guards.
print_even_integers(N) ->
  print_even_integers(N, 1).

print_even_integers(N, C) when N /= C, C rem 2 == 0 ->
  io:format("~p~n",[C]),
  print_even_integers(N, C+1);
print_even_integers(N, C) when N /= C, C rem 2 == 1 ->
  print_even_integers(N, C+1);
print_even_integers(N, C) when N == C, C rem 2 == 0 ->
  io:format("~p~n",[C]);
print_even_integers(N, C) when N == C, C rem 2 == 1 ->
  ok.
