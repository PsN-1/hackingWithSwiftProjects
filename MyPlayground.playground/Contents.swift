import UIKit

var str = "Hello, playground"

let number: String? = "5"
let result = number.flatMap{Int($0)}
print(result)
