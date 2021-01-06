 100 days of swift

day 1 ============================================================================================

Variables
	var str = "Hello, playground"
	str = "Goodbye" // only need to declare the variable once

	var population = 8_000_000 // You can use underscores to make a larger number easy to read

	var largeStr = """
	You can use triple quotes to write a multi line string, but 
	reminber to leave the last 3 quotes separate in another line
	
	if you don't want the line breaks showing in your string \
	you can use a \ to not break the line
	"""

	// variables can not 

Doubles and Booleans

	// “Double” is short for “double-precision floating-point number”, and it’s a fancy way of saying it holds fractional values 
	var pi = 3.141
	//You can't mix Int with Double, they are different

	// Booleans hold either true or false
	var awesome = true

String interpolation

	//example
	var score = 85
	var str = "Your score was \(score)"
	var results = "The test results are here: \(str)"

Constants
	// The let keyword creates constants, which are values that can be set once and never again. 
	let taylor = "swift"

Type annotations

	let album: String = "Reputation"
	let year: Int = 1989
	let height: Double = 1.78
	let taylorRocks: Bool = true


day 2 ============================================================================================

Arrays

	let john = "John Lennon"
	let paul = "Paul McCartney"
	let george = "George Harrison"
	let ringo = "Ringo Starr"

	let beatles = [john, paul, george, ringo]
 
	beatles[1]	return "Paul McCartney" 
	// swift crashes if u read a item that doesn't exist 

	let examples =  [String]
					[Int]
					[Double]
					[Bool]


Sets

	// Itens are stored in a random order, and all itens must be unique
	// You can create sets directly from arrays

	let colors = Set(["red", "green", "blue"])

Tuples

	 /*
	 Tuples are like array but have 3 main differences:
	 1_ You can't add or remove items from a tuple; they are fixed in size
	 2_ You can't change the type of items in a tuple; they always have the same types they were created with.
	 3_ You can access items in a tuple using numerical positions or by naming them, but Swift won't let you read numbers or names that don't exist.
	*/

	var name = (first: "Taylor", last: "Swift")
		name.0 or name.first	return "Taylor"

arrays x Sets x Tuples

	//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
	let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

	//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
	let set = Set(["aardvark", "astronaut", "azalea"])

	//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
	let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

Dictionaries

	//Dictionaries are collections of values just like arrays, but rtather than storing things with an integer position you can access them using anything you want.

	let heights = [
		"Taylor Swift": 1.78,
		"Ed Sheeran": 1.73
	]

	heights["Taylor Swift"]

		let examples =  [String: Double]
						[String: String]
						[String: Bool]
						[Int: String]

Dictionaries default values

	//If you try to read a value from a dictionary using a key that doesn’t exist, Swift will send you back nil – nothing at all. 

	let favoriteIceCream = [
		"Paul": "Chocolate",
		"Sophie": "Vanilla"
	]

	favoriteIceCream["Paul"]							return "Chocolate"
	favoriteIceCream["Charlotte"]						return nil //(Nothing at all)

	favoriteIceCream["Charlotte", default: "Unknown"]	return "Unknown"

Creating empty collections

	// Arrays, sets, and dictionaries are called collections

	var teams = [String: String]() //Creates a empty dicionary
	teams["Paul"] = "Red"

	var results = [Int]() // Similarly, you can create an empty array to store integers like this

	// Sets are the exception, they are created in a diferent way:
	var words = Set<String>()
	var numbers = Set<Int>()

	// You can also create dictionaries and arrays like sets:
	var scores = Dictionary<String, Int>()
	var results = Array<Int>()

Enumerations

	//usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.
	let result = "failure"
	let result2 = "failed"
	let result3 = "fail"

	// Instead use enom from preventing accidently using different strings each time

	enum Result {
		case success
		case failure
	}
	
	let result4 = Result.failure

Enum associated values

	//enums can also store associated values attaches to each case.

	enum Activity {
		case bored
		case running(destination: String)
		case talking(topic: String)
		case singing(volume: Int)
	}

	let talking = Activity.talking(topic: "football")

Enum raw values

	enum Planet: Int {
		case mercury
		case venus
		case earth
		case mars
	}

	//Swift will automatically assign each of those a number starting from 0, and you can use that number to create an instance of the appropriate enum case.
	let earth = Planet(rawValue: 2)

	//If you want, you can assign one or more cases a specific value, and Swift will generate the rest.
	enum Planet: Int {
		case mercury = 1
		case venus
		case earth
		case mars
	}
	// Earth will the n# 3

