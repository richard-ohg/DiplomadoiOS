import UIKit


func mifuncion() throws {}

do{ // Es como el bloque try
    try mifuncion() // Es como una marca para indicar que la función puede marcar un error, tiene que estar dentro de un bloque "do"
}catch{ // "error" ya viene implicito, es una variable que se declara cuando hay un error
    print(error)
}

enum MiError: Error{
    case Malo
    case Peor
    case MuchoPeor
}

func infalible(val: Int) -> String{
    return "Perfecto"
}

func falible(flag: Bool) throws -> String{
    if flag{
        throw MiError.Peor
    }
    return "Casi Perfecto"
}

do {
    defer{
        print("Saludos")
    }
    infalible(val: 2)
    try falible(flag: true)
    print("todo bien")
} catch MiError.Malo{
    print("Mal")
} catch MiError.Peor{
    print("Peor")
} catch MiError.MuchoPeor{
    print("Coooooooooooorran")
}
