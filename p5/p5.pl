%
% CS 430 P5 (Prolog 1)
%
% Name: Brendan Pho
%

parent(X,Y) :-
  parents(X,_,Y).
parent(X,Y) :-
  parents(X,Y,_).

step_parent(X,Y) :-
  \+parent(X,Y),
  parent(X,S),
  spouse(S,Y). 

sibling(X,Y) :-
  parent(X,S),
  parent(Y,B),
  S=B,
  X\==Y.

aunt_uncle(X,Y) :-
  parent(X,S),
  sibling(Y,S).

grandparent(X,Y) :-
  parent(X,S),
  parent(S,Y).

ancestor(X,Y) :-
  parent(X,Y).
ancestor(X,Y) :- 
  parent(X,S), 
  ancestor(S,Y).

relative(X,Y) :-
  ancestor(X,Y),
  X\==Y.
relative(X,Y) :-
  sibling(X,Y).

in_law(X,Y) :-
  spouse(X,S),
  \+relative(X,Y),
  relative(S,Y).
