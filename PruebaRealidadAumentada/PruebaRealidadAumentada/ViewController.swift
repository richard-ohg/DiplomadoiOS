//
//  ViewController.swift
//  PruebaRealidadAumentada
//
//  Created by Ricardo Hernández González on 26/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
//    Vista (Scene) de ARKIT, generara un rectangulo para acceso a la camara
    var sceneView = ARSCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
    var shipNode: SCNNode?
    
    var crosshair = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Scene de SceneKIt, para meter todos los modelos
        let scene = SCNScene()
        sceneView.scene = scene
        
        self.view  = sceneView
        sceneView.center = self.view.center
        
//        Opciones para cuando que se muestre en pantalla
        sceneView.debugOptions = [.showFeaturePoints,.showWorldOrigin,.showBoundingBoxes]
        
//        Necesitamos configuracion para ARKIT
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        
//        Delegamos funciones
        sceneView.delegate = self
        
//        Ejecutamos las configuraciones
        sceneView.session.run(config)
        
        let forwardButton = UIButton()
        forwardButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        forwardButton.setTitle("🔼", for: .normal)
        self.view.addSubview(forwardButton)
        
        forwardButton.addTarget(self, action: #selector(moveShip), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        crosshair.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        crosshair.layer.cornerRadius = 10
        
        crosshair.center = self.view.center
        self.view.addSubview(crosshair)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async { [unowned self] in
            if let hit = self.sceneView.hitTest(self.view.center, options: nil).first{
                guard let nodeName = hit.node.name else { return }
                print(nodeName)
                self.crosshair.backgroundColor = UIColor.green.withAlphaComponent(0.3)
            }else{
                self.crosshair.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            }
            
        }
    }
    
    
//    Conforme va detectando cosas, va generando anchor (es una medida para posicionar)
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        Tenemos distintos tipos de Anchors
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        print("Detecte un anchor")
        
//        Generamos geometria
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        
        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.y)
        let height = CGFloat(planeAnchor.extent.z)
        
//      Generamos plano con color rojo
        let plane = SCNPlane(width: width, height: height)
//        let plane = SCNPlane()
        plane.materials.first?.diffuse.contents = UIColor.red.withAlphaComponent(0.7)
        
//        Generamos el nodo con la geometriaa del plano
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
//        Cargo la escena y saco el avion
        let shipscene = SCNScene(named: "ship.scn")!
        shipNode = shipscene.rootNode.childNodes[0]
        
//        Lo agregamos a la scena
        sceneView.scene.rootNode.addChildNode(shipNode!)
        
//        Sacamos las coordenadas del avion
        let xShip = CGFloat(planeAnchor.transform.columns.3.x)
        let yShip = CGFloat(planeAnchor.transform.columns.3.y)
        let zShip = CGFloat(planeAnchor.transform.columns.3.z)
        
        shipNode?.position = SCNVector3(xShip,yShip,zShip)
        
        shipNode?.scale = SCNVector3(0.1, 0.1, 0.1)
        
        node.addChildNode(planeNode)
        
        let newConfig = ARWorldTrackingConfiguration()
        sceneView.session.run(newConfig)
    }

    @objc func moveShip(){
        if let ship = shipNode{
            let actualPosition = ship.position
            let newPosition = SCNVector3(actualPosition.x, actualPosition.y, actualPosition.z + 0.02)
            ship.position = newPosition
        }
    }
    
}

