import Cocoa
import Foundation

// Swift Basics :
// Fundamental data types `Int` for integers , `Double` for floating values , `Bool` for Boolean Values
// Three primary collection types : `Array` , `Set` , `Dictionary`
// Advanced types includes `Tuples`



// Topics we cover Today : let/var , if/else ,for loop , optional and unwrap it safely with if/let

// Before writing code , how to build logic
// What is input ? no , string ,  boolean
// What conditions need to be checked ?
// What should happen if the condition is true ?
// What should happen if the condition is false ?


// Task1 : Is a person eligible to vote?

let age = 20

if(age >= 18){
    print("Person is eligible to vote")
}else {
    print("person is not eligible to vote")
}

// Task2 : Print Whether the number is positive or negative?

var num  = 0

if num > 0 {
    print("The num is positive")
} else if num < 0 {
    print("The num is Negative ")
} else {
    print("The num is zero.")
}

// Task3 : Check Even or Odd num :

let number = 31

if (number % 2 == 0){
    print("The \(number) is even ")
}else {
    print("The \(number) is odd ")
}

// Task4 : Largest of two numbers

let num1 = 12
let num2 = 24

if(num1 > num2){
    print ("Print num1 is Largest of two numbers")
}else {
    print("Print num2 is Largest of two numbers")
}

// Task5 : Largest of three numbers

let a = 12
let b = 24
let c = 36

if (a >= b && a >= c){
    print("a is the largest number")
}else if (b >= a && b >= c ){
    print("b is the largest number")
}else{
    print("c is the largest number")
}

// Task6 : Pass or Fail

let student = 60

if(student >= 33){
    print("Passed")
}else {
    print("Failed")
}

// Task7 : Grade Calculator (A = 90+ , B = 80+ , C = 70+ , D = 60+ , F = below 60 )

let student1 = 96

if(student1 >= 90){
    print("Grade : A ")
}else if (student1 >= 80 && student1 < 90){
    print("Grade : B ")
}else if (student1 >= 70 && student1 < 80){
    print("Grade : C ")
}else if(student1 >= 60 && student1 < 70){
    print("Grade : D ")
}else {
    print("Grade : F ")
}

// Task8 : Leap Year

let year = 2010

if(year % 400 == 0){
    print("Leap year ")
}else if(year % 4 == 0 && year % 100 != 0 ) {
    print("Leap Year")
}else {
    print("Not a Leap Year")
}


// Task9 : Age Category (0-12 :Child , 13-19 : teen , 20-59 : Adult , 59+ : Senior

let guy = 67

if(guy >= 0 && guy <= 12){
    print("Child ")
}else if (guy >= 13 && guy <= 19){
    print("Teen")
}else if (guy <= 59 && guy >= 20){
    print("Adult")
}else{
    print("Senior")
}

// Task10 : Divisible by 5 and 11

let Numerator = 55

if (Numerator % 5 == 0 && Numerator % 11 == 0){
    print("Divisible")
}else {
    print("Not Divisible")
}

// Task11 : Login Check

let User = "Loggedin"

if(User == "Loggedin"){
    print("Logged in")
}else {
    print("Sign UP")
}

// Task12 : Temperature ( <0 : Freezing , 0-20 : cold , 21-30 : Pleasant , 31+ : Hot)

let temp = -13

if(temp < 0 ){
    print("temp is freezing")
}
else if(temp >= 0 && temp <= 20){
    print("Temp is Cold")
}else if (temp >= 21 && temp <= 30){
    print("Temp is Pleasant")
}else{
    print("Temp is Hot")
}

// Task13 : Number Range (Check whether the number is between 10 and 50)

let range = 26

if(range >= 10 && range <= 50 ){
    print("Number is in Range")
}else {
    print("Number is not in the Range")
}

// Task14 : Character Type

let char : Character = "a"

if(char.isLetter){
    print("Alphabateical")
}else if (char.isNumber){
    print("Number")
}else {
    print("SpecialCharacter")
}

