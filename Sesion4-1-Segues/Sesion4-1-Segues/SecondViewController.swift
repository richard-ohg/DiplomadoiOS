//
//  SecondViewController.swift
//  Sesion4-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/17/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var dato: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Dato recibido: \(dato)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let primeraVista = segue.destination as! ViewController
        primeraVista.datoVistaPrincipal = "Dato enviado desde segunda vista"
    }
    

}
