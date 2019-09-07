//
//  AddViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernandez D4 on 9/6/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices
import FirebaseFirestore

class AddViewController: UIViewController {

    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var producto: UITextField!
    var ref: DocumentReference!
    var getRef: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRef = Firestore.firestore()
    }
    

    @IBAction func agregar(_ sender: UIButton) {
        var datos: [String: Any] = ["nombre": producto.text, "precio": precio.text]
        ref = getRef.collection("productos").addDocument(data: datos, completion: { (error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Se guardaron los datos")
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
