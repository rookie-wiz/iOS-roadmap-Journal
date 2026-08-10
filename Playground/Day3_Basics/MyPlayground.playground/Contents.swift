import Cocoa

// Copy-on-write (Concept) Optimization for Collection types (value types) like Arrays , Dictionaries , Set , String
// The goal is to give you the behavior of a value type (independent copies) without immediately copying all the data, which improves performance.
// simply means for the million element array its expesnive to create a copy so it wont make another copy until its modified .

// Topics : Arrays , Dictionary , Set , Enums
// Reference Links :
// Arrays: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/#Arrays"
// Dictionay section in same Page
// Sets : "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/#Sets"
// Enumerations : "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/"

// Lets start with Arrays :
/*
 
  - one of collection types
  - use to store value of same type
  - in ordered list
  - Note : Same value can be present at different positions in Array (Multiple times)
 
  - Synatx : Array<Element>
  - where <Element> is the types of values array is allowed to store
  - We can also write , [Element]
 */

// Creating an Empty Array :
/*
 - 2 approaches :
 1. Using Array literal : Most common
 2. Using Array Initializer
 */

// Empty Arrays , using Array Literals

let emptyArrInt : [Int] = []  // <Element> is Int
let emptyArrStr : [String] = []  // <Element> is String
let emptyArrDouble : [Double] = []  // <Element> is Int
let emptyArrBool : [Bool] = []  // <Element> is Bool

// Empty Arrays , using Array Initializer

let emptyArrInt1  = [Int]()  // <Element> is Int
let emptyArrStr1 = [String]()  // <Element> is String
let emptyArrDouble1 = [Double]()  // <Element> is Int
let emptyArrBool1 = [Bool]() // <Element> is Bool

// Creating an Array with Default Value
/*
 - Swift Array type also provides an Initializer for creating an array of certail size with all of its values set to the same default value. You pass the initializer a default value of the appropriate type (called repeating ): and the times that view
 
 - Synatx : Array(repeating : defaultValue , count : numberOfElememts)
 - where repeating : The value to store in each elements
 - where count : Total number of elements in an array ( not the last index )
 */

// Examples of Array with DefaultValue Int

let zeroes = Array(repeating: 0, count: 5)
print(zeroes)

// Examples of Array with DefaultValue  Strings

var unknown = Array(repeating: "unkown", count: 12)
print(unknown)

// We can modify those Array if declares as var

unknown[9] = "Shubh"
print(unknown)

// Task1 : Create an Array with 10 Zeroes and print it

let task1 = Array(repeating: 0, count: 10)
print(task1)

// Task2 : Create an array of 6 elements, all initialized to -1. Then replace index 1 with 20 , index 4 with 50

var task2 = Array(repeating: -1, count: 6)
print(task2)

task2[1] = 20
task2[4] = 50

print(task2)

// Task3 : Create an array of 4 "Empty" strings. Use a for loop to print each element.
// terminator() = ""  -> for space after printing
// print() after will print in new line

let task3 = Array(repeating: "Empty", count: 4)

for i in task3{
    print(i , terminator: " ")
    print()
}


// Creating an Array by adding two Arrays together

var arr1 = Array<Int>()

arr1 = [1 , 3 , 5 , 7 ]

var arr2 = Array<Int>()

arr2 = [2 , 4 , 6 , 8]

var arr3 = arr1 + arr2

print(type(of: arr3))
print(arr3) // Its not sorted

// Creating an Array with Array Literal

var shoppingList: [String] = ["Eggs", "Milk"]

// Accessing and Modifying Arrays :
/*
 - You can access and modify an array through methods , properties and by using subscript Syntax
 */

// To find out the number of items in an array, check its read-only count property:

print("The number of Items in Shoppinglist are \(shoppingList.count)")

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
// double == for checking , single = for assignment

if shoppingList.count == 0 {
    print("The Shoppinglist is Empty ")
}else {
    print("The Shoppinglist is not Empty")
}

// Append method : You can add a new item to the end of an array by calling the array’s append(_:) method:

var arrAppend : [Int] = [1 , 2 , 3 , 4 , 5]

arrAppend.append(6)

print(arrAppend)

// Alternatively, append an array of one or more compatible items with the addition assignment operator (+=):

