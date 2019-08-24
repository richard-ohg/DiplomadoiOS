//
//  ViewController.swift
//  ClaseButton
//
//  Created by Germán Santos Jaimes on 3/13/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botonTemblorin: Boton!
    
    let botoncito: BotonProg = {
        let b = BotonProg()
        b.setTitle("click please pleas please", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(clickon), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(botoncito)
        
        botoncito.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        botoncito.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }


    @IBAction func click(_ sender: Boton) {
        sender.shake()
        
    }
    
    @objc func clickon(){
        botonTemblorin.shake()
    }
}

