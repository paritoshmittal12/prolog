
%!	The following Prolog code determines the Uncle relationship
%!	There are two three types of facts parent, male and female.
%!	father,brother are rules to determine the relationships
%!	uncle is a brother to father.
%
%! Parent Fact
parent(jatin,avantika).
parent(jolly,jatin).
parent(jolly,kattappa).
parent(manisha,avantika).
parent(manisha,shivkami).
parent(bahubali,shivkami).

%! Male Fact
male(kattappa).
male(jolly).
male(bahubali).
male(jatin).

%! Female Fact
female(shivkami).
female(avantika).
female(manisha).

%! Rules sw
father(F,B):-parent(F,B),male(F).
notSame(A,B):-A\=B.

%! A is a brother of B
brother(A,B):-male(A),parent(C,A),parent(C,B),notSame(A,B).
uncle(U,C):-father(F,C),brother(U,F).
