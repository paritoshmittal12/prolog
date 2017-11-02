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

%! adding variables to start query. PLength stores the current path length
%
path(S,F):-path(S,F,V,P,PLength).

%! Finds the intermediate paths 
%! Visit array makes sure we do not end in a loop.
%! A global variable stores the min. Pathlength. Once we reach a smaller path min Pathlength is readjusted. 
%

interPath(S,F,Visit,[S,F],PLength):-move(S,F),PLength1 is PLength + 1,nb_getval(minPath,M),PLength1=<M,nb_setval(minPath,PLength1).
interPath(S,F,Visit,[S|Ss],PLength):-move(S,Z),Z\=F,not(member(Z,Visit)),PLength1 is PLength + 1,nb_getval(minPath,M),PLength1=<M,interPath(Z,F,[S|Visit],Ss,PLength1).

%! compares path to minPathLength
comparePathLength(PathList,Pathlength,OptPath):-member(A,PathList),length(A,PL1),PL1=Pathlength,OptPath=A.

%! finds the minPath for a pair of start and end, then lists the optimal paths for it.
path(S,F,Visit,Path,PLength):-start(S,SPoint),end(F,FPoint),nb_setval(minPath,1000),PLength=1,findall(Path,(Visit=[],interPath(SPoint,FPoint,Visit,Path,PLength)),Z),nb_getval(minPath,PrintPath),findall(OptPath2,comparePathLength(Z,PrintPath,OptPath2),ZOpt),format('Optimal path from ~w to ~w will be of length: ~w\n',[S,F,PrintPath]),write(ZOpt),write('\n\n').

gPath():-sPoints(SList),fPoints(FList),findall((member(S,SList),member(F,FList)),path(S,F),Z).
