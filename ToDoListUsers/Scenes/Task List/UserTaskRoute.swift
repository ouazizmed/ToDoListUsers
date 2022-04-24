//
//  UserTaskRoute.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

protocol UserTasksRoute {
    
    var userTasksTransition: Transition { get }

    func openUserTasks(id_user: Int)
}

extension UserTasksRoute where Self: RouterProtocol {
    
    var userTasksTransition: Transition {
        return PushTransition()
    }
    
    func openUserTasks(id_user: Int) {
        
        let router = UserTasksRouter()
        let viewModel = UserTasksViewModel(router: router, id_user: id_user)
        let viewController = UserTasksViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = userTasksTransition
        
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
