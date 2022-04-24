//
//  Router.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

protocol Closable: AnyObject {
    func close()
}

protocol RouterProtocol: AnyObject {
    associatedtype V: UIViewController
    var viewController: V? { get }
    

    func open(_ viewController: UIViewController, transition: Transition)
}

class Router<U>: RouterProtocol, Closable where U: UIViewController {
    
    weak var viewController: U?
    var openTransition: Transition?
    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        openTransition.close(viewController)
    }
}
