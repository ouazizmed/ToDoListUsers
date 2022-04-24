//
//  UsersRoute.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

protocol UsersRoute {
    
    var usersTransition: Transition { get }

    func openUsers()
}

extension UsersRoute where Self: RouterProtocol {
    
    var usersTransition: Transition {
        return PushTransition()
    }
    
    func openUsers() {
        
        let router = UsersRouter()
        let viewModel = UsersViewModel(router: router)
        let viewController = UsersViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = usersTransition
        
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
