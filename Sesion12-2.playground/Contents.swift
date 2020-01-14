import UIKit

// Extensiones

extension String{
    func getFirstChar() -> Character? {
        guard self.count > 0 else {return nil}
        return self[startIndex]
    }
}

var miCadena = "hola mundo"
print(miCadena.getFirstChar()!)

// --------------------

protocol Saltable{
    func saltar()
}

struct Jugador: Saltable{
    func saltar(){
        print("jugador saltando")
    }
}

extension Saltable{
    func dummy(){
        print("dummy")
    }
}

var elBruno = Jugador()
elBruno.dummy()
