import Cocoa
//Enumerations : defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
//Enumeration Syntax
enum Compasspoint {
    case North //use the case keyword to introduce new enumeration cases.
    case South
    case East
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune // multiple cases can be in same line
}
var directionToHead = Compasspoint.East
//Matching Enumeration Values with a Switch Statement
switch directionToHead {
case.East:
    print("Sun rises in the east.")
case.west:
    print("Sun set in the west.")
case.North:
    print("The North Remembers.")
case.South:
    print("Watch out for penguins")
}
//Iterating over Enumeration Cases
enum Drinks: CaseIterable {
    case coffee,tea,juice
}
let noOfChoices = Drinks.allCases.count
print("Total no of drinks available :",noOfChoices)

for drink in Drinks.allCases{
    print(drink)
}
//Associated Values
enum Barcode {
    case upc(Int,Int,Int,Int)//Barcode, which can take a value of upc with an associated value of type (Int, Int, Int, Int)
    case qrcode(String) //Barcode, which can take a value of qrcode with an associated value of type (String)
}
var productBarcode = Barcode.upc(8, 12345, 67854, 3)

switch productBarcode {
    case.upc(let numberSystem, let manufacturer, let product, let check):
        print("The upc for product is \(numberSystem) \(manufacturer) \(product) \(check)")
    case.qrcode(let qr):
        print("The qrcode for the product is : \(qr)")
}

//Raw Values : enum cases can be associated with default values called raw values
//Each raw value must be unique within its enumeration declaration.
enum ASCIIcharacters : Character {
    case tab = "\t"
    case newline = "\n"
    case carriageReturn = "\r"
}
//Implicitly Assigned Raw Values
enum Planets: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune // as the mercury is given value 1, venus implicitly gets the raw value 2 and so on
}
//print(Planets.earth.rawValue)
let possibleplanet = Planets(rawValue: 3)// initialization from raw value
print(possibleplanet!)
if let someplanet = Planets(rawValue: 11){
    print("There is planet \(someplanet)")
}
else{
    print("There is no planet at this possition")
}
//Recursive Enumerations : an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

