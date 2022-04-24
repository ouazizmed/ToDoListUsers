//
//  UIApplication+Extension.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

extension UIApplication {
    
    func setRoot() {
        
        // Set root ViewController
        let rootViewController = RootBuilder.viewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = navigationController
        sceneDelegate.window?.makeKeyAndVisible()
    }
}
