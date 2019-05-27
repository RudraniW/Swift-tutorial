import Cocoa
// Inheritance
class Vehicle {
    var current_speed = 0.0
    var description : String {
        return "The vehicle is travelling at \(current_speed) kms per hour"
    }
    func makesNoise() {
        //Do nothing
    }
}
let vehicle1 = Vehicle()
print("vehicle1 : \(vehicle1.description)")

//Subclassing
class car : Vehicle { // car class automatically gains all of the characteristics of Vehicle, such as its currentSpeed and description properties and its makeNoise() method.
    var convertible = false
     var gear = 1
    override var description: String{
        return super.description + " and gear is \(gear)"
        
    }
}
let i20 = car()
i20.current_speed = 60
print("Car i20 : \(i20.description)")
//Subclasses can themselves be subclassed

class Bicycle: Vehicle {
    var hasBasket = false
}
class hero : Bicycle {
    var currentnoofpassengers = 0
}
let Hero = hero()
Hero.current_speed = 14
Hero.currentnoofpassengers = 2
Hero.hasBasket = true
print("Hero : \(Hero.description)")

//Overriding : Done using override keyword
class Train: Vehicle {
    var name = "Channai express"
    override func makesNoise() {
        print("Choo Choo")
    }
    override var description: String{
        return super.description + " and it's name is " + name
        
    }
}
let train = Train()
train.current_speed = 65
print(train.makesNoise())
print("Train :",train.description)

class automaticCar : car {
    override var current_speed : Double{
        didSet {
            gear = Int(current_speed/10) + 1
        }
    }
}
let autocar = automaticCar()
autocar.current_speed = 54
print("Automatic Car :",autocar.description)

//Preventing Overrides : Done by using final modifier before propery,method or subscript
