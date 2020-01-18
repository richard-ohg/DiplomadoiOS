import UIKit

func makeIntPair(x: Int, y: Int) -> (Int, Int) {
    return (x,y)
}

func makeStringPair(x: String, y: String) -> (String, String ) {
    return (x,y)
}

func makePair<Tipo>(x: Tipo, y: Tipo) -> (Tipo, Tipo) {
    return (x,y)
}

func makePair2<Tipo, Tipo2>(x: Tipo, y: Tipo2) -> (Tipo, Tipo2) {
    return (x,y)
}


makeIntPair(x: 2, y: 3)
makeStringPair(x: "sjini", y: "bbuewd")

var b = makePair(x: "hola", y: "Adios")
print(b.0)
makePair(x: 2, y: 8).1

//makePair(x: 2, y: "jaj").0
//makePair(x: "haje", y: 2)

print(makePair2(x: "hola", y: 4))
