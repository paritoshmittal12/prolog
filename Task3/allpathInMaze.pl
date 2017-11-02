%!	The maze is coded as facts denoting where can we move from one point taking a single step.
%!	These facts are used to move in a maze.
canMove(1,2).
canMove(1,7).
canMove(2,8).
canMove(3,4).
canMove(3,9).
canMove(4,5).
canMove(4,10).
canMove(5,6).
canMove(5,11).
canMove(6,12).
canMove(7,8).
canMove(7,13).
canMove(8,14).
canMove(9,10).
canMove(10,11).
canMove(11,12).
canMove(11,17).
canMove(12,18).
canMove(13,14).
canMove(13,19).
canMove(14,15).
canMove(15,16).
canMove(16,22).
canMove(17,18).
canMove(17,23).
canMove(19,20).
canMove(19,25).
canMove(20,26).
canMove(21,22).
canMove(21,27).
canMove(22,28).
canMove(22,23).
canMove(24,30).
canMove(25,26).
canMove(25,31).
canMove(26,32).
canMove(27,28).
canMove(29,30).
canMove(29,35).
canMove(30,36).
canMove(31,32).
canMove(32,33).
canMove(33,34).
canMove(34,35).
canMove(35,36).

%! Shows if A can go to B then B can also go to A.
move(X,Y):-canMove(X,Y).
move(X,Y):-canMove(Y,X).

%! list of points from start to end
sPoints([s1,s2,s3]).
fPoints([f3,f2,f1]).

%! This fact maps the start points to square number in maze.
start(s1,1).
start(s2,13).
start(s3,25).

%! This fact maps the finish points to square number in maze.
end(f3,12).
end(f2,24).
end(f1,36).

%! adding variables to start query
path(S,F):-path(S,F,V,P).

%! Finds the intermediate paths 
%! Visit array makes sure we do not end in a loop.

interPath(S,F,Visit,[S,F]):-move(S,F).
interPath(S,F,Visit,[S|Ss]):-move(S,Z),Z\=F,not(member(Z,Visit)),interPath(Z,F,[S|Visit],Ss).

%! finds all path from a given start and end point
path(S,F,Visit,Path):-start(S,SPoint),end(F,FPoint),findall(Path,(Visit=[],interPath(SPoint,FPoint,Visit,Path)),Z),format('Path from ~w to ~w :\n',[S,F]),write(Z),write('\n').

%! finds all path from all pair of start and end points
gPath():-sPoints(SList),fPoints(FList),findall((member(S,SList),member(F,FList)),path(S,F),Z).