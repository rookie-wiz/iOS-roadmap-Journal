import Cocoa

// Reference Link : "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/"
// Read Doc Section for atleast 15 mnts

// Fundamental DataTypes Concepts : Int , Double , Boolean , String , Character

// String Literals Example : let someString = "some string literal value"

// MultiLine String Literals Example :

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

// When source code includes the Line Break inside the multi line string literals , that Linebreak also appears in the strings value , but if we donot want line break in strings value we just have to add backslasf (\) at the end of the line

// Example :

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""


// Example of Escaped Special Characters : tip : we can do this in Multiline string literals

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

// Initializing Empty Strings :
// 2 ways : emptyString Literal to a variable , initialize new string instance with  initializer syntax

var emptyString  = ""       // Empty String Literal

var anotherEmptyString = String()        // initializer syntax

// Both are empty strings and equivalent

// Lets find out whether the String is empty using isEmpty property

if (emptyString.isEmpty){
    print("This String is Empty")
}else {
    print("This String is not Empty")
}

// String Mutability : we decide whether the strings can be modified(mutate) in cases

var variableString = "Horse"
variableString += " and Carriage"
// variableStrings is now "Horse and Carriage"

 let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified


// Concept : Value type vs Reference Type
// Examples of Value Type : struct , enum , String , Array , Dictionary  , Set
    // Copy on write concept for performance
// Examples of Reference Type : class , actor

// Value Type: Assignment or passing to a function creates a new copy, so changes don't affect the original.

// Reference Type: Assignment or passing to a function shares the same object, so changes are visible through all references.

// Value Type Example :

struct Person {
    var name : String
}

var p1 = Person(name: "Shubh")
var p2 = p1

p2.name = "Alice"

print(p1.name)  // "Shubh"
print(p2.name)  // "Alice"

// Means p2 is not referencing (memory address) to p1 it creates a new copy so it doesnt affect the original (p1)

// Reference Type Example :

class Employee {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

var Emp1 = Employee(name: "John")
var Emp2 = Emp1

Emp2.name = "Rock"

print(Emp1.name) // "Rock" but original was "John"
print(Emp2.name) // "Rock"

// Means Emp2 is referencing (memory address) to Emp1 it doesnot create a seperate copty so it does affect the original (Emp1)

// Concatenation in Strings : using + operator

let string1 = "Hello"
let string2 = ", World!"
var welcome = string1 + string2
print(welcome)

// String Interpolation : String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal.
// Example :

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)


// String Delimteters :
print(#"Write an interpolated string in Swift using \(multiplier)."#)


// Counting Characters in a String using .count method
// Till now we have seen methods like concatenation , interpolation , isEmpty , count

let name = "Shubh"
print("Total No of Characters in name is \(name.count) ")

// Accessing and Modifying a String : using methods and properties or by using subscript syntax
// 1. String Indices : Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.
// 2. Removing and Inserting

let greeting = "Guten Tag"

for index in greeting.indices{
    print("\(greeting[index])" , terminator: "" )
    print()
}

var Wel = "hello"
Wel.insert("!", at: Wel.endIndex)
print(Wel)

Wel.insert(contentsOf: " there", at: Wel.index(before: Wel.endIndex))

Wel.remove(at: Wel.index(before: Wel.endIndex))

print(Wel)


// Task1 : Declare one variable of each type: Int, Double, Bool, String. Print each with type(of:) to see Swift confirm the type — e.g. print(type(of: age)).

let intNo = 12
let doubleNo = 12.47
let boolCase = true
let stringLiteral = "Blah-bleh-Blah"
print(type(of: intNo))
print(type(of: doubleNo))
print(type(of: boolCase))
print(type(of: stringLiteral))


// Task2 : Write a Program that takes a firstname and Last name (as constants) and prints a full greeting using interpolation not concatenation

let firstName = "Shubh"
let lastName = "Chauhan"

print("Greetings from \(firstName) \(lastName)!")

// Task3 : Give a string , print : Its character count , uppercaseversion , lowercaseversion , whether it contains a specific substring  , and whether it starts with specific substring

let newString = "Bleach"

print(newString.count)
print(newString.uppercased())
print(newString.lowercased())

if newString.contains("Bleach") {
    print("Yes it does ")
}

if newString.hasPrefix("Blea"){
    print("Yes it does")
}


// Task4 : Bug-Hunt Exercise : Write a small Program converting a string("42") into an Int - researchInt("42") youself and notice what type it returns .Print and Explain in comment

let str = "42"

if let num = Int(str){
    print(num)
    print(type(of: num))
}else {
    print("Invalid conversion")
}
