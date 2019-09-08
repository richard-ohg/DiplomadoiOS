//
//  Producto.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernández González on 9/7/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

struct Producto{
    var nombre: String
    var precio: String
    var id: String
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
