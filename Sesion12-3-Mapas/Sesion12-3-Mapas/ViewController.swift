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
    
    @IBOutlet weak var mapa: MKMapView!
    
    var manager = CLLocationManager()
    var latitud: CLLocationDegrees!
    var longitud: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Creamos instancia
//        manager = CLLocationManager()
        
//        Para permiso de gps
        manager.requestWhenInUseAuthorization()
        
//        Para ver que tan preciso se quiere
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
//        Cada cuanto voy a recibir actualizaciones (cada que te mueves)
//        manager.distanceFilter = 10
        manager.distanceFilter = kCLDistanceFilterNone // Para que no haya medida para que se este actualizando
        
//        En Project -> Capabilities -> Background Modes -> Location Updates
//        Para que se actualice en background
        manager.allowsBackgroundLocationUpdates = true
        
        manager.delegate = self
        manager.startUpdatingLocation()
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        print(latitud, longitud)
//
//        let localization = CLLocationCoordinate2DMake(self.latitud, self.longitud)
//        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        let region = MKCoordinateRegion(center: localization, span: span)
//
//        mapa.setRegion(region, animated: true)
//        mapa.showsUserLocation = true
//        mapa.mapType = .hybrid
//    }

    @IBAction func getCoords(_ sender: UIButton) {
        print(latitud, longitud)
        
        let localization = CLLocationCoordinate2DMake(latitud, longitud)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: localization, span: span)
        
        mapa.setRegion(region, animated: true)
        mapa.showsUserLocation = true
        mapa.mapType = .hybrid
    }
}



extension ViewController: CLLocationManagerDelegate{
//    Cada actualizacion se ejecuta este metodo
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
//        let newLocation = locations.last!
        if let location = locations.first{
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }
}

