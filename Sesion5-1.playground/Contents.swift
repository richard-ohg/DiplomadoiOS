import UIKit

// Closures

var myClosure: (Int, Int) -> Int

myClosure = { (a: Int, b: Int) -> Int in
        return a + b
}

let result = myClosure(3,4)
print(result)

// Lo podemos acortar por inferencia
myClosure = { (a, b) in a+b }
myClosure(5,6)

myClosure = { $0 + $1 }
myClosure(7,8)

func operacion(a: Int, b: Int, funcion: (Int, Int) -> Int) -> Int{
    let resultado = funcion(a, b)
    return resultado
}

operacion(a: 6, b: 7, funcion: myClosure)

//----------------------------

var contador = 0

// como 'incrementa' es una variable y este tiene alcance de todo el playground, el closure tendrá el alcance de todo el playground, por lo tanto puede alcanzar la variable 'contador'
let incrementa = {
    contador += 1
}

incrementa()
incrementa()
incrementa()
print(contador)

let nombres = ["Pawis", "Sofia", "Alex", "Jorge"]

nombres.sorted()
// sorteamos como nosotros queramos mediante un closure
nombres.sorted{
    $0.count > $1.count
}

let numeros = [1, 2, 3, 4, 5]

numeros.forEach{
    print("\($0): \($0 * $0)")
}

let filtro = numeros.filter{
    return $0 > 2
}

print(filtro)


