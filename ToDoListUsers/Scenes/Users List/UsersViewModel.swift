//
//  UsersViewModel.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit
import CoreData

protocol UpdateTableViewDelegate: NSObjectProtocol {
    func reloadData(sender: UsersViewModel)
}

class UsersViewModel: NSObject, NSFetchedResultsControllerDelegate {
    
    // MARK: - Properties
    
    var networkManager: NetworkManager!
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    private var fetchedResultsController: NSFetchedResultsController<UsersEntity>?
    weak var delegate: UpdateTableViewDelegate?


    // MARK: - Public Interfaces
    
    func numberOfRowsInSection (section: Int) -> Int {
        return fetchedResultsController?.sections?[section].numberOfObjects ?? 0
    }
       
    func object (indexPath: IndexPath) -> UsersEntity? {
        return fetchedResultsController?.object(at: indexPath)
    }
    
    // Changes have happened in fetchedResultsController so we need to notify the tableView
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Update the tableView
        self.delegate?.reloadData(sender: self)
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
    
    // MARK: - Local Helpers
    
    // Retrieve data from Core Data
    func retrieveDataFromCoreData() {
        
        if let context = self.container?.viewContext {
            let request: NSFetchRequest<UsersEntity> = UsersEntity.fetchRequest()
            
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
                            
            self.fetchedResultsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            
            // Notifies the tableView when any changes have occurred to the data
            fetchedResultsController?.delegate = self
            
            // Fetch data
            do {
                try self.fetchedResultsController?.performFetch()
            } catch {
                print("Failed to initialize FetchedResultsController: \(error)")
            }
        }
    }
}
