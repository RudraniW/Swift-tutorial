import Cocoa

var str = "Hello, playground"
//collection types : Arrays
var arrint = [Int]()
print("arrint is array of type [Int] with \(arrint.count) items")
arrint.append(3)//inserting at end
print("arrint is array of type Int with \(arrint.count) items")
arrint.insert(5,at: 1)//inserting at position
arrint.insert(10,at: 0)
print("arrint is array of type Int with \(arrint) items")
//Creating an Array with a Default Value
var arrwithdefault = Array(repeating: 1, count: 10)
print(arrwithdefault)
var newarr = arrint + arrwithdefault // creating new array with two existing arrays
print(newarr)
var shoppinglist: [String] = ["milk","eggs","apples"]
print(shoppinglist[2])
//to check if array is empty or not
if shoppinglist.isEmpty{
    print("Array is empty")
}
else {
    print("the Array is :",shoppinglist)
}
shoppinglist += ["chocolates","butter"]//equivalent to append but can take multiple arguments
shoppinglist.append("banana")
print(shoppinglist)
shoppinglist[1...2] = ["cheese","cocoa"]
print(shoppinglist)
shoppinglist.remove(at:3)// removes item at given position
shoppinglist.removeLast()
print(shoppinglist)
for item in shoppinglist{
    print(item)
}
for (index,value) in shoppinglist.enumerated(){ // for giving index of each item
    print("item \(index+1) : \(value)")
}
print(shoppinglist.contains("cheese"))//// use .contains to check if given item is in array

//collection types : Sets
var letters = Set<Character> () // creating an empty set
print("letters is set of type Set<Character> with \(letters.count) items")
letters.insert("A")
print(letters)
var languages : Set <String> = ["Eng","Marathi","Hindi"] // creating set with intial values
print(languages)
if languages.contains("Spanish"){ // use .contains to check if given item is in set
    print("Spanish is in language set")
}
else{
    print("Spanish is not in language set")
}
//Iterating Over a Set
for language in languages {
    print(language)
}
for language in languages.sorted(){
    print(language)
}
//Fundamental Set Operations
let evendigits : Set = [0,2,4,6,8,10]
let odddigits : Set = [1,3,5,7,9,11]
let primenos : Set = [2,3,5,7,11,13]
print(evendigits.union(odddigits).sorted())// union
print(odddigits.intersection(primenos).sorted())//intersection
print(odddigits.subtracting(primenos).sorted())//substraction
print(odddigits.symmetricDifference(primenos).sorted())//symmetric Difference
//Set Membership and Equality
print(odddigits.isSubset(of: primenos))//to check if odddights
print(odddigits.isDisjoint(with: evendigits))// to check if two sets are disjoint with each other
print(odddigits.isSuperset(of: primenos)) // to check id the set is superset of other set

//Collection types : Dictionaries
var nameOfInteger = [Int : String]() // creating empty dictionary
var nameOfStudents : [Int : String] = [1 : "Rudra",2 : "Ashley",3 : "Nisha"] //creating dictionary with key and value
print(nameOfStudents)
nameOfStudents[4] = "Nidhi"// adding new key:value pair in dictionary
print(nameOfStudents)
nameOfStudents.updateValue("Rucha", forKey:4)
//print(nameOfStudents)
let removedvalue = nameOfStudents.removeValue(forKey: 1)
print("the removed student name is \(String(describing: removedvalue))")
//Iterating Over a Dictionary
for (rollno,student) in nameOfStudents {
    print("\(rollno): \(student)")
}
for rollno in nameOfStudents.keys{ //iterating over keys
    print(rollno)
}
for names in nameOfStudents.values{ // iterating over values
    print(names)
}

//Control Flow
//for-in loops with numeric ranges.
for index in 0...10 {
    print("\(index) times 5 is \(index * 5)")
}
let base = 3
let power = 10
var answer = 1
for _ in 1...power { //If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name.
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
let minInterval = 5
for tickmark in stride(from: 0, to:minutes, by: minInterval){ // use of stride "to" for open ranges, "through" for close ranges
    print(tickmark)
}

// while loops
let finalsqr = 25
var board = [Int](repeating: 0, count: finalsqr + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//print(board)
var square = 0
var diceroll = 0
while square < finalsqr {
    diceroll += 1
    if diceroll == 7 {
        diceroll = 1
    }
    square += diceroll
    if square < board.count{
        // if still on board move up in case of ladder, and down in case of snake
        square += board[square]
        //print(square)
    }
}
print("Game Over!!")
//repeat while
repeat {
    square += board[square]
    //roll the dice
    diceroll += 1
    if diceroll == 7 {
        diceroll = 1
    }
    square += diceroll
    
}while square < finalsqr
print("Game over!!")
// conditional statements : if else
var temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a sweatshirt.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
let othercharactor = "a"
switch othercharactor {
//case a: case need at least one executable sentanance, otherwise gives compile time error
default:
    print("Not a")
}
let somechar = "B"
switch somechar {
case "b","B":
    print("it's B")
default:
    print("something other than B")
}
//interval matching in switch
let wavelength = 620
switch wavelength {
case 380..<450:
    print("Purple")
case 450..<495:
    print("Blue")
case 495..<570:
    print("Green")
case 570..<590:
    print("Yellow")
case 590..<620:
    print("orange")
case 620..<750:
    print("Red")
default:
    print("Invisible Spectrum")
}
// tuples in  switch case
let point = (1,1)
switch point {
case(0,0):
    print("point is at origin")
case (_,0):
    print("point is on x axis")
case (0,_):
    print("Point is on y axis")
case(-2...2,-2...2):
    print("point is inside the box")
default:
    print("ponit is out of the box")
}
//Value Bindings : the values are bound to temporary constants or variables within the case’s body.
let otherpt = (2,0)
switch otherpt {
case (let x,0):
    print("the point is on x axis at \(x)")
case (0,let y):
    print("the point is on y axis at \(y)")
case(let x, let y):
    print("the point is somewhere with x value \(x) and y value \(y)")
}
// where : A switch case can use a where clause to check for additional conditions.
let anotherpt = (3,-2)
switch anotherpt {
case(let x,let y)where x == y:
    print("(\(x),\(y)) is on line x == y")
case (let x,let y)where -x == y:
    print("(\(x),\(y)) is on line -x == y")
default:
    print("\(anotherpt) is just an arbitory point")
}
// compound cases in switch
let someChar: Character = "e"
switch someChar {
case "a", "e", "i", "o", "u":
    print("\(someChar) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someChar) is a consonant")
default:
    print("\(someChar) is not a vowel or a consonant")
}
//Compound cases can also include value bindings.
let stillAnotherPoint = (0, 3)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
//Control Transfer Statements
//continue : tells a loop to stop what it is doing and start again at the beginning of the next             iteration through the loop.
let input = "Great minds think alike"
var output = ""
let chartoremove : [Character] = ["a","e","i","o","u"]
for character in input {
    if chartoremove.contains(character){
        continue
    }
    output.append(character)
}
print(output)
//break : ends execution of an entire control flow statement immediately.
//Fallthrough
//If need C-style fallthrough behavior, opt in to this behavior on a case-by-case basis with the fallthrough keyword.
let integer  = 5
var description = "The no \(integer) is "
switch integer {
case 1,3,5,7,9:
    description += "Odd no and "
    fallthrough
default:
    description += "Integer"
}
print(description)


