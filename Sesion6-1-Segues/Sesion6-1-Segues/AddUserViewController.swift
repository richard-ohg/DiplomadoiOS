//
//  addUserViewController.swift
//  Sesion6-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/24/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var viewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func addUser(_ sender: UIButton) {
        if let correo = email.text, let usuario = user.text, let pass = password.text{
            var nuevoUsuario = User(email: correo, user: usuario, password: pass)
            viewController.users.append(nuevoUsuario)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
