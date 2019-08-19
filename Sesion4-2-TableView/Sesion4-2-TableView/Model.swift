//
//  Model.swift
//  Sesion4-2-TableView
//
//  Created by Ricardo Hernandez D4 on 8/17/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

struct Producto{
    var id: Int
    var nombre: String
    var precio: Double
    
}

struct Carrito{
    var producto: [Producto]
}
