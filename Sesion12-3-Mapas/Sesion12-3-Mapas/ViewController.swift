//
//  ViewController.swift
//  Sesion12-3-Mapas
//
//  Created by Ricardo Hernandez D4 on 9/14/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import CoreLocation     // Para obtener datos del dispositivo movil
import MapKit           // Para mapas

class ViewController: UIViewController {

    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Creamos instancia
        locationManager = CLLocationManager()
        
//        Para permiso de gps
        locationManager.requestWhenInUseAuthorization()
        
//        Para ver que tan preciso se quiere
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
//        Cada cuanto voy a recibir actualizaciones (cada que te mueves)
        locationManager.distanceFilter = 1000
//        locationManager.distanceFilter = kCLDistanceFilterNone // Para que no haya medida para que se este actualizando
        
//        En Project -> Capabilities -> Background Modes -> Location Updates
//        Para que se actualice en background
        locationManager.allowsBackgroundLocationUpdates = true
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }

}

extension ViewController: CLLocationManagerDelegate{
//    Cada actualizacion se ejecuta este metodo
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}

