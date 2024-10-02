import UIKit

var greeting = "Hello, playground"


// Swift Gen

let energy = 80
let timeOfDay = "evening"

switch (energy, timeOfDay) {
case (80...100, "morning"):
    print("You're full of energy! Great time for a workout.")
case (50...79, "morning"):
    print("You're doing okay. Maybe a light jog?")
case (0...49, "morning"):
    print("Take it easy, maybe stretch a little.")
case (80...100, "evening"):
    print("You're full of energy! Perfect for some evening training.")
case (50...79, "evening"):
    print("You have some energy left. How about some yoga?")
case (0...49, "evening"):
    print("Not much energy left. Time to rest.")
default:
    print("Check your energy level and time of day, something's off.")
}


var optionalInt1: Int? = 1
var optionalInt2: Int? = nil

switch (optionalInt1, optionalInt2) {
case let (value1?, value2?) :
     print("Both have values: \(value1) and \(value2)")
case let (value1?, nil):
     print("First has a value: \(value1), second is nil")
case let (nil, value2?):
     print("First is nil, second has a value: \(value2)")
case(nil, nil):
    print("nil")
}

var bookTitle: String?

if let bookTitle {
    print("The title of the book is \(bookTitle)")
}

func createUrlRequest(from urlString: String) -> URLRequest? {
    URL(string: urlString).map { URLRequest(url: $0)}
}

var ingredients = ["potatoes", "cheese", "cream"]

var doubleIngredients = ingredients.dropFirst()

for (i, ingredient) in zip(
    doubleIngredients.indices, doubleIngredients
) {
    doubleIngredients[i] = "\(ingredient) x 2"
}


enum TransportationEvent {
    case busArrival(busNumber: Int, passengers: Int)
    case trainArrival(
            trainNumber: Int,
            passengers: Int,
            cargoLoad: Int
        )
        case bicycleArrival
}


let transportationEvents: [TransportationEvent] = [
    .busArrival(busNumber: 1, passengers: 5),
    .busArrival(busNumber: 2, passengers: 15),
    .trainArrival(trainNumber: 10, passengers: 50, cargoLoad: 100),
    .busArrival(busNumber: 3, passengers: 20),
    .bicycleArrival
]

for case let .busArrival(busNumber, passengers)
        in transportationEvents where passengers > 10 {
    print("Bus \(busNumber) arrived with \(passengers) passengers.")
}

let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

let valueToFind = 5

searchValue: for row in matrix {
    for num in row {
        if num == valueToFind {
            print("Value \(valueToFind) found" )
            break searchValue
        }
    }
}

let num = [1,2,3,4]

func printNumbers(numbers: Int...) {
    for numbers in numbers {
        print(numbers)
    }
}

printNumbers(numbers: 1,2,4)

struct FetchOptions: OptionSet {
    let rawValue: Int
    
    static let useCahe = FetchOptions(rawValue: 1 << 0)
    static let retryOnFailure = FetchOptions(rawValue: 1 << 1)
    static let background = FetchOptions(rawValue: 1 << 2)
}

func fetchData(options: FetchOptions) {
    if options.contains(.useCahe) {
        
    }
    if options.contains(.retryOnFailure) {
        
    }
    if options.contains(.background) {
        
    }
}

fetchData(options: [.useCahe, .retryOnFailure])

struct User {
    var name: String
    var age: Int
}

func updateUserDetails(
    user: inout User, newName: String, newAge: Int
) {
    user.name = newName
    user.age = newAge
}

var currentUser = User(name: "Alice", age: 3)

updateUserDetails(user: &currentUser, newName: "rer", newAge: 40)

enum LogLevel: Comparable {
    case debug, info, warning, error
}

var currentLogLevel: LogLevel = .info

func logMessage(
    level: LogLevel,
    message: @autoclosure () -> String
) {
    if level >= currentLogLevel {
        print(message())
    }
}

func expensiveStringComputation() -> String {
    return "Expensive Computed String"
}

currentLogLevel = .debug

logMessage(level: .debug, message: "")


//MARK: Never

func assertUnreachableCode(
    file: String = #file,
    line: Int = #line,
    function: String = #function
) -> Never {
    print("""
    Fatal error: Unreachable code reached \
    in \(file) at line \(line), function \(function)
    """)
    
    fatalError("Unreachable code reached")
}


enum UserCommand {
    case start, stop, pause, resume, unknown
}

func processCommand(_ command: UserCommand) -> String {
    switch command {
    case .start: return "Started"
    case .stop: return "Stopped"
    case .pause: return "Paused"
    case .resume: return "Resumed"
    case .unknown:
        assertUnreachableCode()
    }
}

print(processCommand(.start))
print(processCommand(.unknown))

// Функция fatalError используется для указания на фатальные ошибки в коде, и её вызов вызывает краш приложения, потому что программа не должна продолжать своё выполнение после этого. Это полезно в ситуациях, когда достигается участок кода, который по логике программы не должен быть достигнут.

// ----

protocol Equipment {
    var description: String { get }
}

struct SoccerBall: Equipment {
    var description: String {
        "Soccel ball"
    }
}

struct CustomizedEquipment<T: Equipment>: Equipment {
    var baseEquipment: T
        var description: String {
            "Customized \(baseEquipment.description)"
        }
}

struct QualityCheckedEquipment<T: Equipment>: Equipment {
    var baseEquipment: T
    var description: String {
        "Quality checked \(baseEquipment.description)"
    }
}

func produceHighQualityCustomizedBall(
) -> some Equipment {
    let qualityCheckedBall = QualityCheckedEquipment(
        baseEquipment: SoccerBall()
    )
    return CustomizedEquipment(baseEquipment: qualityCheckedBall)
}
