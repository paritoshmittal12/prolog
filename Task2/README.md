# <p align="center"> Prolog <p>

It contains the prolog code for database search. We query the database with an *assumption* that roll number is primary key. 

The file contains two lists, each containing Name and Roll numbers. In prolog a special character "|" is used to find separate list into two parts. We use it to find the Head of each list:
```
	A[Head|Tail]:- X=Head,Y=Tail. 
```
**Head** is a single element, while **Tail** is a list containing remaining part.

### Search using Name or Roll Number
Given a query we search for it in the Head and second element in the list. This thing is done for each record and hence in O(n) time we get a match. Using Roll number of matching record we extract the member record from second list. We then club the two lists and print the output into the terminal.

To compile and run the query use:
```
$ swipl -s databaseQuery.pl
```

make queries like:
```
$ ?- search(1).
$ ?- search('P M').
```
It returns the matching record from the database.

Member function is used to iterate a list till a match is found.
```
$ member(A,List).
```
Finds a member of list and continues till it fails to proceed. At this point it backtracks and finds the next member to proceed again. This recursive backtracking is how prolog works.

To stop the program or exit use: 
```
$ halt. 
```
