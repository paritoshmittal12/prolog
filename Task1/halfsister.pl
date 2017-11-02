%!	The following Prolog code determines the Half Sister relationship
%!	There are two three types of facts parent, male and female.
%!	sister,otherParent are rules to determine the relationships
%!	Half sister is a female who has only one parent common.
%

%! Parent fact
parent(jatin,avantika).
parent(jolly,jatin).
parent(jolly,kattappa).
parent(manisha,avantika).
parent(manisha,shivkami).
parent(bahubali,shivkami).

%! Male fact
male(kattappa).
male(jolly).
male(bahubali).
male(jatin).

%! Female fact
female(shivkami).
female(avantika).
female(manisha).

%! Rules
notSame(A,B):-A\=B.

sister(P,A,B):-parent(P,A),parent(P,B).
otherParent(P1,P2,A):-parent(P2,A),notSame(P1,P2).

%! A is a half sister of B
halfsister(A,B):-female(A),sister(P,A,B),otherParent(P,PA2,A),otherParent(P,PB2,B),notSame(PA2,PB2).	
