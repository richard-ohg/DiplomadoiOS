//
//  TestView.swift
//  Sesion12-1-testXIB
//
//  Created by Ricardo Hernandez D4 on 9/14/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet var containerView: UIView!
    
    @IBInspectable var colorcito: UIColor = .red
    @IBInspectable var cualquierCosa: String = "hola mundo"
    
//    Constructores
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inicio()
    }
    
    // Constructor falible, puede cargar como no puede cargar
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inicio()
    }
    
    private func inicio(){
//          Hace un auto cargado
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
//          Cuando el componente se cargue en memoria, se pone en la vista que lo mando a llamar
        addSubview(containerView)
//        Tamaño dependendiendo de donde aparezca
        containerView.frame = self.bounds
//          Para ajustarse dependiendo del tamaño que queremos
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
        
        
    }
    
    
    
}
