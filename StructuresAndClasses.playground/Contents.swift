import Cocoa
//structure definition and a class definition
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//creating instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

//Accessing Properties
print("The width of some Resolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280 // use dot syntax to assign value to the variable property.
let video = Resolution(width: 640, height: 480)
print(video.height)
//structures are value types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // hd and cinema are two different instances of structure resolution
cinema.width = 2048
print("The cinema width is now \(cinema.width )")
print("The hd width is still \(hd.width)")

// classes are reference types : Rather than a copy, a reference to the same existing instance is used.
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0 //tenEighty and alsoTenEighty actually both refer to the same VideoMode instance
//Identity Operators
//Identical to (===)
//Not identical to (!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}


//Properties

