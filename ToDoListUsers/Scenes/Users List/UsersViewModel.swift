//
//  UsersViewModel.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

class UsersViewModel {
    
    // MARK: - Properties
    
    var networkManager: NetworkManager!
    var users: [Users]?

    // MARK: - Public Interfaces
    
    var rowCount: Int {
        users?.count ?? 0
    }
    
    func usersItem(index: Int) -> Users? {
        users?[index]
    }
    
    // MARK: - Routing
    
    private var router: UsersRouter.Routes?
    
    // MARK: - Init
    
    init(router: UsersRouter.Routes) {
        self.router = router
        networkManager = NetworkManager()
  }
    
    // MARK: - Routing
    
    func openUserTasks(id_user: Int){
        router?.openUserTasks(id_user: id_user)
    }
    
}

extension UsersViewModel {
    
    func getUser(completion: @escaping (_ isSucces: Bool?,_ error: String?)->()){
        networkManager.getUser(){ (users , error) in
            self.users = users
            completion(error?.count ?? 0 > 0 ? false : true, error)
        }
    }
}
