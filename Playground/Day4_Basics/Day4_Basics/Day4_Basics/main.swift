//
//  main.swift
//  Day4_Basics
//
//  Created by shubh on 10/08/26.
//
// Day4_Basics : Topics - while, repeat-while , break/continue , labeled statements
//
// reference : https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"

import Foundation

// While loops :

/*
 A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins. Swift provides two kinds of while loops:

 - while evaluates its condition at the start of each pass through the loop.

 - repeat-while evaluates its condition at the end of each pass through the loop.
 */

// While loops : A while loop checks the condition before executing the loop body.
// A while loop starts by evaluating a single condition. If the condition is true, a set of statements is repeated until the condition becomes false.
// Syntax : while condition {
// statements
// }

// Task1 : print number from 1 to 5

var number = 1

while number <= 5 {
    print(number)
    number += 1         
}

/*
 - Game of "Snakes and ladders" OR "Chutes and Ladders".
 
 -The rules of the game are as follows:
 -The board has 25 squares, and the aim is to land on or beyond square 25.
 -The player’s starting square is “square zero”, which is just off the bottom-left corner of the board.
 -Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by the dotted arrow above.
 -If your turn ends at the bottom of a ladder, you move up that ladder.
 -If your turn ends at the head of a snake, you move down that snake.
 
 */

let finalSquare = 25 // size based on finalSquare
var board = [Int](repeating: 0, count: finalSquare + 1) // Bcz players start from "square zero"

/*
 Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snake head have a negative number to move you back down the board.
 */

board[03] = +08 ; board[06] = +11 ; board[09] = +09 ; board[10] = +02
board[14] = -10 ; board[19] = -11 ; board[22] = -02 ; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare{
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    // move the rolled amount
    square += diceRoll
    
    if square < board.count {
        // if we are still on the booard , move up or down for a snake or a ladder
        square += board[square]
        
        
    }
}

print("Game Over!")

// Task2 : Print even numbers from 2 to 10

var evenNumber = 2

while evenNumber <= 10 {
    print(evenNumber)
    evenNumber += 2
}

// Task3 : Countdown from 5 to 1

var countDown = 5

while countDown >= 1 {
    print(countDown)
    countDown -= 1
}

// Task4 : What happens if the condition is initially false ?

var falseNumber = 10

while falseNumber < 5 {
    print(falseNumber)
    falseNumber += 1
}
// Output nothing
// Now try the same in repeat-while

/*
 - repeat-while : It executes the code first and then check the conditions
 - Syntax : repeat {
    // code to execute
 } while condition x
 */

// Task5 : Print number from 1 to 5

var countUp = 1

repeat{
    print(countUp)
    countUp += 1
}while countUp <= 5
        
// Task6 : Task4 in repeat-while and check the outcome

var trueNumber = 10

repeat {
    print(trueNumber)
    trueNumber += 1
}while trueNumber < 5
        
// Output - 10

// Task7 : Print numbers from 5 - 1 using repeat-while

var countDown2 = 5

repeat {
    print(countDown2)
    countDown2 -= 1
}while countDown2 >= 1

// Task8 : print Multiplication table of 5

var fiveTable = 1

repeat {
    print("\(fiveTable) x 5 = \(fiveTable * 5)")
    fiveTable += 1
}while fiveTable <= 10

// Task : Write a while loop that prints numbers 1 to 10

var whileloopNumber = 1

while whileloopNumber <= 10 {
    print(whileloopNumber)
    whileloopNumber += 1
}

/*
 - Control Transfer Statements :
 Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:
-  continue
-  break
- fallthrough
- return :  will be described in functions
- throw : will be described in propagating errors using throwing functions
 
 */

// Continue : The continue statement is used inside a loop when you want to skip the current iteration and move directly to the next iteration.
// simpler terms : continue = "Skip this one and go to the next one."
// It can be used with for-in , while , repeat-while

// Example :

for number in 1...5 {
    if number == 3 {
        continue
    }
    print(number)
}

// Output : 1 2 4 5

// Task1 : Print only odd numbers , Print numbers from 1 to 10, but skip even numbers using continue.

for number in 1...10 {
    if number % 2 == 0 {
        continue
    }
    print(number)
}

// Task : RealLife Example , in shoppingCart Imagine you have several products, but you want to calculate the price only for products that are in stock. If a product is out of stock, you don't want to process it—you simply skip it and move to the next product.

let products = [
    ("Laptop", 50000, true),
    ("Mouse", 1000, false),
    ("Keyboard", 2000, true),
    ("Monitor", 15000, false),
    ("Headphones", 3000, true)
]

var total = 0

for product in products {
    
    if product.2 == false {
        continue
    }
    
    total += product.1
    print("\(product.0) added to bill")
}

print("Total = ", total)

// Break Statement : The break statement is used to immediately stop a loop.
// Simpler terms : break = "Stop the loop completely."

// Example :

for number in 1...10 {
    if number == 5 {
        break
    }
    print(number)
}

// Output : 1 2 3 4

// Real Life Example : Searching for a Product

let newProducts = [
    "Laptop",
    "Mouse",
    "Keyboard",
    "Monitor",
    "Headphones"
]

for product in newProducts {
    
    print("Checking \(product)")
    if product == "Monitor" {
        print("Monitor Found!")
        break
    }
    
}

// Task : Loop 1 to 20, using continue to skip multiples of 3, and break entirely once you hit 15. Predict the output on paper/comment before running it, then verify.

for no in 1...20 {
   
    if no == 15 {
        break
    }
    
    if no % 3 == 0 {
        continue
    }
    
    print(no)
}

// A label in Swift gives a name to a loop or conditional statement.

// Labels become especially useful when you have nested loops and want break or continue to affect a specific outer loop rather than just the innermost loop.

searchRows: for row in 1...3 {
    
    for seat in 1...5 {
        
        if row == 2 && seat == 3 {
            break searchRows
        }
        
        print("Row \(row), Seat \(seat)")
    }
}


// Task : Nested loop + labeled break, classic use case — search a 2D grid (array of arrays) for a target number, and use a labeled break to exit both loops the instant it's found, instead of a boolean "found" flag:
// Print "Found target at row X, col Y" and stop searching immediately — no wasted iterations after the match.
   let grid = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
   ]
   let target = 5

searchRows : for row in grid.indices{
    
    for cols in grid[row].indices{
        
        if grid[row][cols] == target {
            print("Found target at row \(row), col \(cols)")
            break searchRows
        }
    }
}


// basically for loops is used when we are aware about the number of iterations such as in array or 1...10
// In while loop and repeat-while we dont know the number of iterations , we just iterate till we get valid input or depends on condition
// repeat-while loop execute atleast once
