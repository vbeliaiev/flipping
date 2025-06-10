# <img src="./img/logo_small.png?sanitize=true" width="24" height="24" alt="Flipping Matrix Game"> Flipping Matrix Game

Let's dive deeper into the rules of the Flipping Matrix Challenge. This game tests your strategic thinking as you manipulate a grid of numbers to achieve the highest possible score.

### The Game Setup
First, you'll be prompted to enter the size of the matrix. You need to specify a single integer, N. The game will then create a square matrix of size 2N x 2N.

**Important Constraints for N:**

- N must be an even number.
- The minimum allowed value for N is 2 (resulting in a 4×4 matrix).
- The maximum allowed value for N is 50 (resulting in a 100×100 matrix).
- Once N is set, each cell of the 2N x 2N matrix will contain an integer (a whole number).

### Your Objective
Your ultimate goal is to **maximize the sum of the integers** located in the **upper-left N x N** submatrix. This "target area" is the top-left quadrant of the larger 2N x 2N grid. All other parts of the matrix outside this top-left quadrant don't directly contribute to your score.

### How to Play: The "Flipping" Mechanic
To achieve your objective, you have one powerful operation at your disposal:

- You can reverse **any row** (horizontally) or **any column** (vertically) in the entire 2N x 2N matrix.

This means you can take any row and flip its elements from left to right, or take any column and flip its elements from top to bottom. For instance, if a row is `[1, 2, 3, 4]`, reversing it would make it `[4, 3, 2, 1]`.

Crucially, you can perform these **reversal operations as many times as you wish** on any row or column. There are no limits to how many times you can flip, giving you complete freedom to arrange the numbers.

### The Strategy
The core of the game lies in strategically deciding which rows and columns to reverse to bring the largest possible numbers into that top-left N x N quadrant. Since you can only reverse rows and columns, you'll need to figure out how to position those high-value numbers from the "outer" parts of the matrix into your target quadrant.

Good luck maximizing your score in the Flipping Matrix Challenge!

## Commands:

Here are the commands you can use during gameplay:

- `rr <number>` - **Reverse Row**: Flips the specified row horizontally. Replace `<number>` with the index of the row you want to reverse (e.g., `rr 0` for the first row).
- `rc <number>` - **Reverse Column:** Flips the specified column vertically. Replace `<number>` with the index of the column you want to reverse (e.g., `rc 1` for the second column).
- `q!` - **Quit Game:** Exits the game immediately. You can also use `Ctrl + C` to quit.
- `h` - **Help:** Displays a list of commands or shows the game rules again.

## Installation and Setup

1. Make sure you have installed ruby

2. Clone the repository:

```
git clone git@github.com:vbeliaiev/flipping.git
cd flipping
```

3. Run the game:

```
ruby main.rb
```

4. Enjoy! :) 


## License & Purpose
This project is released under the MIT License. It was primarily developed for educational purposes, serving as a learning exercise in programming and algorithm design. Feel free to explore, modify, and contribute!