day2 Summary
	/*
	1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
	2. Arrays store items in the order you add them, and you access them using numerical positions.
	3. Sets store items without any order, so you can’t access them using numerical positions.
	4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
	5. Dictionaries store items according to a key, and you can read items using those keys.
	6. Enums are a way of grouping related values so you can use them without spelling mistakes.
	7. You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
	*/


day 3 ============================================================================================

Arithmetic operators

	// Operators are those little mathematical symbols like + and -

	let firstScore = 12
	let secondScore = 4

	let total = firstScore + secondScore
	let difference = firstScore - secondScore
	
	let product = firstScore * secondScore
	let divided = firstScore / secondScore

	let remainder = 13 % secondScore return 1 
	// second score = 4 -> 13 / (4*3) will remain 1 from that division 13 - 12


Operators overloading

	// Swift is typesafe so u you mix types ex. Int + Double

	let meaningOfLife = 42
	let doubleMeaning = 42 + 42

	let fakers = "Fakers gonna "
	let action = fakers + "fake"

	let firstHalf = ["John", "Paul"]
	let secondHalf = ["George", "Ringo"]
	let beatles = firstHalf + secondHalf

Compound assignment operators

	var score = 95
	score -= 5

	var quote = "The rain in Spain falls mainly on the "
	quote += "Spaniards"

Comparison operators

	let firstScore = 6
	let secondScore = 4

	firstScore == secondScore
	firstScore != secondScore

	firstScore < secondScore
	firstScore >= secondScore

	"Taylor" <= "Swift"

Conditions

//if statements
	let firstCard = 11
	let secondCard = 10

	if firstCard + secondCard == 2 {
		print("Aces A Lucky!")
	} else if firstCard + secondCard == 21 {
		print("Blackjack!")
	} else {
		print("Regular cards")
	}

Combining Conditions

// && - And
// || = OR
	let age1 = 12
	let age2 = 21

	if age1 > 18 && age2 > 18 {
		print("Both are over 18")
	}
	if age1 > 18 || age2 > 18 {
		print("At least one is over 18")
	}

Ternary Operator

	// Ternary has this name cause it take 3 arguments

	let firstCard = 11
	let secondCard = 10
	print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
	//       a logic test             a result if true      another if it's false

	// Same as: 
	if firstCard == secondCard {
		print("Cards are the same")
	} else {
		print("Cards are different")
}


Switch statements

	// Switch statements will stop after it finds the first value
	let weather = "sunny"
	
	switch weather {
		case "rain":
			print("Bring an umbrella")
		case "snow":
			print("Wrap up warm")
			fallthrough // Use the fallthrough if you want to switch keep looking
		case "sunny":
			print("Wear sunscreen")
		default: // You need to define a default case for safety
			print("Enjoy you day!")
	}

Range Operators

	let score = 85

	switch score {
		case 0..<50: // It goes from 0 to 49 (included)
			print("You failed badly.")
		case 50...85: // It goes from 50 to 85 (included)
			print("You did OK.")
		default:
			print("You did great!")
	} 


day 3 Summary
/*
	1. Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
	2. There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
	3. You can use if, else, and else if to run code based on the result of a condition.
	4. Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
	5. If you have multiple conditions using the same value, it’s often clearer to use switch instead.
	6. You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
*/


day 4 ============================================================================================

Loops, Loops and more Loops

For Loops

	let count = 1...10

	for number in count {
		print("number is \(number)")
	}

	let albums = ["red", "1989", "Reputation"]
	for album in albums {
		print("\(album) is on Apple Music")
	}

	print("Players gonna ")

	for _ in 1...5 { // You can use a underscore if you don't need a constant
		print("play")
	}

While Loops

	var number = 1

	while number <= 20 {
		print(number)
		number += 1
	}
	print("Ready or not, here I come!")

Repeat Loops

	// In this loop the condition the is only checked at the end of the loop, so it will run the code inside at least once.
	repeat {
		print(number)
		number += 1
	} while number <= 20


Exiting Loops

	var countDown = 10
	while countDown >= 0 {
		print(countDown)

		if countDown == 4 {
			print("I'm bored. Let's go now!")
			break // The loop will print till 4 then it will stop after the break
		}
	}

	//for nested loops use:
	outer: for i in 1...10 {
	for j in 1...10 {
		let product = i * j
		print("Product is \(product)")
		break outer
	}
}

