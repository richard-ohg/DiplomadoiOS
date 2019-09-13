import UIKit

// Genericos
// Una funcion que recibe e imprime cadenas

func printString(str: String){
    print(str)
}

let greeting = "hello"
printString(str: greeting)

let anotherGreeting: Any = "hola"
printString(str: anotherGreeting)
