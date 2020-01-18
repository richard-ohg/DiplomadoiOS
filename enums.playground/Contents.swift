import UIKit


enum Dia{
    case Lunes
    case Martes
    case Miercoles
    case Jueves
    case Viernes
}

var diaSemana: Dia

//-----------------------------------------------------------

enum EstadoDocumento: Int{ // Cada enum tiene un valor en crudo y podemos especificarlo
    case Recibido = 0, Validado, EnProceso, Publicado
}

//struct Test: RawRepresentable{
//    typealias RawValue = String
//    var id: Int
//}
//
//enum State: Test{
//    typealias RawValue = <#type#>
//
//    case uno
//    case dos
//    case tres
//}

let valorEstado = EstadoDocumento.Validado.rawValue
let estado = EstadoDocumento(rawValue: 5)

//let foo = State.tres.rawValue


//-------------------------------------------------------

enum ResultadoWebService{
    case Exito(String)
    case Error(Int)
    case Error2
}

func llamadaWS(flag: Bool) -> ResultadoWebService{
    if flag {
        return ResultadoWebService.Exito("Mi contenido")
    }else{
        return ResultadoWebService.Error2
    }
}

let resultado: ResultadoWebService = llamadaWS(flag: false)

switch resultado{
    case let .Exito(contenido):
        print(contenido)
    case let .Error(codigo):
        print("El código de error es \(codigo)")
case .Error2:
    print("foo")
}
