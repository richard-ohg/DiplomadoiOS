//
//  AddAlumnoView.swift
//  Sesion13-1-InterfProgram
//
//  Created by Ricardo Hernandez D4 on 9/21/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class AddAlumnoView: UIViewController{
    
    let textField1: UITextField = {
        let tf1 = UITextField()
        
//        Habilitar constraint
        tf1.translatesAutoresizingMaskIntoConstraints = false
        
        tf1.placeholder = "foo"
//        tf1.textColor = .white
        tf1.backgroundColor = .cyan
        tf1.textAlignment = .center
        
        return tf1
    }()
    
    let textField2: UITextField = {
        let tf2 = UITextField()
        
        //        Habilitar constraint
        tf2.translatesAutoresizingMaskIntoConstraints = false
        
        tf2.placeholder = "bar"
        tf2.backgroundColor = .cyan
//        tf2.textColor = .white
        tf2.textAlignment = .center
        
        return tf2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.backgroundColor = .white
        
        navigationItem.title = "Agregar Alumno"
        
//        Botones en navigation bar
        
//        En este caso tenemos que hacer el popViewController
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .done, target: self, action: #selector(save))
        
//        Boton de back, hace automaticamente el popViewController
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "atras", style: .plain, target: self, action: #selector(cancel))
        navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        
//        Constraints for first Text Field
        textField1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textField1.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
//        Constraints for second Text Field
        textField2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20).isActive = true
        textField2.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
    }
    
    @objc func cancel(){
        print("cancelar")
//        navigationController?.popViewController(animated: true)
    }
    
    @objc func save(){
        print("guardar")
        
        print("Texto 1: \(textField1.text!)")
        print("Texto 2: \(textField2.text!)")
        
    }
    
}
