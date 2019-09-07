//
//  ViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernandez D4 on 9/6/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func aceptar(_ sender: UIButton) {
        guard let userEmail = email.text, userEmail != "", let userPass = password.text, userPass != "" else {
            return
        }
        
        Auth.auth().createUser(withEmail: userEmail, password: userPass){
            (user, error) in
            
            if let error = error{
                print(error.localizedDescription) // para saber si es error de la aplicacion o de firebase
                return
            }
            print(user?.user.email)
            print("Hola pinche cachonda")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

