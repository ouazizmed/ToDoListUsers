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
//        fetchUsers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    // MARK: - Init
    
    static func instantiate(viewModel: UsersViewModel) -> UsersViewController {
        let viewController = UsersViewController(nibName: String(describing: self), bundle: nil)
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Local Helpers
    
    private func setupTableView() {
        
        // Register Cell
        tableView.register(UINib(nibName: UserCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UserCell.reuseIdentifier)
                
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        viewModel.retrieveDataFromCoreData()
    }
    
    // Update the tableView if changes have been made
    func reloadData(sender: UsersViewModel) {
        self.tableView.reloadData()
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id_user = self.viewModel.object(indexPath: indexPath)?.id
        if let id_user = id_user {
            self.viewModel.openUserTasks(id_user: Int(id_user))
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureUserCell(at: indexPath)
    }
    
    private func configureUserCell( at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier, for: indexPath) as? UserCell else { return UITableViewCell() }
        let object = viewModel.object(indexPath: indexPath)
        if let user = object {
            cell.configure(users: user)
        }
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        cell.selectionStyle = .none

        return cell
    }
}
