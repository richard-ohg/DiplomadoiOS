//
//  EditViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernández González on 9/7/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import FirebaseFirestore

class EditViewController: UIViewController {

    @IBOutlet weak var producto: UITextField!
    @IBOutlet weak var precio: UITextField!
    
    var datosProducto: Producto!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        //Looks for single or multiple taps.
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
//        view.addGestureRecognizer(tap)
        
        let id = datosProducto.id
        
        getRef = Firestore.firestore()

        ref = getRef.collection("productos").document(id)
        
        producto.text = datosProducto.nombre
        precio.text = datosProducto.precio
    }
    
//    @objc func dismissKeyboard() {
//        //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        view.endEditing(true)
//    }
    
    @IBAction func aceptar(_ sender: UIButton) {
        
        let values: [String: Any] = ["nombre": producto.text, "precio": precio.text]
        
        ref.setData(values) { (error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Datos actualizados")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
