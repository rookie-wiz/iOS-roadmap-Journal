//
//  main.swift
//  Day5_Basics
//
//  Created by shubh on 11/08/26.
//
// Topics : Basic function, parameters, return type: , Argument labels vs parameter names — the label is what the caller writes, the parameter name is what you use inside the function. _ means no label required ,
// Default parameter values:
// Variadic parameters (zero or more values of the same type):
// inout parameters — lets a function modify the caller's variable directly, not just return a new value. Requires & at the call site.
// Multiple return values via tuples:
// Function types as variables / passing functions as parameters — a preview of what closures build on:
// refrence : "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/"


import Foundation


/*
 Functions are self-contained just chunk of code that performs a specific task . You give function a name that identifies what it does , and its name is used to call the function to perform the task when needed
 
 Every function in swift have type, consisting of functions parameter types and return type
 
 When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when it’s done, known as its return type.
 
 parameters are placeholders defined in a function's declaration, while arguments are the actual values passed into those placeholders when the function is called
 */


/*
 
 - Types of Functions :
 
 1. Simple functions with no parameters and return value
 eg :   func showWelcomeMessage() {
            print("Welcome to the app!")
        }
        showWelcomeMessage()
 
 2. Function with parameters
 eg :   func greetUser(name: String) {
            print("Hello, \(name)!")
        }
        greetUser(name: "Shubh")
 
 3. Function with Multiple Parameters
 eg :   func createUser(name: String, age: Int) {
            print("User: \(name), Age: \(age)")
        }
        createUser(name: "Shubh", age: 23)
 
 4. Function with Return value
eg :    func add(a: Int, b: Int) -> Int {
            return a + b
        }
        let result = add(a: 10, b: 20)
        print(result)
 
 5. Function returns nothing , means returns void are called void function , we can also explicitly type to return void
 
 6. Function that returns Multiple values
 eg:    func calculate(a: Int, b: Int) -> (sum: Int, difference: Int) {
            return (a + b, a - b)
        }

        let result = calculate(a: 20, b: 10)

        print(result.sum)
        print(result.difference)
 
 
 */

// The function in the example below is called greet(person:), because that’s what it does — it takes a person’s name as input and returns a greeting for that person. To accomplish this, you define one input parameter — a String value called person — and a return type of String, which will contain a greeting for that person:
// This is a global function which expects to return a string
func greetPerson(person : String) -> String {
    let greetings = "Hello \(person)"
    return greetings
}

print(greetPerson(person: "Shrey"))

// Multiple parameters

func paymentSlip(price : Double , NameOfProduct : String , quantity : Int ){
    let price = price * Double(quantity)
    let payment = "\(NameOfProduct) \(price)"
    print(payment)
}

paymentSlip(price: 250.00, NameOfProduct: "Mac&Chesse", quantity: 4)


// Functions that return value : Sometimes we don't want the function to print something. We want it to calculate something and give the result back.
// In this function num1 and num2 acts as both paramters and argumentlabels simultaneously bcz inside the body it acts as argument variable , in line : 102 it acts as argumentslabels
// Look another example with explicit argumentlabels

func calculateSum(num1 : Int , num2 : Int) -> Int {
    let sum = num1 + num2
    return sum
}

print(calculateSum(num1: 10, num2: 20))

// Function Argument labels and Parameter names

func calculateDiff (of num1 : Int , and num2 : Int)-> Int {
    let Diff = num1 - num2
    return Diff
}

print(calculateDiff(of: 20, and: 10))  // of and and act as argumentlabel

// Omitting Argument Labels :

//If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.


func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)

// Optional Return Value : A function can return an optional when the result might not exist.

func findUser (_ id : Int ) -> String? {
    
    if id == 1 {
        return "Shubh"
    }
    
    return nil
}

if let user = findUser(1) {
    print(user)
}

// Real word Example : Searching for Product

func findProduct(_ id : Int) -> String? {
    if id == 1 {
        return "iPhone"
    }
    
    return nil
}

// Why ? , we get
// User may not exist
// Product may not exist
// Message may not exist
// Database record may not exist


// Throwing Functions :
// Sometimes a function can fail so swift provides `throws` for this

enum LoginError : Error {
    case invalidPassword
}

func login(_ password : String ) throws -> String {
    if password != "1234"{
        throw LoginError.invalidPassword
    }
    
    return "Login Successful"
    
}

// Note : To remember inout Functions Normally, Swift passes values into functions without allowing the function to directly modify the original variable.
// With inout, the function can modify the caller's variable.