shoppingList += ["Bread" , "Nutella" , "Peanut Butter"]

print(shoppingList)

// Retrieve a value from the array by using subscript syntax, passing the index of the value you want to retrieve within square brackets immediately after the name of the array:

print(shoppingList[3])

// You can use subscript syntax to change an existing value at a given index:

shoppingList[0] = "Six Eggs"

print(shoppingList)

// When you use subscript syntax, the index you specify needs to be valid. For example, writing shoppingList[shoppingList.count] = "Salt" to try to append an item to the end of the array results in a runtime error.

// To insert an item into the array at a specified index, call the array’s insert(_:at:) method:

shoppingList.insert("Whey-Isolate", at: 4)

print(shoppingList)

// you remove an item from the array with the remove(at:) method. This method removes the item at the specified index

shoppingList.remove(at: 4)

print(shoppingList) // "Whey-Isolate" is removed

// Use case of removeLast() method bcz we do not have to mention the index , it removes the last element while using remove(at: ) we need to mention the index

shoppingList.removeLast()

print(shoppingList) // "PeanutButter" is removed

// Task1 : Create the following array: ["Apple", "Banana", "Orange", "Mango"] , then print First fruits and Last fruit

var fruits = ["Apple", "Banana", "Orange", "Mango"]

print(fruits.first) // Warning : from String? to any , we can use ! for forced unwrapping

print(fruits.last)

/*
 - Why first and last properties an Optional?
 - The properties first and last return a String? (Optional<String>), not a String.
 - Because an array might be empty so swift wont know what to return for an empty array
 - so we have 2 safety approaches : 1. optional Binding  2. Force Unwrapping (only when you are sure)
 */

// Lets Understand Optional Binding :

/*
 - In swift , Optional Binding is a safeway to extract the value from an optional. Instead of force unwrapping (!) , you check whether the optional contains a value and use it only if it exists
 - optional Binding is commonly done by using if let , guard let or if var
 
 - Why do we need Optional Binding ?
 - Bcz an optional (?) can either contain : A value ,  nil
 - Example :
        var username: String? = "Alice"
 - Here username is not a  String ,its a string optional
 */

// Using Optional Binding :

if let firstfruit = fruits.first{
    print(firstfruit)
}else {
    print("fruits are empty")
}

// Using forced Unwrapping (Only when we are sure)

print(fruits.first!)
print(fruits.last!)

// Task2 : Print the fruit at Index 2

print(fruits[2])

// Task3 : Replace Banana with Orange
// We need to search that element and replace with another element at that index

if let i = fruits.firstIndex(of: "Banana"){
    fruits[i] = "Grapes"
}else {
    print("Banana not found!")
}

print(fruits)

// Task4 : Add "Pineapple" at the end of an array

fruits.append("Pineapple")

print(fruits)

// Task5 : Insert "Kiwi" at Index = 2

fruits.insert("Kiwi", at: 2)

print(fruits)

// Task6 : Remove the last fruit

fruits.removeLast()

print(fruits)

// Task7 : Remove the fruit at Index = 1

fruits.remove(at: 1)

print(fruits)

// Task8: Check whether the array contains "Orange"

if fruits.contains("Orange"){
    print("Yes")
}else {
    print("Orange not found")
}

// Task9 : Print the total number of fruits

print(fruits.count)

// Task10: Reverse the array and print

var reversedFruits = Array(fruits.reversed())

print(reversedFruits)

// Bonus :

var numbers = [10 , 20 , 30 , 40 , 50]

// 1. Replace 20 with 25

numbers[1] = 25

// 2. Append 60

numbers.append(60)

// 3. Remove 30

numbers.remove(at: 2)

// 4. Insert 15 at beginning

numbers.insert(15, at: 0)

// 5. Print first and Last element

if let i = numbers.first{
    print(i)
}else {
    print("Invalid")
}

if let i = numbers.last{
    print(i)
}else {
    print("Invalid")
}

// 6. Final array

print(numbers)

// Iterating over an Array using for-in Loop : here the its iteration over entire set of values

for i in shoppingList {
    print(i)
}

/*
 - If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead. For each item in the array, the enumerated() method returns a tuple composed of an integer and the item. The integers start at zero and count up by one for each item; if you enumerate over a whole array, these integers match the items’ indices. You can decompose the tuple into temporary constants or variables as part of the iteration:
 */

