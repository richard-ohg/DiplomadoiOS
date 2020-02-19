import UIKit

func addTwoNumbers(number1: Int, number2: Int) -> Int{
    return number1 + number2
}

var storedFunc = addTwoNumbers

storedFunc(3,4)

var storedClosure: (Int, Int) -> Int = { (number1, number2) in
    return number1 + number2
}

// Otras 2 formas de lograr lo anterior
var storedClosure2: (Int, Int) -> Int = { $0 + $1}
// Swift 5.1 -> si solo es una expresion, no es necesario poner el return
var storedClosure3: (Int, Int) -> Int = { return $0 + $1}

storedClosure(3,4)
storedClosure2(3,4)
storedClosure3(3,4)


// ---------------------------------------------------

func insertSomething(closure: () -> String){
    closure()
}

func returnHwlloWorld() -> String{
    return "Hello World"
}

func returnHwlloWorld2(int: Int) -> String{
    return "Hello World"
}

insertSomething(closure: returnHwlloWorld)
//insertSomething(closure: returnHwlloWorld2) // Marca error porque solo se puede usar funciones que no reciban parámetros

var closureHelloWorld: () -> String = { return "Hello" }

insertSomething(closure: closureHelloWorld)
insertSomething(closure: { "Hello World" })