Skipping items

	// If you want to skip the current item and continue on the next one, use continue
	for i in 1...10 {
		if i % 2 == 1 {
			continue
		}
		print(i)
	}

Infinite Loops

	// You can use while loops to make infinite loops
	var counter = 0

	while true {
		print(" ")
		counter += 1

		if counter == 273 {
			break
		}
	}

day 4 Summary
/*
1. Loops let us repeat code until a condition is false.
2. The most common loop is for, which assigns each item inside the loop to a temporary constant.
3. If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
4. There are while loops, which you provide with an explicit condition to check.
5. Although they are similar to while loops, repeat loops always run the body of their loop at least once.
6. You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
7. You can skip items in a loop using continue.
8. Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
*/



day 5 ============================================================================================

Functions

Writing functions

	// Functions let you re-use your code!
	func printHelp() {
		let message = """
		Welcome to MyApp!

		Run this app inside a directory of images 
		and MyApp will resize them all into thumnails
		"""

		print(message)
	}
	printHelp()

Accepting parameters

	// You can send values to a function that can then be used inside the function to change the way it behaves
	func square(number: Int) {
		print(number * number)
	}

	square(number: 8)

Returning values
	// As well as receiving data, functions can also send back data.
	func square(number: Int) -> Int {
		return number * number
	}
	let result = square(number: 8)
	print(result)

	//If you need to return multiple values, this is a perfect example of when to use tuples.

Parameter labels

	/*
	Swift lets us provide two names for each parameter: one to be used externally when calling the function,
	and one to be used internally inside the function. This is as simple as writing two names, separated by a space.
	*/
	func sayHello(to name: String) {
		prnt("Hello, \(name)!")
	}
	sayHello(to: "Taylor")

	// 'to' is calles externally and 'name' is called internally.

Omitting parameter labels

	// You can use underscore on the external parameter
	func greet(_ person: String) {
		print("Hello, \(person)!")
	}
	greet("Taylor")
	// Then you don't have to use the name while passing the parameter

Default parameters

	// Some function like print can function with only 1 parameter, but it has a lot more
	func greet(_ person: String, nicely: Bool = true) {
		if nicely == true {
			print("Hello, \(person)!")
		} else {
			print("Oh no, it's \(person) again...")
		}
	}
	// U can call the example above in 2 different ways:
	greet("Taylor")
	greet("Taylor", nicely: false)

Variadic functions

	// they accept any number of parameters of the same type.
	//Resuming, it's a way to pass 'n' parameters
	func square(numbers: Int...) {
		for number in numbers {
			print("\(number) squared in \(number * number)")
		}
	}
	//now we can pass lots of numbers separated by commas
	square(numbers: 1, 2, 3, 4, 5)

Writing throwing functions


	// Swift lets you throw errors by marking them as throws
	// First you need to define an enum that describes the errors we can throw.
	// These must always be based on Swift’s existing Error type.

	enum PasswordError: Error {
		case obvious
	}

	func checkPassword(_ password: String) throws -> Bool {
		if password == "password" {
			throw PasswordError.obvious
		}
		return true
	}

Running throwing functions 

	/*
	Swift won't let you run an error-throwing function by accident.
	Instead, you need to call these function using three new keywords:
	do - starts a section of code that might cause problems
	try - is used before every function that might throw an error
	catch - lets you handle errors gracefully
	if any error is caught it immediately jumps to the catch
	*/

	do {
		try checkPassword("password")
		print("That password is good!") // this line don't get executed cause of the error in the line above
	} catch {
		print("You can't use that password")
	}

inout parameters

	// All parameters passed into a Swift function are constans
	// You can pass the parameter as inout, to be able to use it outside the function

	func doubleInPlace(number: inout Int) {
		number *= 2
	}
	var myNum = 10
	doubleInplace(number: &myNum) // the '&' is an explicit recognition that you're aware it's a inout
	//It is usually better to return a new value

day 5 Summary

	1. Functions let us re-use code without repeating ourselves.
	2. Functions can accept parameters – just tell Swift the type of each parameter.
	3. Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
	4. You can use different names for parameters externally and internally, or omit the external name entirely.
	5. Parameters can have default values, which helps you write less code when specific values are common.
	6. Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
	7. Functions can throw errors, but you must call them using try and handle errors using catch.
	8. You can use inout to change variables inside a function, but it’s usually better to return a new value.


day 6 ============================================================================================

