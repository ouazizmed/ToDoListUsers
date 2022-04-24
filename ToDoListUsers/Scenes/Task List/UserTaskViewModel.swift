//
//  UserTaskViewModel.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import Foundation

class UserTasksViewModel {
    
    // MARK: - Properties
    
    var networkManager: NetworkManager!
    var id_user: Int
    var userTasks: [Tasks]?
    
    // MARK: - Public Interfaces
    
    var rowCount: Int {
        userTasks?.count ?? 0
    }
    
    func userTasksItem(index: Int) -> Tasks? {
        userTasks?[index]
    }
    
    // MARK: - Routing
    
    private var router: UserTasksRouter.Routes?
    
    // MARK: - Init
    
    init(router: UserTasksRouter.Routes, id_user: Int) {
        self.router = router
        self.id_user = id_user
        networkManager = NetworkManager()
  }
    
    // MARK: - Routing
    
}

extension UserTasksViewModel {
    
    func getTask(id_user: Int, completion:  @escaping (_ isSucces: Bool?,_ error: String?)->()){
        networkManager.getTask(id_user: id_user){ (task, error) in
            self.userTasks = task
            completion(error?.count ?? 0 > 0 ? false : true, error)
        }
    }
}
