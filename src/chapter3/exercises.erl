-module(exercises).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

% exercise 3.1
sum(N) ->
  round((N*(N+1))/2).

sum(N, M) ->
if
  (M >= N) ->
    sum(M) - sum(N-1);
  true ->
    nok
end.

% exercise 3.1 tests
sum1_test() ->
  ?assertEqual(15, sum(5)).

sum2_test() ->
  ?assertEqual(21, sum(6)).

sum3_test() ->
  ?assertEqual(15, sum(1, 5)).

sum4_test() ->
  ?assertEqual(5, sum(5, 5)).

% exercises 3.2
%%%%%%%%%%%%%%%
%
% description:
%   write a function that returns a list of the format [1,2,..,N-1,N].
%
%   example:
%     create(3) ⇒ [1,2,3].
create(N) ->
  create(N, []).

create(N, O) ->
  if
    (N == 1) ->
      [N] ++ O;
    true ->
      create(N-1, [N] ++ O)
  end.

% description:
%   write a function that returns a list of the format [N, N-1,..,2,1].
%
% example:
%   reverse_create(3) ⇒ [3,2,1].
reverse_create(N) ->
  reverse_create(N, []).

reverse_create(N, O) ->
  if
    (N == 1) ->
      O ++ [N];
    true ->
      reverse_create(N-1, O ++ [N])
  end.

% exercises 3.2 tests
create1_test() ->
  ?assertEqual([1,2,3], create(3)).

reverse_create1_test() ->
  ?assertEqual([3,2,1], reverse_create(3)).

% exercise 3.3
%%%%%%%%%%%%%%
%
% description:
%   write a function that prints out the integers between 1 and N. Hint: use io:format("Number:~p~n",[N]).
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

% description:
%   write a function that prints out the even integers between 1 and N. Hint: use guards.
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
