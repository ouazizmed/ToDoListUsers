//
//  UsersViewController.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: - Proprties
    
    private var viewModel: UsersViewModel!
    
    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUsers()
    }
    
    // MARK: - Init
    
    static func instantiate(viewModel: UsersViewModel) -> UsersViewController {
        let viewController = UsersViewController(nibName: String(describing: self), bundle: nil)
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Local Helpers
    
    private func setupTableView() {
        
        // Register Cells
        tableView.register(UINib(nibName: UserCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UserCell.reuseIdentifier)
                
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchUsers(){
        viewModel?.getUser(completion: { success, error in
            if let success = success {
                if success {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        })
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id_user = self.viewModel.users?[indexPath.row].id
        if let id_user = id_user {
            self.viewModel.openUserTasks(id_user: id_user)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureUserCell(at: indexPath)
    }
    
    private func configureUserCell( at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier, for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let user = viewModel?.usersItem(index: indexPath.row)

        cell.configure(users: user)
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }
}
