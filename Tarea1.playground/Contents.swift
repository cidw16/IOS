import UIKit

func createArrayWithContent (string: String, number:Int) {
    for n in 1...number {
        print(string)
    }
}

func printDifferentNumbers (number:Int) {
    for n in 1...number {
        if n % 2 == 0 {
            print(String(n) + " es par")
        }
        else {
            print (String(n) + " es impar")
        }
    }
}

func searchTheLongestString (stringOne: String, stringTwo: String) {
    if stringOne.count > stringTwo.count {
        print (stringOne)
    } else {
        print (stringTwo)
    }
}

func isPerfectSquare (number: Double) -> Bool {
    let x: Int = Int(Double.squareRoot(number)())
    let y: Double = Double(x * x)
        
    return y == number
}

func isFibonacci (number: Int) {
    if isPerfectSquare(number: Double (5 * number * number + 4)) || isPerfectSquare(number: Double (5 * number * number - 4)) {
        print ("Is Fibonacci")
    } else {
        print ("Is not Fibonacci")
    }
}

createArrayWithContent(string: "dog", number: 4)

printDifferentNumbers(number: 3)

searchTheLongestString(stringOne: "Dog", stringTwo: "Hello")

isFibonacci(number: 5)
isFibonacci(number: 6)

