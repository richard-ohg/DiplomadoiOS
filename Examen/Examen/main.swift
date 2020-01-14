//
//  main.swift
//  Examen
//
//  Created by Ricardo Hernández González on 29/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class MyApplication: UIApplication{
    
    override func sendEvent(_ event: UIEvent) {
        print("hola")
        print(event)
        super.sendEvent(event)
    }
}

UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass(AppDelegate.self))

