//
//  SceneDelegate.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Init the window
        self.window = UIWindow(windowScene: windowScene)
               
        // Set Root View Controller
        UIApplication.shared.setRoot()
    }
}

