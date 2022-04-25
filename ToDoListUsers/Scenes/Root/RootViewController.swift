//
//  RootViewController.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

class RootViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private var viewModel: RootViewModel?
    
    // MARK: - Init
    
    static func instantiate(router: RootRouter.Routes) -> RootViewController {
        
        let viewController = RootViewController(nibName: String(describing: self), bundle: nil)
        viewController.viewModel = RootViewModel(router: router)
        
        return viewController
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel?.openUsers()
        }
    }
    
    private func fetchUsers(){
        viewModel?.getUser(completion: { success, error in
            if let success = success {
                if success {
            
                }
            }
        })
    }

}