for (index , value) in shoppingList.enumerated(){
    print(index , value )
}

// Task1 : Create the following array and print each fruit on a new line.

for i in fruits{
    print(i)
}

// Task2 : Print every number in the array.

let num = [10, 20, 30, 40, 50]

for number in num {
    print(number) //Prints on newline , with terminator: "" It doesnot print on newline
}

// Task3 : Print Every fruits with " I Like "

for fruit in fruits {
    print("I like \(fruit)")
}

// Task4 : Print using Indices

for i in fruits.indices {
    print(fruits[i])
}

// Task5 : Print index and value
// enumaraeted() always return index, element order
for ( index, value) in fruits.enumerated() {
    print(index , value)
}

// Task6 : Calculate Sum of let numbers = [10, 20, 30, 40]

let calculateSum = [10 , 20 , 30 , 40]
var sum = 0
for addition in calculateSum{
    sum += addition
}

print(sum)

// Task7 : Find Largest Number
 
let newNo = [1 , 2 , 3 , 4 , 5]
var largestNo = 0

for number in newNo {
    if number > largestNo {
        largestNo = number
    }
}

print(largestNo)

// Task8 : Count Even Numbers let newNo = [1 , 2 , 3 , 4 , 5]

var count = 0

for no in newNo {
    if no % 2 == 0{
        count += 1
    }
}

print(count)

// Task9 : Print only Even Numbers let newNo = [1 , 2 , 3 , 4 , 5]

var evenNo = 0

for no in newNo {
    if no % 2 == 0 {
        print(no)
    }
}

// Task10 : Print the square of every numbers let newNo = [1 , 2 , 3 , 4 , 5]

for no in newNo{
    print(no * no)
}

// Task11 : Print fruits in Reversed. fruits :  Apple , kiwi  , Orange , Mango

for fruit in fruits.reversed() {
    print(fruit)
}

// Task12 : Count Fruits Having More Than 5 Letters. fruits :  Apple , kiwi  , Orange , Mango

var fruitCount = 0
for fruit in fruits {
    if fruit.count > 5{
        fruitCount += 1
    }
}

print(fruitCount)

// Task13 : Multiply all number . numbers :  15 , 10 , 50 , 40 , 50 , 60

var result = 1
for num in numbers {
    result = num * result // we can also use result *= num
}

print(result)

// Task15 : Mini Challenge

let marks = [75, 82, 90, 65, 88]

/*
 Perform using only one loop
 - Print every mark.
 - Find the total.
 - Find the highest mark.
 - Count how many marks are greater than or equal to 80.
 */
var totalMarks = 0
var highestMarks = 0
var countMark = 0
for mark in marks {
    print(mark)
    totalMarks += mark
    if mark > highestMarks {
        highestMarks = mark
    }
    if mark >= 80 {
        countMark += 1
    }
}

print(totalMarks)
print(highestMarks)
print(countMark)


// Tasks on Optional Binding :

// Task1 : User Profile name , A User may or may not have entered their name

var userName : String? = nil

if let name = userName {
    print(name)
}else {
    print ("No user Found")
}

userName = "Shubh"

if let name = userName {
    print("Hello \(name)")
}else {
    print("User not Found")
}

// Task2 : Mobile Number , A users mobile number may or may not be available

var userMobileNumber : Int? = nil

if let mobile = userMobileNumber {
    print("Dialing \(mobile)")
}else {
    print("No match Found")
}

// Dictionaries :
/*
 A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary don’t have a specified order.
 - key words :  key value pairs , all keys should be of same type , all values should be of same type , keys are identifier to extract value , keys must be unique (cant be repeated)
 - A Dictionary key must conform to hashable protocol , Like Set's value type
 - Syntax : Dictionary<key , value> where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys.
 - shorthand form as [Key: Value]
 */