Creating basic closures

	/*
	Swift lets us use functions just like any other type such as strings and integers. 
	This means you can create a function and assign it to a variable, call that function using that variable, 
	and even pass that function into other functions as parameters.
	*/	
	let driving = {
		print("I'm driving in my car")
	}
	driving()

Accepting parameters in a closure

	/*
	When you create closures, they don’t have a name or space to write any parameters.
	That doesn’t mean they can’t accept parameters, just that they do so in a different way: 
	they are listed inside the open braces.
	*/
	let driving = { (place: String) in 
		print("I'm going to \(place) in my car")
	}
	driving("London")

Returning values form a closure

	//To return a value, we need to use ->  before in, then use return just like a normal function
	ket drivingWithReturn = { (place: String) -> String in 
		return "I'm going to \(places) in my car"
	}
	let message = drivingWithReturn("London")
	print(message)

Closures as parameters

	// Because closures can be used just like strings and integers, you can pass them into functions.
	let driving = {
		print("I'm driving in my car")
	}
	func travel(action: () -> Void) {
		print("I'm getting ready to go.")
		action()
		print("I arrived!")
	}
	travel(action: driving)
	/*
	If we wanted to pass that closure into a function so it can be run inside that function, 
	we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.
	*/

Trailing closure syntax

	// If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. 
	// Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
	func travel(action: () -> Void) {
		print("I'm getting ready to go.")
		action()
		print("I arrived!")
	}
	travel (){
		print("I'm driving in my car")
	}
	travel { //In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
		print("I'm driving in my car")
	}


day 7 ============================================================================================

Using closures as parameters when they accept 

	// () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () 
	// with the types of any parameters that your closure should accept

	func travel(action: (String) -> Void) {
		print("I'm getting ready to go.")
		action("London")
		print("I arrived!")
	}

	travel { (place: String) in 
		print("I'm going to \(place) in my car")
	}

Using closures as parameters when they return values

	// you can also replace that Void with any type of data to force the closure to return a value
	func travel(action: (String) -> String) {
		print("I'm getting ready to go.")
		let description = action("London")
		print(description)
		print("I arrived")
	}
	travel { (place: String) -> String in 
	return "I'm going to \(place) in my car"
	}

Shorthand parameter names

	func travel(action: (String) -> String) {
		print("I'm getting ready to go.")
		let description = action("London")
		print(description)
		print("I arrived")
	}
	travel { (place: String) -> String in 
		return "I'm going to \(place) in my car"
	}
		
		travel { place -> String in // Swift knows the parameter to that closure must be a string, so we can remove it
			return "I'm going to \(place) in my car"
		}

		travel { place in // It also knows the closure must return a string, so we can remove that:
			return "I'm going to \(place) in my car"
		}

		//As the closure only has one line of code that must be the one that returns the value,
		// so Swift lets us remove the return keyword too:
		travel { place in
			"I'm going to \(place) in my car"
		}

		//Swift has a shorthand syntax that lets you go even shorter. 
		// Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. 
		// These are named with a dollar sign, then a number counting from 0.
		travel {
			"I'm going to \($0) in my car"
		}

Closures with multiple parameters

	// function will require a closure that specifies where someone is traveling to, and the speed they are going
	func travel(action: (String, Int) -> String) {
		print("I'm getting ready to go.")
		let description = action("London", 60)
		print(description)
		print("I arrived!")
	}
	travel {
		"I'm going to \($0) at \($1) miles per hour."
	}

Returning closures from functions

	//it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value
	func travel() -> (String) -> Void {
		return {
			print("I'm going to \($0)")
		}
	}
	let result = travel()
	result("London")
	// It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
	let result2 = travel()("London")

Capturing values

	// If you use any external values inside your closure, Swift captures them – stores them alongside the closure,
	// so they can be modified even if they don’t exist any more.
	func travel() -> (String) -> Void {
		return {
			print("I'm going to \($0)")
		}
	}
	let result = travel()
	result("London")

	// Closure capturing happens if we create values in travel() that get used inside the closure. 
	// For example, we might want to track how often the returned closure is called:
	func travel() -> (String) -> Void {
		var counter = 1

		return {
			print("\(counter). I'm going to \($0)")
			counter += 1
		}
	}
	//Even though that counter variable was created inside travel(), 
	//it gets captured by the closure so it will still remain alive for that closure.
	//So, if we call result("London") multiple times, the counter will go up and up:	
	result("London")
	result("London")
	result("London")

-----------ADITIONAL READING ON CLOSURES REQUIRED------------------------


