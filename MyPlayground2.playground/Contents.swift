import UIKit


// Modelar un carrito de compras

/*
Producto
    Precio
    id
    nombre

Carrito

Caja
 
*/

class Alumno{
    var numCuenta: String
    var nombre: String
    
    init(numCuenta: String, nombre: String) {
        self.numCuenta = numCuenta
        self.nombre = nombre
    }
    
    func leer(){
        print("Estoy leyendo")
    }
}

class Ingeniero: Alumno{
    
    var carreraIngenieria: String
    func ecuacionesDiferenciales(){
        print("Ecuaciones diferenciales")
    }
    
    init(cI: String, numCuenta: String, nombre: String) {
        self.carreraIngenieria = cI
        super.init(numCuenta: numCuenta, nombre: nombre)
    }
    
    override func leer(){
        print("Leer como ingeniero")
    }
}

let sofia = Ingeniero(cI: "Industrial", numCuenta: "313058220", nombre: "Sofia")


protocol CursoExterno{
    func ecDif()
}

class Derecho: Alumno, CursoExterno{
    func ecDif(){
        print("Abogado educandose por primera vez")
    }
}

let armin = Derecho(numCuenta: "0000000", nombre: "Armin")
armin.ecDif()

var alumnos = [sofia, armin]

for alumno in alumnos {
    alumno.leer()
}

//----------------------------------- 17/08

protocol Saltar{
    func salta()
}

protocol Sanar{
    func sana()
}

class Jugador: Saltar{
    func salta() {
        print("jugador salta")
    }
}

class Guerrero: Jugador{
    
}

class Mago: Jugador, Sanar{
    func sana() {
        print("Mago sanador")
    }
    
    override func salta() {
        print("Los magos no saltan")
    }
}

var oz = Mago()
var aquiles = Guerrero()

func hazloSaltar(saltador: Saltar){
    saltador.salta()
}

func hazloSanar(sanador: Sanar){
    sanador.sana()
}


hazloSaltar(saltador: oz)
hazloSaltar(saltador: aquiles)
hazloSanar(sanador: oz)
