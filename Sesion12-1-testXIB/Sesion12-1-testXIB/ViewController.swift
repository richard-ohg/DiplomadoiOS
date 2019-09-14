//
//  ViewController.swift
//  Sesion12-1-testXIB
//
//  Created by Ricardo Hernandez D4 on 9/14/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vistita: TestView!
    @IBOutlet weak var boxView: BoxView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vistita.titulo.text = "Ay papantla, tus hijos vuelan"
    }


    @IBAction func Clickeame(_ sender: UIButton) {
        
        var texto = boxView.CajaTexto.text
        vistita.titulo.text = texto
    }
}