// Task15 : Discount (Purchase : >5000 -> 20% , >2000 -> 10% , Otherwise No discount)

let Purchase = 2000

if (Purchase >= 5000 ){
    print("20% Discount")
}else if (Purchase >= 2000){
    print("10% Discount")
}else {
    print("No Discount")
}

// Task16 : Simple Calculator

let A : Double = 19
let B : Double = 20
let Operator = ""

if(Operator == "+"){
    print(A+B)
}else if (Operator == "-"){
    print(A-B)
}else if (Operator == "*"){
    print(A*B)
}else if (Operator == "/"){
    print(A/B)
}else {
    print("Invalid Operator")
}


// Logic for for loops
// What is the starting value?
// What is the ending value?
// What should happen during each iteration?

// Task1 : Print Numbers from 1 to 10


for number in 1...10 {
    print(number)
}

// Task2 : Print numbers from 10 to 1

for number in stride(from: 10, through: 1, by: -1){
    print(number)
}

// Task3 : Print Even numbers from 1 to 20

for number in 1...20{
    if (number % 2 == 0){
        print(number)
    }
    
}

// Task4 : Print Odd numbers from 1 to 20

for number in 1...20{
    if(number % 2 != 0){
        print(number)
    }
}

// Task5 : Table of 7


for number in 1...10{
    print("7 X \(number) = \(7 * number)")
}

// Task6 : Sum of numbers from 1 to 100

var sum = 0

for number in 1...100{
    sum += number
}
print(sum)

// Task7 : Find the Average of numbers from 1 to 100

var sum1 = 0

for number in 1...100{
    sum1 += number
}
print(sum1/10)

// Task8 : Count Even Numbers from 1 to 100

var count = 0

for number in 1...100{
    if(number % 2 == 0){
        count += 1
    }
}

print(count)

// Task9 : Count Odd Numbers from 1 to 100

var count1 = 0

for number in 1...100{
    if(number % 2 != 0){
        count1 += 1
    }
}
print(count1)

// Task10 : Sum of Even Numbers from 1 to 100

var sum_of_Even = 0

for number in 1...100{
    if(number % 2 == 0){
        sum_of_Even += number
    }
}

print(sum_of_Even)

// Task11 : print five stars
// *****
// We added space in between the "" in termintor func

for number in 1...5{
    print("*", terminator: " ")
}

// Task12 : Print Pattern

//*
//**
//***
//****
//*****

for row in 1...5{
    for _ in 1...row{
        print("*" ,terminator: "")
    }
    print()
}

// Task13 : Print Pattern

//1
//12
//123
//1234
//12345

for row in 1...5{
    for number in 1...row{
        print(number , terminator: "")
    }
    print()
}

// Task14 : Print Pattern

//54321
//5432
//543
//54
//5


for row in stride(from: 5, through: 1, by: -1){
    for number in stride(from: 5, through: row, by: -1){
        print(number , terminator: "")
    }
    print()
}


// Optionals : An optional is a variable that may contain a value or may contain nil

// Example : `var name: String? = "Alice"`
// Here name variable might have string or might be empty

// Example : `var age: Int? = 25  var city: String? = nil`
// Here age and city can be Int or String or nil

// So What we do is safely unwraps , incase the value might be a nil

var name: String? = nil

if let actualName = name {
    print(actualName) // Nothing is printed because name is nil
}

// Another Example :

var email: String? = nil

if let email = email {
    print(email)
} else {
    print("No email found")
}


// Variable Naming Convention in swift : lowercamelcase for vaiables and constants such as a , b , operatorSymbol
// Uppercase First is Reserved for the types such as String , Int , your own struct/class names

// Linting errors : Linter tool helps to maintain a real code base to follow some coding style and patterns to avoid confusion , potential bugs
// Linting error such as Naming convention , Consistent indentation , Unsed imports , Unused variables , Trailing whitespace , Missing Documentation Comments where required