/*
 - Hashable is a Swift protocol that allows a type to produce a hash value, which hash-based collections use for efficient lookup. Swift handles hashing internally.

- Dictionary keys must conform to Hashable.
-  Set elements must conform to Hashable.
-  Dictionary keys must be unique.
-  Set elements must be unique.
-  Hashable itself does not mean that values are unique.
-  A Hashable type must also conform to Equatable so Swift can compare values when necessary, including when hash collisions occur.
-  Dictionary values don't need to be Hashable.
-  Arrays are not generally Hashable; this is not because they allow duplicates or use indexing.
-  Array → ordered, index-based, duplicates allowed.
-  Set → unordered, hash-based lookup, unique elements.
-  Dictionary → key-value pairs, hash-based lookup using keys.
 */

// Example :

var student: [String: Int] = [
    "Math": 85,
    "Science": 90,
    "English": 78
]

// Creating an Empty Dictionary

var dict1 : [Int : String] = [:]

dict1[16] = "Sixteen"  // Here 16 is key in Int , "Sixteen" is String as value

print(dict1)

dict1 = [:] // Now its empty

print(dict1)

// Creating a Dictionary with Dictionary Literal

var airports : [String:String] = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin"
]

// Accessing and Modifying Dictionary :

print("The airports Dictionary contains \(airports.count) items") // It counted as key value pairs , 2 Items

if airports.isEmpty {
    print("No items Found")
}else if airports.count >= 1{
    print("More than 1 items are found")
}else {
    print("No items Found")
}

// Subscripting syntax :

airports["LHR"] = "London" // 3rd item added

airports["LHR"] = "London Heathrow" // 3rd item value changed

// Alternative to subscripting use UpdateValue(_: forKey:) method
// Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.

if let oldairport = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print(oldairport)
}else {
    print("Invalid")
}

print(airports)

// Tasks on Accessing and Modifying Dictionary :

// Task1 : Create and Access a value

var newStudent = [
    "name": "Shubh",
    "age": "25",
    "course": "Swift"
]

if let name = newStudent["name"] {
    print(name)
}else {
    print("Value not Found")
}

// Task2 : Modify an Existing value

if let name = newStudent.updateValue("Shubh Chauhan", forKey: "name"){
    print(name) // It still prints the old value
}else {
    print("Cannot Modify Value")
}

if let newValue = newStudent["name"]{
    print(newValue)
}else {
    print("newValue Not Found")
}

// Task3 : Add a new Key : value pair

newStudent["era"] = "Genz"

print(newStudent)

// Task4 : Removing and checking
// Removes both key and value pair

if let oldAge = newStudent.removeValue(forKey: "age"){
    print(oldAge)
}else {
    print("Failed to remove value")
}

if let newAge = newStudent["age"]{
    print(newAge)
}else {
    print("age Not Found")
}

print(newStudent)

// Task5 : Check whether the key exists , in newStudent["course"]

if newStudent["course"] != nil {
    print("Exist")
}else {
    print("Not Found")
}

// Task6 : Safely accessing a Missing key , "email"

if let email = newStudent["email"]{
    print(email)
}else {
    print("No key Found")
}

// Iterating Over a Dictionary

for airport in airports.keys {
    print("Airport Code : \(airport) ")
}

for airportName in airports.values {
    print("Airport Name : \(airportName)")
}

/*
 Swift’s Dictionary type doesn’t have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property.
 */

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]
print(airportCodes)

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
print(airportNames)


// Task1 : Iterate over keys and values , print each subjects and its marks , The order may vary because dictionaries are unordered collections in terms of relying on a specific iteration order. we didnt need enumeration() method.

for (key,values) in student {
    print("Subjects \(key) : marks \(values)")
}


// Task2 : Calculate total marks
var totalMarksInStudent : Int = 0

for marks in student.values {               // Or : for (_, mark) in marks
    totalMarksInStudent += marks
}
print(totalMarksInStudent)

// Task3 : Increase every mark by 5

for subjects in Array(student.keys) {
    student[subjects]! += 5
}

// Task4 : Nested Dict

let students = [
"student1": [
    "name": "Shubh",
    "course": "Swift"
],
"student2": [
    "name": "Rahul",
    "course": "iOS"
]
]

print(students["student1"]!["name"]!)

// Sets :
/*
 - A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.
 - Key terms : Unique value (No repeats) , no order , all Elements of same type
 - Syntax : Set<Elementtype>
 */

/*
-  A type must be hashable in order to be stored in a set — that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that’s the same for all objects that compare equally, such that if a == b, the hash value of a is equal to the hash value of b.

-  All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values (as described in Enumerations) are also hashable by default.
 */

