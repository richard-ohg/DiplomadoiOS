import UIKit

var saludo = "Hola Mundo"

saludo = "Adios Mundo"

var edadSofia = 19

var nombre: String = "Jose"

let costo: Int = 34
let promedio = 3.4 // Por defecto es Double
type(of: promedio)

edadSofia += 1
edadSofia -= 1
edadSofia /= 1
edadSofia *= 1

var name: String = "Sofia"
name.count

print(name)
print("hola")

// interpolacion
print("Mi nombre es \(name) y tengo \(edadSofia)")
var enunciado = "Mi nombre es \(name) y tengo \(edadSofia)"

print(UInt8.max)
print(Int.max)

// Tipos de formas de expresar

var decimal = 123
var octal = 0o77
var hex = 0x1234
var binary = 0b10101

var v = -1_123 //Para mejor lectura
var vv = 1_123_123

var a = 1.23e2 // Exponente
var b = 1.23e-1
var c = 12
var d = a + Double(c)

var backslash = "\\"
print(backslash)
//print("\\")

var 🐶 = 5

//Enumerations

enum DiasDeLaSemana{
    case Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo
}

enum DiasOtraForma: Int8{
    case Lunes = 10 // Por defecto empieza en 0
    case Martes
    case Miercoles
    case Jueves
    case Viernes
    case Sabado
    case Domingo
}

// Como acceder a las enumeraciones
var dia = DiasDeLaSemana.Domingo
dia = .Martes // se cambia automaticamente accediendo a un valor

var otroDia = DiasOtraForma.Lunes.rawValue  // se accede al valor de la enumeracion
print(otroDia)

enum Cadenas: String{
    case SUCCESS = "Exito"
    case WARNING = "Advertencia"
    case ERROR = "la regaste"
}

print(Cadenas.SUCCESS.rawValue)

enum Status{
    case Ok
    case ERROR(String)
}

let status = Status.Ok
let failed = Status.ERROR("Esto no funciona")

print(failed)
print(status.self)


// ----------------------------------------------------------------------------

// Para sentencias de control puede o no llevar paréntesis
// If - else

var edad = 20

if edad == 20 {
    print("Cumple la edad")
}else{
    print("No cumple")
}

if edad > 20{
    print("Es mayor")
}else if edad == 20{
    print("Cumple la edad")
}else{
    print("Es menor de edad")
}

let resultado = edad > 20 ? "Es mayor" : "Es menor"
print(resultado)

// For

print("")
for i in 0..<10 { // Rango de valores, si quieres que sea inclusivo son 3 puntos
    print(i)
}

print("")
for i in stride(from: 10, through: 0, by: -2){ // throught es inclusivo
    print(i)
}

print("")
for i in stride(from: 10, to: 0, by: -2) { // to es exclusivo
    print(i)
}

print("")
let cadenas = ["A", "B", "C"]

for letra in cadenas{
    print(letra)
}

//------------------------------------------------

// while

var i = 10
while i > 0{
    print(i)
    i -= 1
}

var j = 10
repeat{
    print(j)
    j -= 1
}while j > 0

// Switch and case

let valor = 30

switch valor {
case 2,3,5,7,11,17,19:
    print("Es un primo")
case 20...30:
    print("Ignoro si sea primo")
default:
    print("Pues quien sabe")
}

//----------------------------------

// Funciones

func sumar(_ x: Int, mas y: Int) -> (suma: Int, multiplicacion: Int){ // "_" ocultar etiqueta, "mas" le estan poniendo un alias a la etiqueta
    print("Sumando \(x) + \(y) = \(x+y)")
    return (x + y, x*y)
}

let result = sumar(3,mas:5)


//tuplas

let tupla1: (Int, String, Int) = (3, "4", 5) // Por defecto tiene indices enteros
let tupla2: (x: Int, y: String, z:Int) = (3, "4", 5) // Podemos especificar los indices

tupla1.1
tupla2.z


var age = 20

func incrementarEdad(edad: inout Int){ // inout para recibir la referencia de una variable y asì poderla modificar
    edad += 1
}

incrementarEdad(edad: &age)
print(age)

//-------------------------------------------------

func estudia(){
    
}

func estudia(horas: Int){
    print("Estudiando")
}

func estudia(materia: String){
    print("Estudiando la materia \(materia)")
}

//------------------------------------------

//Optionals
var nombre2: String? = nil
//nombre2 = "Gerardo"

print(nombre2)
//print(nombre2!) //Desenvolvimiento forzado, cuando estas seguro que tiene un valor

//Optional binding
if let respaldo = nombre2 {
    print("Si hay un nombre \(respaldo)")
}else{
    print("No hay nombre")
}

//nil coalecente

let nombreEjecutivo = nombre ?? "pepito" // si tiene un valor nombre, se le asigna, de lo contrario se le asigna "pepito"
print(nombreEjecutivo)

//guard binding -> solo se utiliza en funciones

func valida(cadena: String?){
    guard let nombre = cadena else{
        print("no llego nada")
        return
    }
    print("Si llego algo \(nombre)")
}

valida(cadena: nombre2)

//----------------------------------------------

//struct es por valor y class por referencia

struct Alumno{
    var nombre: String
    var edad: Int
    
    func estudiar(horas: Int){
        print("Estudia \(horas)")
    }
    
    mutating func cambiaEdad(edad: Int){ // mutating para poder cambiar los atributos dentro de la estructura
        self.edad = edad + 1
    }
}

var pedro = Alumno(nombre: "Pedro", edad: 20)

pedro.nombre = "Pedrito"

var otroPedro = pedro
otroPedro.nombre = "Peter"
print(pedro.nombre)

pedro.estudiar(horas: 4)
pedro.cambiaEdad(edad: 19)
print(pedro.edad)


class Profesor{
    var nombre: String
    var edad: Int
    
    init(nombre: String, edad: Int) { // Es necesario declarar un constructor en clases, en estructuras no
        self.nombre = nombre
        self.edad = edad
    }
}

let luis = Profesor(nombre: "Luis", edad: 20)
let sofia = luis
sofia.nombre = "Sofia"

print(luis.nombre)






