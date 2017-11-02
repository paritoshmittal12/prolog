# <p align="center"> Prolog <p>

It contains the prolog code for finding all paths between start and finish point. The prolog implementations of single source single sink path and all source path are coded here. The project contain two tasks:
* **all path** : Given a maze it finds all path between all start and end points.
* **optimal path** : Given a maze it finds all optimal path between all start and end points.

![The Maze](https://github.com/paritoshmittal12/prolog/tree/master/Task3/Maze.png)

The below fact is used to code the maze to be used by prolog for making judgements. It indicates you can move from 1 -->  2.
```
canMove(1,2).
```

To compile and run the query use:
```
$ swipl -s allpathInMaze.pl.
$ ?- gPath().
$ swipl -s optimalPathinMaze.pl.
$ ?- gPath().
```


### All Path
Code uses backtracking of prolog to find all possible path between the sourse and destination.

It has two query:
```
?- path(s1,f3).
```
given the start **S** and finish **F** it finds all path from start to finish.

```
?- gPath().
```
It finds all path from all combinations of start and finish points.


### Optimal Path
A similar backtracking based approach but uses a global variable *minPath* to keep track of minimum path length and use pruning to make code efficient.

It has two query:
```
?- path(s1,f3).
```
given the start **S** and finish **F** it finds the optimal path, returns all such paths and the optimal path length.

```
gPath().
```
It finds all optimal paths from all combinations of start and finish points. It returns the array of paths and *minLength* for each path.


To stop the program or exit use: 
```
$ halt. 
```
