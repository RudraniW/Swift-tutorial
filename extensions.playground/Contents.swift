import Cocoa
//extensions : add new functionality to an existing class, structure, enumeration, or protocol type.
//Extensions can add new functionality to a type, but they cannot override existing functionality.
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
}//adds five computed instance properties to Swift’s Double type,
let oneKm = 1.km
print("one km is \(oneKm) meters")
let onecm = 1.cm
print("one kcm is \(onecm) meters")
let Marathon = 39.km + 1000.m
print("The marathon is \(Marathon) meters long")
//Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties.
//Extensions can add new initializers to existing types
struct Size {
   var width = 0.0, height = 0.0
}
struct Point {
   var x = 0.0 , y = 0.0
}
struct Rect {
    var size = Size()
    var origin = Point()
}
let defaultRect = Rect()
let memberwiseRect = Rect(size: Size(width: 4,height: 4), origin: Point(x: 2, y: 2))
//You can extend the Rect structure to provide an additional initializer that takes a specific center point and size:
/*extension Rect{
 init(center:Point,size:Size) {
 let originX = center.x - (size.width / 2)
 let originY = center.y - (size.height / 2)
 self.init(center: Point(x: originX, y: originY), size: size)
 
 }
 
 }
 let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
 size: Size(width: 3.0, height: 3.0))
 */
//Extensions can add new instance methods and type methods to existing types

extension Int {
    func repetitions(task: () ->Void) {
        for _ in 0..<self{
            task()
        }
        
    }
}
4.repetitions {
    print("Rudrani")
}
//Mutating Instance Methods
extension Int {
    mutating func square(){
        self = self * self
    }
}
var int = 10
int.square()
print(int)
//Subscripts: Extensions can add new subscripts to an existing type
extension Int{
    subscript(digitIndex: Int) -> Int {
        var decimalbase = 1
        for _ in 0 ..< digitIndex {
            decimalbase *= 10
        }
        return(self / decimalbase) % 10
    }
}
print(123456[0])
extension Int {
    enum type {
        case negative, zero, positve
    }
    var kind : type {
        switch self {
        case 0:
            return.zero
        case let x where x > 0:
            return.positve
        default:
            return.negative
        }
    }
}
func printIntegerType(_ numbers : [Int]){
    for no in numbers {
        switch no.kind {
        case .negative:
            print("- ",terminator: "")
        case.zero:
            print("0 ",terminator: "")
        default:
            print("+ ", terminator: "")
        }
    }
}
printIntegerType([2,-3,6,0,-5,4])
