import UIKit

protocol Eventotype{
    var titulo: String{get set}
    var id: Int {get}
    func creaNotificacionLocal()
}

class EventoClass: Eventotype{
    var titulo: String = ""
    var id: Int = 0
    func creaNotificacionLocal() {
        //Algo aqui
    }
}

struct EventoStruct: Eventotype{
    var titulo: String = ""
    var id: Int = 0
    func creaNotificacionLocal() {
        // Algo aqui
    }
}

let evento = EventoClass()
let evento2 = EventoStruct()


class Calendario{
    var delegate: Eventotype = EventoStruct()
}

let ejemplo = Calendario()
ejemplo.delegate = EventoClass()
