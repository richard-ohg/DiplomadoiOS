//
//  ViewController.swift
//  Sesion13-1-InterfProgram
//
//  Created by Ricardo Hernandez D4 on 9/20/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

//    let boton = UIButton() // Es igual a lo de abajo
    let boton: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.setTitle("click please", for: .normal)
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        btn.backgroundColor = .red
        btn.tintColor = .black
        
//    Una forma de ponerle tamaño y posicion
//        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
//        Habilitar constraint
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let label: UILabel = {
        let lab = UILabel()
        
        lab.text = "Etiqueta"
        lab.textAlignment = .center
        lab.backgroundColor = .black
        lab.textColor = .white
        lab.font = UIFont(name: "marker felt", size: 20.0)
        
//        Habilitar constraint
        lab.translatesAutoresizingMaskIntoConstraints = false
        
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        view.addSubview(boton)
        view.addSubview(label)
        
//    Contraints del boton
//        boton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        boton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        boton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        boton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        boton.widthAnchor.constraint(equalToConstant: 144.0).isActive = true
//        boton.heightAnchor.constraint(equalToConstant: 144.0).isActive = true
        
//        Constraint para poner el boton
        
        boton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        boton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        boton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
//        Constraint del label
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: boton.bottomAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    @objc func clicked(){
        print("click, click")
    }


}

