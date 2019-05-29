import Cocoa
//Optional Chaining : process for querying and calling properties, methods, and subscripts on an optional that might currently be nil.
//result of an optional chaining call is always an optional value
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
let rudrani = Person()
//let roomCount = rudrani.residence!.numberOfRooms : forced unwrapping, triggers runtime error
if let roomCount = rudrani.residence?.numberOfRooms {
    print("Rudrani's Residence has \(roomCount) rooms")
}
else {
    print("Unable to get roomcount.")
}
rudrani.residence = Residence()
if let roomCount = rudrani.residence?.numberOfRooms {
    print("Rudrani's Residence has \(roomCount) rooms")
}
else {
    print("Unable to get roomcount.")
}
rudrani.residence?.numberOfRooms = 5
if let roomCount = rudrani.residence?.numberOfRooms {
    print("Rudrani's Residence has \(roomCount) rooms")
}
class person {
    var residence: residence?
}
class Room {
    let name: String
    init(name: String){
        self.name = name
        
    }
}
class address{
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier () -> String? {
        if let buildingNumber = buildingNumber, let street = street{
            return "\(String(describing: buildingName)), \(street)"
        }
        else if buildingName != nil {
            return "\(String(describing: buildingName))"
        }
        else{
            return nil
        }
    }
}
class residence {
    var rooms = [Room]()
    var noOfRooms : Int {
        return rooms.count
    }
    subscript (i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }

func printNoOfRooms() {
    print("No of rooms are \(noOfRooms)")
}
    var address : address?
}

let Nidhi = person()
if let roomCount = Nidhi.residence?.noOfRooms {
    print("Nidhi's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
let someAddress = address()
someAddress.buildingName = "Shree"
someAddress.buildingNumber = "13"
someAddress.street = "8th cross"
Nidhi.residence?.address = someAddress

func createAddress() -> address {
    print("Function was called.")
    
    let someAddress = address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
Nidhi.residence?.address = createAddress()

//Calling Methods Through Optional Chaining
if Nidhi.residence?.printNoOfRooms() != nil {
    print("It was possible to print no of rooms")
}
else {
    print("It was not possible to print no of rooms")
}
if (Nidhi.residence?.address = someAddress) != nil {
    print("It is possible to set address")
}
else {
    print("Failed to set address")
}
//Accessing Subscripts Through Optional Chaining
//to try to retrieve and set a value from a subscript on an optional value, and to check whether that subscript call is successful.
if let firstRoomName = Nidhi.residence?[0].name {
    print("First room name is \(firstRoomName)")
}
else{
    print("Unable to get first room name")
}
Nidhi.residence?[0] = Room(name: "Hall")
if let firstRoomName = Nidhi.residence?[0].name {
    print("First room name is \(firstRoomName)")
}
else{
    print("Unable to get first room name")
}
let Nidhihouse = residence()
Nidhihouse.rooms.append(Room(name:"Living room"))
Nidhi.residence = Nidhihouse
if let firstRoomName = Nidhi.residence?[0].name {
    print("First room name is \(firstRoomName)")
}
else{
    print("Unable to get first room name")
}
//Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
//Linking Multiple Levels of Chaining :multiple levels of optional chaining do not add more levels of optionality to the returned value.
if let NidhiStreet = Nidhi.residence?.address?.street{
    print("Nidhi stays at \(NidhiStreet)")
}
else{
    print("Unable retrive street name")
}
let nidhiaddress  = address()
nidhiaddress.street = "5th cross"
nidhiaddress.buildingName = "Shree"
Nidhi.residence?.address = nidhiaddress
if let NidhiStreet = Nidhi.residence?.address?.street{
    print("Nidhi stays at \(NidhiStreet)")
}
else{
    print("Unable retrive street name")
}
if let buildingIdentifier = Nidhi.residence?.address?.buildingIdentifier(){
    
    print("building identifier is \(buildingIdentifier).")
}
if let beginsWithThe =
    Nidhi.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("building identifier begins with \"The\".")
    } else {
        print("building identifier does not begin with \"The\".")
    }
}