day 8 ============================================================================================

Creating your own structs
	/*
	Swift lets you design your own types in two ways, of which the most common are called structures, or just structs.
	Structs can be given their own variables and constants, and their own functions, then created and used however you want
	*/
	struct Sport {
		var name: String
	}

	var tennis = Sport(name: "Tennis")
	print(tennis.name)

	tennis.name = "Lawn tennis"

Computed properties

	struct Sport {
		var name: String
		var isOlympicSport: Bool

		var OlympicStatus: String {
			if isOlympicSport {
				return "\(name) is an Olympic sport"
			} else {
				return "\(name) is not an Olympic sport"
			}
		}
	}

	let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
	print(chessBoxing.OlympicStatus)

Property observers

	//Property observers let you run code before or after any property changes.
	struct Progress {
		var task: String
		var amount: Int {
			didSet { // You can also use willSet to act before a property changes
				print("\(task) is now \(amount)% complete")
			}
		}
	}
	var progress = Progress(task: "Loading data", amount: 0)
	progress.amount = 30
	progress.amount = 80
	progress.amount = 100

Methods
	// Structs can have functions inside them, and those functions can use the properties of the 
	//struct as they need to. Those functions are called methods
	struct City {
		var population: Int
		func collectTaxes() -> Int {
			return population * 1000
		}
	}
	let london = City(population: 9_000_000)
	london.collectTaxes()

Mutating Methods

	/*
	If a struct has a variable property but the instance of the struct was created as a constant, 
	that property can’t be changed – the struct is constant, so all its properties are also constant 
	regardless of how they were created.
	When you want to change a property inside a method, you need to mark it using the mutating keyword
	*/
	struct Person {
		var name: String

		mutating func makeAnonymous() {
			name = "Anonymous"
		}
	}
	//Swift will only allow that method to be called on Person instances that are variables
	var person = Person(name: "Ed")
	person.makeAnonymous()

Properties and methods of strings

	let string = "Do or do not, there is no try."
	print(string.count)// read the number of characters in a string
	print(string.hasPrefix("Do")) // returns true if the string starts with specific letters
	print(string.uppercased()) // uppercase a string
	print(string.sorted()) // sort the letters of the string into an array

Properties and methods of Arrays

	var toys = ["Woody"]
	print(toys.count)
	toys.append("Buzz")
	toys.firstIndex(of: "Buzz")
	print(toys.sorted())
	toys.remove(at: 0)



day 9 ============================================================================================

Initializers

	// Initializers are special methods that provide different ways to create your struct. 
	struct User {
		var username: String

		init () {
			username = "Anonymous"
			print("Creating a new user!")
		}
	}
	var user = User()
	user.username = "twostraws"

Refering to the current instance

	/*
	Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used. 
	This self value is particularly useful when you create initializers that have the same parameter names as your property.
	For example, if you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, 
	self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.
	*/

	struct Person {
		var name: String

		init(name: String) {
			print("\(name) was born!")
			self.name = name //this is the name inside init
			// the self.name is the name on the beginning of the struct
		}
	}

Lazy properties

	struct FamilyTree {
    	init() {
			print("Creating family tree!")
		}
	}	
	//We might use that FamilyTree struct as a property inside a Person struct, like this:

	struct Person {
		var name: String
		var familyTree = FamilyTree()

		init(name: String) {
			self.name = name
		}
	}

	var ed = Person(name: "Ed")
//	But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, 
//	then Swift will only create the FamilyTree struct when it’s first accessed
	lazy var familyTree = FamilyTree()
//	So, if you want to see the “Creating family tree!” message, you need to access the property at least once:
	ed.familyTree

Static properties and methods

	/*
	All the properties and methods we’ve created so far have belonged to individual instances of structs, 
	which means that if we had a Student struct we could create several student instances each with their own properties and methods
	You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.
	*/
	struct Student {
		static var classSize = 0
		var name: String
		
		init(name: String) {
			self.name = name
			Student.classSize += 1
		}
	}
	//Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize:

	print(Student.classSize)


Access control

	//Access control lets you restrict which code can use properties and methods. 
	//This is important because you might want to stop people reading a property directly, for example.

	struct Person {
		private var id: String // Just use the private keyword and "let ed = Person(id: "12345")" won't work

		init(id: String) {
			self.id = id
		}
	}
//	Now only methods inside Person can read the id property. For example:

	struct Person {
		private var id: String

		init(id: String) {
			self.id = id
		}

		func identify() -> String {
			return "My social security number is \(id)"
		}
	}


