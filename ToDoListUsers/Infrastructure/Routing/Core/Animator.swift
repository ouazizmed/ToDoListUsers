//
//  Animator.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
