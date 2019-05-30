import Cocoa
//Error handling
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
//throw VendingMachineError.insufficientFunds(coinsNeeded: 10)
struct Item {
    var price: Int
    var count: Int
}
class Vendingmachine {
    var inventory = [
        "Chocolates": Item(price: 10, count: 5),
        "Chips": Item(price: 20, count: 2)
    ]
    var coindeposited = 0
    func Vend (ItemNamed name : String) throws {
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coindeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coindeposited)
        }
        coindeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")

    }
}
let favoriteSnacks = [
    "Rudrani": "Chocolates",
    "Nidhi": "Chips"
]
func buyFavSnack(person: String, VendingMachine: Vendingmachine) throws {
    let snack = favoriteSnacks[person] ?? "Kitkat"
    try VendingMachine.Vend(ItemNamed: snack)
}
//Throwing initializers can propagate errors in the same way as throwing functions.
struct PurchasedSnack {
    let name: String
    init(name: String, vendingmachine: Vendingmachine) throws {
        try vendingmachine.Vend(ItemNamed: name)
        self.name = name
    }
}
//Handling Errors Using Do-Catch
var vendingMachine = Vendingmachine()
vendingMachine.coindeposited = 8
do {
    try buyFavSnack(person: "Rudrani", VendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
func nourish(with item: String) throws {
    do {
        try vendingMachine.Vend(ItemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
do {
    try nourish(with: "candy")
} catch {
    print("Unexpected Error :\(error)")
}

//Converting Errors to Optional Values
/*func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}  code uses several approaches to fetch data, or returns nil if all of the approaches fail.
*/

//Disabling Error Propagation :write try! before the expression to disable error propagation.
//specifing cleanup actions
/*func processFile(filename: String) throws {
    if exists (filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here
    }
}
*/

//Type casting :a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class movie : MediaItem{
    var director :String
    init(name: String,director: String){
        self.director = director
        super.init(name: name)
    }
}
class song : MediaItem{
    var singer: String
    init(name: String,singer: String) {
        self.singer = singer
        super.init(name: name)
    }
}
let library = [
    movie(name: "Casablanca", director: "Michael Curtiz"),
    song(name: "Blue Suede Shoes", singer: "Elvis Presley"),
    movie(name: "Citizen Kane", director: "Orson Welles"),
    song(name: "The One And Only", singer: "Chesney Hawkes"),
    song(name: "Never Gonna Give You Up",singer: "Rick Astley")
]
//type of library inferred tobe MediaItem

//Checking Type: Use the type check operator (is) to check whether an instance is of a certain subclass type
var moviecount = 0
var songcount = 0
for item in library {
    if item is movie{
        moviecount += 1
    }
    else if item is song {
        songcount += 1
    }
}
print("movie count is \(moviecount) and song count is \(songcount)")

// Downcasting
//you can try to downcast to the subclass type with a type cast operator (as? or as!).
//as?, returns an optional value of the type you are trying to downcast to : use when not sure if the downcast will succeed.
//as! attempts the downcast and force-unwraps the result as a single compound action.:  Use when your are sure that downcast will always succeed
for item in library {
   if let movie = item as? movie{
    print("The movie is\(movie.name) and director of the movie is \(movie.director)")
   }
   else if let song = item as? song{
    print("The song is \(song.name) and singer is \(song.singer)")
    }
}
//Type Casting for Any and AnyObject
//Any can represent an instance of any type at all, including function types.
//AnyObject can represent an instance of any class type
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
//print(things)
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Rudra"))
    default:
        print("something else")
    }
}
let optionalno: Int? = 3
things.append(optionalno as Any) // gives warning if as Any is not used
