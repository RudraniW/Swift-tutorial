import Cocoa
// Functions
//Defining and Calling Functions
func greet( person : String) -> String { //indicate the function’s return type with ->
    let greeting = "Hello " + person + "!"
    return greeting
}
print(greet(person: "Rudrani")) // function call
func helloWorld () -> String { // function without parameter
return "Hello World!"
}
print(helloWorld())

func addition(x: Int, y: Int) -> Int{// function with multiple parameters
    return x + y
}
print(addition(x: 10, y: 35))

func substraction (x: Int, y: Int) { // function without return, returns special value of type void
    print( x - y)
}
substraction(x: 45, y: 5)

func minmax(array : [Int]) -> (min : Int, max : Int){//Function with Multiple Return Values
    var currentmin = array[0]
    var currentmax = array[0]
    for value in array[1..<array.count]{
        if value < currentmin{
            currentmin = value
        }
        else{
            currentmax = value
        }
    }
    return (currentmin,currentmax)
}
let bounds = minmax(array: [12,34,23,54,67,1,78,98])
print("The minimum element is : \(bounds.min) and the maximum element is : \(bounds.max)")

//optional tuple return type to reflect the fact that the entire tuple can be nil.
func MinMax(array : [Int]) -> (min : Int, max : Int)?{
    if array.isEmpty {return nil}
    var currentmin = array[0]
    var currentmax = array[0]
    for value in array[1..<array.count]{
        if value < currentmin{
            currentmin = value
        }
        else if value > currentmax{
            currentmax = value
        }
    }
    return (currentmin,currentmax)
}
if let boundaries = MinMax(array:[1,-7,12,45,665,0,-3,45]){
print("The minimum element is : \(boundaries.min) and the maximum element is : \(boundaries.max)")
}
else{
    print("The Array is Empty")
}
func greet(person: String, from hometown: String) -> String { //argument labels.. here from is argument label for parameter hometown
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Ashley", from: "Bangalore"))

func greeting(_ person: String, from hometown: String) -> String { //if you don't want argument label, put _ before parameter name
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greeting("Ashley", from: "Bangalore"))

func Multiply (x: Int, y: Int = 10) -> Int{ // default parameter value, y has default value 10
    return x * y
}
print(Multiply(x: 5, y: 20))// If y value is given then it takes given y value, if y value is not given then it takes default y value

//Variadic Parameters : variable no of parameters from 0 to any number. A function may have at most one variadic parameter.
func average(_ numbers: Double...) -> Double { // write variadic parameter by writing ... in front of parameter's name
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print("The average of [1,2,3,4,5,6] is :", average(1,2,3,4,5,6))

//In-Out Parameters : If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter.
//In-out parameters cannot have default values, and variadic parameters cannot be marked as inout.
func swapping(a: inout Int , b: inout Int){
    let temp = a
    a = b
    b = temp
    print("The values of a and b are : ", a,",",b)
}
var x = 5
var y = 12
swapping(a: &x, b: &y)// only variables can be passed as inout parameters
var mathfunction : (Int,Int) -> Int = Multiply // defining the variable of function type
print(mathfunction(5,8))

func printmathresult(_ mathfunction:(Int,Int) -> Int, _ a: Int, _ b: Int){ //Function Types as Parameter Types
    print("Result : \(mathfunction(a,b))")
}

printmathresult(addition,3,10)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(_ backward: Bool) -> (Int) -> Int { // the function has return type as (Int) -> Int
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
//moveNearerToZero now refers to the stepBackward() function
print("Counting to zero:")
while currentValue != 0 {
    print("Current value is :",currentValue)
    currentValue = moveNearerToZero(currentValue)
}
//Nested Functions
func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    func Forward(input: Int) -> Int { return input + 1 }
    func Backward(input: Int) -> Int { return input - 1 }
    return backward ? Backward : Forward
}
var currentValue1 = -4
let MoveNearerToZero = chooseStepFunc(backward: currentValue1 > 0)
// moveNearerToZero now refers to the nested Forward() function
while currentValue1 != 0 {
    print("\(currentValue1) ")
    currentValue1 = MoveNearerToZero(currentValue1)
}

// Closures

let numbers = [12,34,32,54,67,43]
//var sortedNos = numbers.sorted( by: {(s1: Int, s2: Int) -> Bool in return s1 < s2} )
var sortedNos = numbers.sorted(by: {s1, s2 in return s1 > s2}) //Inferring Type From Context: as numbers is array of Int, s1 and s2 type is inferred as Int
print(sortedNos)
var SortedNos = numbers.sorted(by: {s1, s2 in s1 < s2}) //Single-expression closures can implicitly return the result of their single expression by omitting the return keyword
print(SortedNos)
var sorted = numbers.sorted(by: {$0 < $1})//shorthand argument names, automatically provided by swift, written as $0,$1 and so on, while using these, in can be omitted
print(sorted)