Structs Summary

	// 1. You can create your own types using structures, which can have their own properties and methods.
	// 2. You can use stored properties or use computed properties to calculate values on the fly.
	// 3. If you want to change a property inside a method, you must mark it as mutating.
	// 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
	// 5. Use the self constant to refer to the current instance of a struct inside a method.
	// 6. The lazy keyword tells Swift to create properties only when they are first used.
	// 7. You can share properties and methods across all instances of a struct using the static keyword.
	// 8. Access control lets you restrict what code can use properties and methods.


day 10 ===========================================================================================

Classes

	/*
	Classes are similar to structs in that they allow you to create new types with properties and methods, 
	but they have five important differences and I’m going to walk you through each of those differences one at a time.
	The first difference between classes and structs is that classes never come with a memberwise initializer. 
	This means if you have properties in your class, you must always create your own initializer.
	*/
	class Dog {
		var name: String
		var breed: String

		init(name: String, breed: String) {
			self.name = name
			self.breed = breed
		}
	}
	//	Creating instances of that class looks just the same as if it were a struct:
	let poppy = Dog(name: "Poppy", breed: "Poodle")


Class inheritance

	// The second difference between classes and structs is that you can create a class based on an existing class – 
	//it inherits all the properties and methods of the original class, and can add its own on top.

	class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
	//	We could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default

	// However, we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new initializer that only needs a name property. 
	// Even better, we can make the Poodle initializer call the Dog initializer directly so that all the same setup happens:
	class Poodle: Dog {
		init(name: String) {
			super.init(name: name, breed: "Poodle")
		}
	}
	// For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.

Overriding methods

	class Dog {
		func makeNoise() {
			print("Woof!")
		}
	}

	class Poodle: Dog {
	}

	let poppy = Poodle()
	poppy.makeNoise()

	class Poodle: Dog {
		override func makeNoise() {
			print("Yip!")
		}
	}
	poppy.makeNoise()

Final classes
	/*
	Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.
	Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – 
	they need to use your class the way it was written.
	To make a class final just put the final keyword before it, like this:
	*/
	final class Dog {
		var name: String
		var breed: String
		
		init(name: String, breed: String) {
			self.name = name
			self.breed = breed
		}
	}

Copying objects

	// The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, 
	// both the original and the copy point to the same thing, so changing one does change the other.
	class Singer {
		var name = "Taylor Swift"
	}
	var singer = Singer()
	print(singer.name)

	var singerCopy = singer
	singerCopy.name = "Justin Bieber"

	print(singer.name1)

Deinitializers

//	The fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.

	class Person {
		var name = "John Doe"

		init() {
			print("\(name) is alive!")
		}

		func printGreeting() {
			print("Hello, I'm \(name)")
		}
		deinit {
			print("\(name) is no more!")
		}
	}
//We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed
	for _ in 1...3 {
		let person = Person()
		person.printGreeting()
	}

Mutability
	/*
	The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property,
	that property can’t be changed because the struct itself is constant.
	However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating 
	keyword with methods that change properties; that’s only needed with structs.
	This difference means you can change any variable property on a class even when the class is created as a constant – this is perfectly valid code
	*/
	class Singer {
		var name = "Taylor Swift"
	}

	let taylor = Singer()
	taylor.name = "Ed Sheeran"
	print(taylor.name)
	//	If you want to stop that from happening you need to make the property constant:
	class Singer {
		let name = "Taylor Swift"
	}

Summary

	/*
	1. Classes and structs are similar, in that they can both let you create your own types with properties and methods.
	2. One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
	3. You can mark a class with the final keyword, which stops other classes from inheriting from it.
	4. Method overriding lets a child class replace a method in its parent class with a new implementation.
	5. When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
	6. Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
	7. Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
	*/

	
day 11 ===========================================================================================

Protocols

	// Protocols are a way of describing what properties and methods something must have. 
	// You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.
	// For example, we can write a function that accepts something with an id property, but we don’t care precisely what type of data is used. 
	protocol Identifiable {
		var id: String { get set }
	}
	// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly.
	// But we can create a struct that conforms to it:
	struct User: Identifiable {
		var id: String
	}
	func displayID(thing: Identifiable) {
		print("My ID is \(thing.id)")
	}

