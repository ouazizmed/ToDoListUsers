//
//  Transition.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

protocol Transition: class {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
