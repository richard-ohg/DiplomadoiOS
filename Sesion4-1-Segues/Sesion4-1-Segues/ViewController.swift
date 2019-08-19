//
//  ViewController.swift
//  Sesion4-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/17/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var datoVistaPrincipal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Refresca la vista cada que se vuelve a mostrar la vista
    override func viewWillAppear(_ animated: Bool) {
        print(datoVistaPrincipal)
    }
    
    
    @IBAction func unsegueSegundaVista(segue: UIStoryboardSegue){
        
    }

    // Siempre se ejecuta antes de mostrar la siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segundaVista = segue.destination as! SecondViewController
        segundaVista.dato = "dato enviado desde primera vista"
    }

}

