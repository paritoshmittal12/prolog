%! Search query in two lists
%! Assumption roll no. is primary key.

%! First list containing Roll No., Name, EmailId, and Type
rslist([[1,'P M','p@g.com','regular'],[2,'Q M','q@g.com','regular'],
	[3,'R M','r@g.com','part time'],[4,'A M','a@g.com','part time'],
	[5,'S M','s@g.com','regular'],[6,'D M','d@g.com','part time'],
	[7,'F M','f@g.com','QIP'],[8,'V M','v@g.com','QIP'],
	[9,'P M','pm@g.com','foreign student'],[10,'L M','l@g.com','foreign student']]).

%! Second Suplementary list containing Roll No., Name, Supervisor, and Co-Supervisor
rssuplist([[1,'P M','regular','sp 1',''],[2,'Q M','regular','sp 2','co sup 1'],
	[3,'R M','part time','sp 3','co sup 1'],[4,'A M','part time','sp 4',''],
	[5,'S M','regular','sp 1','co sup 2'],[6,'D M','part time','sp 3','co sup 3'],
	[7,'F M','QIP','sp 1',''],[8,'V M','QIP','sp 5','co sup 4'],
	[9,'P M','foreign student','sp 2','co sup 1'],[10,'L M','foreign student','sp 6','']]).

%! iteratively searches the first or the second element in a list for a match
find(A,[Head|Tail]):-A=Head.
find(A,[Head|Tail]):-[H2|SubTail]=Tail,A=H2.

searchlist(A,R1):-rslist(L),member(X,L),find(A,X),R1=X.
searchsuplist([R1Head|_],R2):-rssuplist(L),member(X,L),find(R1Head,X),R2=X.

%! the query statement searches for A in First List then from primary key into Second List
search(A):-searchlist(A,R1),searchsuplist(R1,R2),printInFormat(R1,R2).

%! use of Format to print the answer in a desired format.
printInFormat(List1,List2):-format('Roll Number: ~w Name: ~w EmailId: ~w',List1),format('~i ~i ~i Supervisor: ~w Co_Supervisor: ~w',List2),format('~i ~i ~i Type: ~w',List1).