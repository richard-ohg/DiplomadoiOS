//
//  ThirdViewController.swift
//  Sesion6-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/24/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func login(_ sender: UIButton){
        let defaults = UserDefaults.standard
        
        if let user = usuario.text, let pass = password.text{
            if user == "ok" && pass == "ok"{
                defaults.set(true, forKey: "statusUser")
                dismiss(animated: true, completion: nil)
            }else{
               muestraError()
                usuario.text = ""
                password.text = ""
            }
        }
    }
    
    func muestraError(){
        let alert = UIAlertController(title: "Error", message: "Usuario o pwd incorrecto", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: false)
    }
    
    @IBAction func cancel(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    

}
