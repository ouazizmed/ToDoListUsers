//
//  RootViewModel.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import Foundation

class RootViewModel {

    // MARK: - Properties

    var router: RootRouter.Routes?

    // MARK: - Init

    init(router: RootRouter.Routes) {
        self.router = router
    }
    
    // MARK: - Routing
    
    func openUsers(){
        router?.openUsers()
    }
    
}

