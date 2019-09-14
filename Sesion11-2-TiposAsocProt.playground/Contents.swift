import UIKit

class ViewModel{
    func something(){
        print("Algo")
    }
}

protocol ViewModelContainer{
    associatedtype VM: ViewModel
    var viewModel: VM { get set }
    
    mutating func set(viewModel vm: VM)
}

//class CualSea: ViewModelContainer{
//    typealias VM   // Aqui es donde va el generico
//
//}
