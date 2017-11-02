# <p align="center"> Prolog <p>

It contains two simple prolog codes to find halfsister and uncle relationships with given facts. 

### Half Sister
 
She is a sibling with only one common parent.
Hence given two names, each must have only one parent common, and if A is the half sister of B then A has to be a female.

To compile and run the query use:
```
$ swipl -s halfsister.pl
```

make queries like:
```
$ ?- halfsister(avantika,shivani).
```
It returns either **true** or **false**.

A query like:
```
$ ?- halfsister(A,shivani).
```
will return A = avantika. This process is called Unification.

### Uncle  
Uncle relationship is defined as brother of a father. Given two names A and B, it checks if A is the uncle of B. In order for this to be true:
* A must be male.
* Parent of B must not be A.
* Parent of B and A must be brothers.
* Brothers have atleast one same parent.

All this logic is coded in uncle.pl file.

To execute it:
```
$ swipl -s uncle.pl
```

make queries like:
```
$ ?- uncle(kattappa,avantika).
```
It returns either **true** or **false**.
A query like:
```
$ ?- uncle(A,avantika).
```
will return A = kattappa. 

To stop the program or exit use: 
```
$ halt. 
```
