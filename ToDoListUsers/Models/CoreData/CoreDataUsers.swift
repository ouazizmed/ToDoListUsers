//
//  CoreData.swift
//  ToDoListUsers
//
//  Created by Mac on 24/04/2022.
//

import UIKit
import CoreData

class CoreDataUsers {
    
    static let sharedInstance = CoreDataUsers()
    private init(){}
    
    private let continer: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private let fetchRequest = NSFetchRequest<UsersEntity>(entityName: "UsersEntity")
    
    func saveDataOf(users:[Users]) {
        
        // Updates CoreData with the new data from the server - Off the main thread
        self.continer?.performBackgroundTask{ [weak self] (context) in
            self?.deleteObjectsfromCoreData(context: context)
            self?.saveDataToCoreData(users: users, context: context)
        }
    }
    
    // MARK: - Delete Core Data objects before saving new data
    private func deleteObjectsfromCoreData(context: NSManagedObjectContext) {
        do {
            // Fetch Data
            let objects = try context.fetch(fetchRequest)
            
            // Delete Data
            _ = objects.map({context.delete($0)})
            
            // Save Data
            try context.save()
        } catch {
            print("Deleting Error: \(error)")
        }
    }
    
    // MARK: - Save new data from the server to Core Data
    private func saveDataToCoreData(users:[Users], context: NSManagedObjectContext) {
        // perform - Make sure that this code of block will be executed on the proper Queue
        // In this case this code should be perform off the main Queue
        context.perform {
            for user in users {
                let userEntity = UsersEntity(context: context)
                userEntity.id = Int16(user.id)
                userEntity.name = user.name
                userEntity.email = user.email
                userEntity.username = user.username
                
            }
            // Save Data
            do {
                try context.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
}