Protocols inheritance

	//One protocol can inherit from another in a process known as protocol inheritance. 
	//Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.
	protocol Playable {
		func calculateWages() -> Int
	}
	protocol NeedsTraining {
		func study()
	}
	protocol HasVacation {
		func takeVacation(days: Int)
	}

	//We can now create a single Employee protocol that brings them together in one protocol. We don’t need to add anything on top, so we’ll just write open and close braces:
	protocol Employee: Payable, NeedsTraining, HasVacation { }

Extensions

	//Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.
		// For example, we could add an extension to the Int type so that it has a squared() method that returns the current number multiplied by itself:
	extension Int {
		func squared() -> Int {
			return self * self
		}
	}
	let number = 8
	number.squared()

	//Swift doesn’t let you add stored properties in extensions, so you must use computed properties instead. For example,
	extension Int {
		var isEven: Bool {
			return self % 2 == 0
		}
	}

Protocol extensions

	/*
	Protocols let you describe what methods something should have, but don’t provide the code inside. 
	Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.

	Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific 
	type like Int you extend a whole protocol so that all conforming types get your changes.
	*/

	let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
	let beatles = Set(["John", "Paul", "George", "Ringo"])

	//Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol 
	//to add a summarize() method to print the collection neatly

	extension Collection {
		func summarize() {
			print("There are \(count) of us:")

			for name in self {
				print(name)
			}
		}
	}
	//Both Array and Set will now have that method, so we can try it out:
	pythons.summarize()
	beatles.summarize()

Protocol-oriented programming

	// Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, 
	//and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.

	//First, here’s a protocol called Identifiable that requires any conforming type to have an id property and an identify() method:
	protocol Identifiable {
		var id: String { get set }
		func identify()
	}
	// We could make every conforming type write their own identify() method, but protocol extensions allow us to provide a default:
	extension Identifiable {
		func identify() {
			print("My ID is \(id).")
		}
	}
	// Now when we create a type that conforms to Identifiable it gets identify() automatically:
	struct User: Identifiable {
		var id: String
	}

	let twostraws = User(id: "twostraws")
	twostraws.identify()


Summary

	//1. Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
	//2. You can build protocols on top of other protocols, similar to classes.
	//3. Extensions let you add methods and computed properties to specific types such as Int.
	//4. Protocol extensions let you add methods and computed properties to protocols.
	//5. Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.


day 12 ===========================================================================================

Handling missing data

	//An optional integer might have a number like 0 or 40, but it might have no value at all – it might literally be missing, which is nil in Swift.
	var age: Int? = nil
	age = 38

Unwrapping optionals

	//A common way of unwrapping optionals is with if let syntax, which unwraps with a condition. 
	//If there was a value inside the optional then you can use it, but if there wasn’t the condition fails. 
	var name: String? = nil
	if let unwrapped = name {
		print("\(unwrapped.count) letters")
	} else {
		print("Missing name.")
	}

Unwrapping with guard

	//An alternative to if let is guard let, which also unwraps optionals. guard let will unwrap an optional for you, but if it finds nil inside it expects you to exit the function,
	// loop, or condition you used it in.
	//However, the major difference between if let and guard let is that your unwrapped optional remains usable after the guard code.
	func greet(_ name: String?) {
		guard let unwrapped = name else {
			print("You didn't provide a name!")
			return
		}

		print("Hello, \(unwrapped)!")
	}

	//Using guard let lets you deal with problems at the start of your functions, then exit immediately. 
	//This means the rest of your function is the happy path – the path your code takes if everything is correct.

Force unwrapping

	// Optionals represent data that may or may not be there, but sometimes you know for sure that a value isn’t nil. In these cases, 
	//Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type.
	let str = "5"
	let num = Int(str)

	let num = Int(str)! // You can use the '!' to force unwrapping the optional

	//if str was something that couldn’t be converted to an integer – your code will crash.


Implicitly unwrapped optionals

	// Implicitly unwrapped optionals are created by adding an exclamation mark after your type name, like this:

	let age: Int! = nil

	//Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals.
	// However, if you try to use them and they have no value – if they are nil – your code crashes.


Nil coalescing

	//The nil coalescing operator unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was nil – then a default value is used instead. 
	//Either way, the result won’t be optional: it will either by the value from inside the optional or the default value used as a back up.
	func username(for id: Int) -> String? {
		if id == 1 {
			return "Taylor Swift"
		} else {
			return nil
		}
	}

	//That will check the result that comes back from the username() function: if 
	//it’s a string then it will be unwrapped and placed into user, but if it has nil inside then “Anonymous” will be used instead.

	let user = username(for: 15) ?? "Anonymous"

