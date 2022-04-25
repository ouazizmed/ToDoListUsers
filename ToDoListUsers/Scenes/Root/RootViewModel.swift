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
    var networkManager: NetworkManager!

    // MARK: - Init

    init(router: RootRouter.Routes) {
        self.router = router
        networkManager = NetworkManager()
    }
    
    // MARK: - Routing
    
    func openUsers(){
        router?.openUsers()
    }
}

extension RootViewModel {
    func getUser(completion: @escaping (_ isSucces: Bool?,_ error: String?)->()){
        networkManager.getUser(){ (users , error) in
            if let users = users {
                CoreDataUsers.sharedInstance.saveDataOf(users: users)
            }
            completion(error?.count ?? 0 > 0 ? false : true, error)
        }
    }
}

