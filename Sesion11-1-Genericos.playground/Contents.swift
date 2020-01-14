import UIKit

// Genericos
// Una funcion que recibe e imprime cadenas

//func printString(str: String){
//    print(str)
//}
//
//let greeting = "hello"
//printString(str: greeting)
//
// Marca error porque necesita un String y le estamos pasando un Any
//let anotherGreeting: Any = "hola"
//printString(str: anotherGreeting)


func printSome<Type>(item: Type){
    print(item)
}

let myInteger = 1
let myString = "foo"

printSome(item: myString)
printSome(item: myInteger)

print("😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂")

// Stack Generico

struct Stack<Type>{
    var list: Array<Type> = []
    
    init(items: Type...) {
        self.list = items
    }
    
    mutating func push(items: Type...){
        self.list += items
    }
    
    mutating func pop() -> Type? {
//        guard list.count > 0 else {return nil}
//        return list.removeLast()
         return (list.count > 0) ? list.removeLast() : nil
    }
    
    func prints(){
        for x in list {
            print(x)
        }
    }
}

var stack1 = Stack<String>()
var stack2 = Stack<Int>()
var stack3 = Stack<Array<Int>>()
//var stack3 = Stack<[Int]>()   // otra forma

stack1.push(items: "foo", "bar", "fizz")
stack2.push(items: 1, 2, 3, 4, 6)
stack3.push(items: [5,6], [7,8])

//stack1.prints()
//print("😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂")
//stack2.prints()
//print("😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂")
//stack3.prints()

// Vaciar stack
while true{
    if let dato = stack1.pop(){
        print(dato)
    }else{
        print("El stack esta vacio")
        break
    }
}



// Programación funcional

let array1: [String?] = ["hola", "hi", nil, "adios", "bye"]

let resultArray = array1.map { str in
    return "\(str ?? "")"
}

print(resultArray)

let resultArray2 = array1.filter { str in
    return str != nil
}

print(resultArray2)


// Restricciones genericas

//struct Pair<T, U>{
//    let key: T
//    let value: U
//}

//let p1 = Pair(key: "hello", value: 1)


// Se restringe a

struct Pair<T: Equatable, U: Equatable>: Equatable{
    var key: T
    var value: U
    
    init(key: T, value: U) {
        self.key = key
        self.value = value
    }
    
    static func == (lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}

let p1 = Pair(key: "cadena", value: 1)
let p2 = Pair(key: "cadena", value: 1)

p1 == p2









