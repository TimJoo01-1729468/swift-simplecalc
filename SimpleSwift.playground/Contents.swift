import Foundation

print("Welcome to the UW Calculator Playground")

// initial calculate function for an array of String
func calculate(_ arg: [String]) -> Int {
    var str = ""
    for char in arg { // Converting from Array to a String.
        let newChar = char + " "
        str += newChar
    }
    return calculate(str) // Calling back the calculate function with a string to do all the work there.
}

// Final caclulate function that does all the work with going through each character in each string
// to calculate the values in the given way as requested by the user.
func calculate(_ arg: String) -> Int {
    var value = 0
    if arg.contains("+") { // checking for addition
        for char in arg {
            if let validNumber = Int(String(char)) {
                value += validNumber
            }
        }
    } else if arg.contains("-") { // checking for subtraction
        for char in arg {
            if let validNumber = Int(String(char)) {
                value -= validNumber
            }
        }
        if value < 0 {
            value = 0
        }
    } else if arg.contains("/") { // checking for division
        var firstNumber = 1
        for char in arg {
            if let validNumber = Int(String(char)) {
                if validNumber == Int(String(arg.prefix(1))) {
                    firstNumber = validNumber
                }
                value = validNumber
            }
        }
        value = firstNumber / value
    } else if arg.contains("*") { // checking for multiplication
        value = 1
        for char in arg {
            if let validNumber = Int(String(char)) {
                value *= validNumber
            }
        }
    } else if arg.contains("%") { // checking for modulo
        var firstNumber = 1
        for char in arg {
            if let validNumber = Int(String(char)) {
                if validNumber == Int(String(arg.prefix(1))) {
                    firstNumber = validNumber
                }
                value = validNumber
            }
        }
        value = firstNumber % value
    } else if arg.contains("count") { // checking for count
        for char in arg {
            if Int(String(char)) != nil {
                value += 1
            }
        }
    } else if arg.contains("avg") { // checking for average
        var count = 0
        for char in arg {
            if let validNumber = Int(String(char)) {
                value += validNumber
                count += 1
            }
        }
        if count > 0 {
            value = value / count
        } else {
            value = 0
        }
    } else if arg.contains("fact") { // checking for the factorial
        value = 1
        var newNum = 0
        var numCount = 0
        for char in arg {
            if let validNumber = Int(String(char)) {
                newNum = validNumber
                numCount += 1
            }
        }
        if numCount == 0 {
            value = 0
        } else if newNum > 0 {
            for n in 1...newNum {
                value = value * n
            }
        }
    }
    return value // giving the final value from the if statements
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0
calculate(["4", "%", "3"]) == 1 // added one more modulo to double check my work.

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
