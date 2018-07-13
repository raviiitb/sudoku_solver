## About
It's a simple script using backtracking algorithm to solve a Sudoku problem.

## Programing Language
Ruby version 2.5.2

## Unit testing
RSpec 3.7

## How to use
Write a Sudoku problem in ``files/input.txt``. Replace all empty spaces with 0. Then run a command from terminal
```
ruby main.rb
```

If there is a valid solution for the given problem then a soltion will be created in ``files/output.txt`` file and you will get following message on your terminal.

```
Solved Sudoku problem is saved in files/output.txt
```

If there is not a single valid solution for the given problem then you will get following message on your terminal.

```
Given Sudoku problem is invalid
```

Alternatively you can create a new input file and give file as argument.

```
ruby main.rb my_input.txt
```
## Code Explanation
There is a file ``main.rb`` which reads the input from a file. Then it creates an instance of ``Sudoku::Problem`` with array of prefilled numbers as attribute. Then it calls ``solve`` method which uses brute force to find a solution of given Sudoku problem.
There are two main classes ``Sudoku::Problem`` and ``Sudoku::NumberArray``.
#### Sudoku::Problem
It initializes a new Sudoku problem with prefilled numbers as linear ``input_arr``. It has a ``solve`` public method which returns the solution as linear array if sudoku is solvable else returns ``false``.
#### Sudoku::NumberArray
It has two public methods:

``first_free_position:`` Returns the position of first empty space in the array provided.

``valid_sudoku?:`` Checks if a partially solved sudoku problem is a valid sudoku.

There are some private methods which are used to find a row, a column or a square of a Sudoku problem.
