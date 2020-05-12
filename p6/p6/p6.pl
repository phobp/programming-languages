%
% CS 430 Spring 2020 P6 (Prolog 2)
%
% Name: Brendan Pho 
%

eval([eint,X],X).
eval([eadd,X,Y],Z) :- eval(X,XZ), eval(Y,YZ), Z is XZ + YZ.
eval([esub,X,Y],Z) :- eval(X,XZ), eval(Y,YZ), Z is XZ - YZ.
eval([emul,X,Y],Z) :- eval(X,XZ), eval(Y,YZ), Z is XZ * YZ.

countOps([eint,_],0).
countOps([_,X,Y],Z) :- countOps(X,XZ), countOps(Y,YZ), Z is 1 + XZ + YZ.

height([eint,_],1).
height([_,X,Y],Z) :- height(X,A1), height(Y,A2), A1>A2, Z is 1+A1.
height([_,_,Y],Z) :- height(Y,A2), Z is 1+A2.

postfix([eint,X],[X]).
postfix([eadd,X,Y],Z) :- postfix(X,A1), postfix(Y,A2), append(A1,A2,B), append(B,[+],Z).
postfix([esub,X,Y],Z) :- postfix(X,A1), postfix(Y,A2), append(A1,A2,B), append(B,[-],Z).
postfix([emul,X,Y],Z) :- postfix(X,A1), postfix(Y,A2), append(A1,A2,B), append(B,[*],Z).
                     
uniqInts([eint,X],[X]).
uniqInts([_,X,Y],Z) :- uniqInts(X,XZ), uniqInts(Y,YZ), append(XZ,YZ,O), sort(O,Z).

