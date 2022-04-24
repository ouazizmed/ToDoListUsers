//
//  UserTasksViewController.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

class UserTasksViewController: UIViewController {

    // MARK: - Proprties
    
    private var viewModel: UserTasksViewModel!
    
    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUserTasks()
    }
    
    // MARK: - Init
    
    static func instantiate(viewModel: UserTasksViewModel) -> UserTasksViewController {
        let viewController = UserTasksViewController(nibName: String(describing: self), bundle: nil)
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Local Helpers
    
    private func setupTableView() {
        
        // Register Cells
        tableView.register(UINib(nibName: UserTasksCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UserTasksCell.reuseIdentifier)
                
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchUserTasks(){
        let id_user = viewModel.id_user
        viewModel?.getTask(id_user: id_user, completion: { success, error in
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

extension UserTasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configueCell(at: indexPath)
    }
    
    private func configueCell(at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTasksCell.reuseIdentifier, for: indexPath) as? UserTasksCell else { return UITableViewCell() }
        let userTasks = viewModel?.userTasksItem(index: indexPath.row)

        cell.configure(userTasks: userTasks)
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        cell.selectionStyle = .none

        return cell
    }
    
}