// Higher order functions : We can take function as parameter and also returns another function


// Task1 : Write a function `isEven(_ number: Int) -> Bool` — no print inside, just return the Bool. Call it from `if` and from inside a loop.

func isEven (_ number : Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

print(isEven(21))

// Task2 : Write `greet(name: String, greeting: String = "Hello")` using default parameters — call it both with and without the second argument.
// Default parameters

func greet(name : String , greeting : String = "Hello")-> String {
    return "\(greeting) \(name)!"
}

print(greet(name: "Shubh"))
print(greet(name: "Shubh" , greeting: "Good Morning") )

// Task3 : Write a variadic function `average(_ numbers: Double...) -> Double` that returns the average. Call it with 2 numbers, then 5 numbers.
// Variadic function :  a function that can accept zero or more values of the same type as a parameter
// key syntax : `...`
// For eg :
/*
 function addNumbers (numbers : Int...) {
 print(numbers)
 }
 
 - addNumbers(10 , 20 , 30 , 40 , 50 )
 - Inside the function the numbers behave like an array
 - we can also loop through it , use .count method etc
 */
func printNames(names: String...) {
    
    for name in names {
        print(name)
    }
}

printNames(names: "Shubh", "Rahul", "Amit")

func average(_ numbers : Double...) -> Double {
    let total = numbers.reduce(0, +)
    let averageValue = total / Double(numbers.count)
    return averageValue
}

print(average(10 , 20))
print(average(10 , 20 , 30 , 40 , 50))

// inout Functions
/*
 normally we cannot modify the value we pass to the function , but with inout we can modify
 */
// For eg :

func changeNumber(_ number: inout Int) {
    number = 50
}

var x = 10

changeNumber(&x)

print(x)

func swapValues(_ a: inout Int, _ b: inout Int) {
    a = a + b
    b = a - b
    a = a - b
}

var a = 10
var b = 20

print("Before:")
print("a =", a)
print("b =", b)

swapValues(&a, &b)

print("After:")
print("a =", a)
print("b =", b)

// Write a function returning a tuple `stats(for numbers: [Int]) -> (min: Int, max: Int, sum: Int, average: Double)` — one function, four pieces of info returned together. Use it on `[75, 82, 90, 65, 88]` (reuse your Day 3 marks logic, but now as a reusable function instead of inline code).

func stats(for numbers: [Int]) -> (
    min: Int,
    max: Int,
    sum: Int,
    average: Double
) {
    
    var minimum = numbers[0]
    var maximum = numbers[0]
    var total = 0
    
    for number in numbers {
        
        if number < minimum {
            minimum = number
        }
        
        if number > maximum {
            maximum = number
        }
        
        total += number
    }
    
    let average = Double(total) / Double(numbers.count)
    
    return (
        min: minimum,
        max: maximum,
        sum: total,
        average: average
    )
}

let result = stats(for: [75, 82, 90, 65, 88])

print("Minimum:", result.min)
print("Maximum:", result.max)
print("Sum:", result.sum)
print("Average:", result.average)

//**Refactor exercise (important — do this one properly):** go back to your Day 1 conditional tasks (positive/negative, even/odd, grade calculator, leap year) and **turn at least 3 of them into standalone functions** that take input as a parameter and `return` a result instead of just `print`-ing inline. This is the actual shift from "script" to "reusable code" — the core mental model for everything after this (SwiftUI views, ViewModels, everything is functions taking input and producing output).


func eligibleVoter (_ age : Int ) -> Bool {
    if age >= 18 {
        return true
    }else {
        return false
    }
}

print(eligibleVoter(21))

func checkIfPositiveOrNegative (_ number : Int) -> String {
    if number > 0 {
        return "Positive number!"
    }else if number < 0 {
        return "Negative number!"
    }else {
        return "Number is zero "
    }
}

print(checkIfPositiveOrNegative(2))

func checkLeapyear (_ year : Int) -> Bool {
    if year % 400 == 0 {
        return true
    }else if year % 4 == 0 && year % 100 != 0 {
        return true
    }else {
       return false
    }
}

print(checkLeapyear(2020))

func isLoggedIn (_ login : String) -> Bool {
    if login == "isLoggedIn" {
        return true
    }else {
        return false
    }
}

print(isLoggedIn("is not logged"))

// when the function is called and it only returns the print statement it goes to console , but in production we provide some argument to function , it performs some tasks and it returns some value which is again used for diff purpose such as used as argument in diff function , saved that value etc
