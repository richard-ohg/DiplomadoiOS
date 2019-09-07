//
//  LoginViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernandez D4 on 9/6/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isLoged()

    }
    
    @IBAction func aceptar(_ sender: UIButton) {
        guard let userEmail = email.text, userEmail != "", let userPass = password.text, userPass != "" else {
            return
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPass) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("usuario autenticado")
            
        }
    }
    
    func isLoged(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("Usuario no logeado")
            }else{
                print("Usuario logeado")
                print(Auth.auth().currentUser!)
                self.performSegue(withIdentifier: "listView", sender: self)
            }
        }
    }
    
}