// Creating and Initializing Empty Set

var emptySet: Set<Int> = []

emptySet.insert(1)

emptySet = [] // Now its still empty

// Accessing and Modifying Sets

// Task1 : create an Print a Set

var set1 : Set<String> = ["Apple" , "Banana" , "Cantaloupe"]

print(set1) // Its unordered!

// Task2 : Add an Element , in set1

set1.insert("Orange")

print(set1)

// Task3 : Try Adding a Duplicate

set1.insert("Banana")

print(set1) // Banana will only appear once

// Task4: Check whether an Element exists

if set1.contains("Orange"){
    print("Orange Exists")
}else {
    print("Orange doesn't Exists")
}

// Task5 : Remove an Element

if set1.contains("Banana"){
    set1.remove("Banana")
}else {
    print("Banana does not exists")
}

print(set1)

// Task6 : Safely remove an element : Print "Mango removed" if it existed, otherwise print "Mango not found".
// remove() returns the removed element as an optional.

if set1.contains("Mango"){
    set1.remove("Mango")
    print("Mango removed")
}else {
    print("Mango not found")
}

// Task7 : Count ELements

print(set1.count)

// Task8 : Iterate over a set : Print every fruit using a for-in loop.

for fruit in set1 {
    print(fruit)
}

// Task9 : Remove all Elements

var set2 : Set<String> = ["Apple" , "Banana" , "Cantaloupe"]

set2.removeAll()

// Task10 : Find Common elements , Find the students who are learning both Swift and Python.
// intersection() returns elements that exist in both Sets.

let swiftStudents: Set = ["Amit", "Rahul", "Shubh", "Priya"]

let pythonStudents: Set = ["Priya", "Amit", "Karan", "Neha"]

let commonStudents = swiftStudents.intersection(pythonStudents)

print(commonStudents)

// Task11 : Combine two sets : Union Method

let unionStudents = swiftStudents.union(pythonStudents)

print(unionStudents)

// Task12 : Students only in swift , Find students who are learning Swift but not Python.
// subtracting() returns elements that exist in the first Set but not in the second.

let onlySwiftStudents = swiftStudents.subtracting(pythonStudents)

print(onlySwiftStudents)

// Task13 : Find Unique Elements , Find students who are enrolled in exactly one of the two courses.
// symmetricDifference() removes the common elements.

let uniqueStudents = swiftStudents.symmetricDifference(pythonStudents)

print(uniqueStudents)

// Task14 : Modify a set while iterating , Remove every number that is not divisible by 10
// Modifying while iterating: You cannot remove items from a Set while looping over it using for...in. This causes unexpected behavior or crashes because the loop loses track of the elements.
// The $0 syntax is a shorthand name for the first argument passed into a closure in Swift.
// $0: A shorthand name for the current item the code looks at during the loop.

var setNumbers : Set<Int> = [10, 15, 20, 25, 30, 35]

// setNumbers.removeAll(where: { $0 % 10 != 0 })   Not exist for Set , ANother method shown below

// Option A: filter + reassign (filter returns an Array, so wrap it back in Set)
setNumbers = Set(setNumbers.filter { $0 % 10 == 0 })
print(setNumbers)

print(setNumbers)

// Task 15 : Find:

// Students learning both iOS and Android.
// Students learning all three technologies.
// Students learning only iOS.

let ios : Set<String> = ["Amit", "Rahul", "Shubh", "Priya"]
let android : Set<String> = ["Rahul", "Karan", "Priya", "Neha"]
let flutter : Set<String> = ["Shubh", "Priya", "Neha", "Karan"]


// 1. iOS AND Android
let iosAndAndroid = ios.intersection(android)

print("iOS + Android:", iosAndAndroid)

// 2. All three
let allThree = ios
    .intersection(android)
    .intersection(flutter)

print("All three:", allThree)

// 3. Only iOS
let onlyIOS = ios
    .subtracting(android)
    .subtracting(flutter)

print("Only iOS:", onlyIOS)