Optional chaining

	// Swift provides us with a shortcut when using optionals: if you want to access something like a.b.c and b is optional, you can write a question mark after it to enable optional chaining: a.b?.c.
	//When that code is run, Swift will check whether b has a value, and if it’s nil the rest of the line will be ignored – Swift will
	// return nil immediately. But if it has a value, it will be unwrapped and execution will continue.
	let names = ["John", "Paul", "George", "Ringo"]
	let beatle = names.first?.uppercased() //  if first returns nil then Swift won’t try to uppercase it, and will set beatle to nil immediately.


Optional try

	//That runs a throwing function, using do, try, and catch to handle errors gracefully.
	enum PasswordError: Error {
		case obvious
	}

	func checkPassword(_ password: String) throws -> Bool {
		if password == "password" {
			throw PasswordError.obvious
		}

		return true
	}

	do {
		try checkPassword("password")
		print("That password is good!")
	} catch {
		print("You can't use that password.")
	}

	//The first is try?, and changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, 
	//otherwise you’ll get the return value wrapped as an optional.
	//Using try? we can run checkPassword() like this:
	if let result = try? checkPassword("password") {
		print("Result was \(result)")
	} else {
		print("D'oh.")
	}

	//The other alternative is try!, which you can use when you know for sure that the function will not fail.
	// If the function does throw an error, your code will crash.
	try! checkPassword("sekrit")
	print("OK!")



Failable initializers

	//You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong. 
	//The return value will then be an optional of your type, for you to unwrap however you want.
	struct Person {
		var id: String

		init?(id: String) {
			if id.count == 9 {
				self.id = id
			} else {
				return nil
			}
		}
	}

Typecasting

	class Animal { }
	class Fish: Animal { }

	class Dog: Animal {
		func makeNoise() {
			print("Woof!")
		}
	}
	let pets = [Fish(), Dog(), Fish(), Dog()]
	/*
	Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal.
	If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise().
	This uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise.
	*/
	for pet in pets {
		if let dog = pet as? Dog {
			dog.makeNoise()
		}
	}

Summary
/*
	1. Optionals let us represent the absence of a value in a clear and unambiguous way.
	2. Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
	3. You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
	4. Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
	5. You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
	6. Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
	7. You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
	8. If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
	9. You can use typecasting to convert one type of object to another.
*/

===========================================================================================
**review

	Variables and constants

		var name = "Molly Molenga"
		name = "Julieta"
		// If you use "let" you won't be change the value of the variable

	Types of data

		var name: String 
		name = "Time MacGraw"

		var age: Int //Integer number
		age = 25

		var latitude: Double
		latitude = 36.166667

		var longitude: Float
		longitude = -186.783

		var stayOutTooLate: Bool
		stayOutTooLate = true //or false

		var name: String = "Tim MacGraw"

	Operators

		var a = 1.1
		var b = 2.2
		var c = a + b

		//same for Strings

		var name1 = "Time MacGraw"	
		var name2 = "Romeo"
		var both = name1 + " and " + name2

	String Interpolation

		name = "Time MacGraw"
		"You name is \(name)"

	Arrays

		var evenNumbers = [2, 4, 6, 8]
		var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December"]
		// var songs: [Any] ... for multiples types of data
		// var songs = [any]()

		songs[0] // "Shake it Off",
		songs[1] // "You Belong with Me"
		songs[2] // "Back to December"
	
		type(of: songs)
		// Print: Array<String>.Type

	Dictionaries

		var person = ["first": "Taylor", "middle": "Alison", "last": "Swift"]
		//  or
		var person = [
			"first": "Taylor",
			"middle": "Alison",
			"last": "Swift",
			"month": "December",
			"website": "taylorswift.com"
			]

		person["middle"] // "Alison"

	Conditional

		var action: String
		var person = "hater"

		if person == "hater" {
			action = "hate"
		} else if person == "player" {
			action = "play"
		} else {
			action = "cruise"
		}

	Loops

		for i in 1...10 {
			print("\(i) x 10 is \(i * 10)")
		}

		var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

		for song in songs {
			print("My favorite song is \(song)")
		}

	Switch case

		let liveAlbums =2

		switch liveAlbums {
		case 0...1:
			print("You're just starting out")

		case 2...3:
			print("You just released iTunes Live From SoHo")

		case 4...5:
			print("You just released Speak Now World Tour")

		default: 
			print("Have you done something new?")

		}