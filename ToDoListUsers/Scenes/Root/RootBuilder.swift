//
//  RootBuilder.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import Foundation
import UIKit

final class RootBuilder {
    
    static func viewController() -> UIViewController {
            let router = RootRouter()
            let viewController = RootViewController.instantiate(router: router)
            router.viewController = viewController
            return viewController
    }
}
