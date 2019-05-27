import Cocoa

//Instance Methods :Instance methods are functions that belong to instances of a particular class, structure, or enumeration
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 10)
print(counter.count)
counter.reset()
print(counter.count)
//The self Property :use the self property to refer to the current instance within its own instance methods.
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x //self disambiguates between a method parameter called x and an instance property that is also called x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
//Modifying Value Types from Within Instance Methods
struct point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var SomePoint = point(x: 1.0, y: 1.0)
SomePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(SomePoint.x), \(SomePoint.y))")
//you cannot call a mutating method on a constant of structure type
//let fixedPoint = Point(x: 3.0, y: 3.0) gives error
//fixedPoint.moveBy(x: 2.0, y: 3.0)

//Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
//ovenLight.next()
print(ovenLight)

//Type Methods
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
}
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//Subscripts : Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence.

//subscript syntax
//read-only subscript implementation
struct Timestable {
    let multiplier : Int
    subscript (Index : Int) -> Int {
        return multiplier * Index
    }
}
let threetimestable = Timestable(multiplier: 3)
print("six times three is \(threetimestable[6])")
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
}
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
}
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 4, columns: 5)
matrix[0,1] = 3
matrix[0,0] = 1.5
matrix [1,0] = 4.5
//matrix[5,6] = 1 // assertion is triggered here
print(matrix.grid)
