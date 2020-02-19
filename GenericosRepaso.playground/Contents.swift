import UIKit

struct GenericStruct<T>{
    var property: T?
}

let explicitStruct = GenericStruct<String>()
let implicitStruct = GenericStruct(property: "Nic")

// ------------------------------------------------------

protocol NormalProtocol {
//    en un protocolo siempre debe ir el get o set, o solo get
    var property: String { get set }
}

class NormalClass: NormalProtocol{
    var property: String = "Nic"
}

protocol GenericProtocol{
//    Para combinar Genericos y Protocolos
    associatedtype myType
    var anyProperty: myType { get set }
}

// Marca error porque no puedes usar genericos en protocolos, en su lugar debes poner un tipo asociado
//protocol TestProtocol<T>{
//}

class SomeClass: GenericProtocol{
    var anyProperty = "Bob"
}

class OtherClass: GenericProtocol{
    typealias myType2 = String
    var anyProperty: myType2 = "Bob"
}

class OtherClass2: GenericProtocol{
    var anyProperty: String = "Nic"
}

class OtherClass3: GenericProtocol{
    var anyProperty: Int = 24
}

struct SomeStruct: GenericProtocol{
    var anyProperty = 1996
}