// Enumerations or Enum in Swift :
// An enumeration, or enum, is a Swift type that lets you define a group of related values under one name.
// An enum represents a value that can be one of a predefined set of choices.
/*
 Example :
 enum OrderStatus {
     case pending
     case preparing
     case ready
     case delivered
     case cancelled
 }
 
 - gives type safety
 - OrderStatus can only represent 5 cases , only fixed choices to assign to any variable
 - you cannot assign arbitrary value
 - naming convention in enum / struct / class -> Starts first letter capital
 
 - Another Example :
 enum TrafficLight {
    case red
    case yellow
    case green
 }
 - var light = TrafficLight.red
 
 */

// One of the Most use Cases of enum comes with Switch

/*
 In Swift, switch is used when you want to compare one value against multiple possible cases. It is similar to if-else if-else, but is often cleaner when there are many possibilities.
 - Swift takes the value of day (3) and checks each case:
 */

let day = 3

switch day {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
case 4:
    print("Thursday")
case 5:
    print("Friday")
default:
    print("Weekend")
}

let fruit = "Apple"

switch fruit {
case "Apple":
    print("This is an apple")
case "Mango":
    print("This is a mango")
case "Banana":
    print("This is a banana")
default:
    print("Unknown fruit")
}


// Use case with Enums :

enum Direction {
    case north
    case south
    case east
    case west
}

var walkingDirection = Direction.east // we can also wrte var walkingDirection = .east

print(walkingDirection)

// warnings bcz every conditions are covered in cases and default will never be executed!
switch walkingDirection {
    
case .north :
        print("walking in north Direction")
case .south :
        print("walking in south Direction")
case .east :
        print("walking in east Direction")
case .west :
        print("walking in west Direction")

    // only add default when the switch statement is not exhaustive
}


// Imagine an application with different user roles:

enum UserRole {
    case admin
    case manager
    case employee
    case guest
}

let role : UserRole = .admin

switch role {
case .admin :
    print("Full access")
case .manager :
    print("Read and write access")
case .employee :
    print("Read access")
case .guest :
    print("Read only access")
}

// Enums with Raw value : simply means underlying value

enum CampusDirection : String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

let direction : CampusDirection = .east

print(direction.rawValue)

// Integer Raw Values

enum Priority: Int {
    case low = 1
    case medium = 2
    case high = 3
}

let priority : Priority = .high

print(priority.rawValue)

// Automatic Raw value :

enum PriorityCase : Int {
    case low = 1
    case medium
    case high
}



print(PriorityCase.medium.rawValue)


// Enum with Associated values :

enum NetworkResult {
    case loading
    case success(String)
    case failure(String)
}

let networkResult = NetworkResult.success("User data loaded")

switch networkResult {
    case .loading :
    print("Loading...")
    case .success(let data) :
    print("Success: \(data)")
    case .failure(let error) :
    print("Error: \(error)")
}


// Task : Create a dictionary mapping 3 student names (String) to their marks (Int). Print one student's marks safely using if let (don't force-unwrap). Add a new student. Update an existing student's marks.
// Create a dict with 3 students names and marks
var dict : [String: Int] = [
    "Shubh": 99 ,
    "Aman": 98,
    "Ridhi": 97
]

if let marks = dict["Shubh"]{
    print(marks)
}else {
    print("Marks not found")
}

// Task : Create a Set from an array that has duplicate numbers in it, print the set, and prove duplicates are gone by comparing .count before and after.

var numberArray : Array<Int> = [1 , 2, 3, 4, 5, 4 , 3 , 2 , 1]

print(numberArray)
print(numberArray.count)

var numberSet : Set<Int> = Set(numberArray)

print(numberSet)
print(numberSet.count)

// Task : Create an enum called Weekday with all 7 days. Write a switch statement that prints "Weekend!" for Saturday/Sunday and "Workday" for the rest.

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

let today = Weekday.monday

switch today {
case .monday , .tuesday, .wednesday, .thursday, .friday :
    print("Workday")
case .saturday, .sunday :
    print("Weekend!")
}

// Task : write a function-free snippet that loops through your movies array with a for loop (Day... wait, you already know loops from Day 1) and prints each movie with its index number, like "1. Inception". Look up .enumerated() yourself — don't just use a manual counter variable, find the idiomatic Swift way.

var movies : Array<String> = [
    "Supermen",
    "Man of Steel",
    "Inception",
    "San Andreas"
]

for (index , movie) in movies.enumerated(){
    print("Index : \(index) and movie is \(movie)")
}

