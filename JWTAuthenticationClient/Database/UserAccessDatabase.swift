//
//  UserAccessDatabase.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

import Foundation
import CoreData

final class UserAccessDatabase {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserToken")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension UserAccessDatabase: AuthDB {
    func saveToken(userToken: UserToken) {
        let userTokenEntity = UserTokenEntity()
        userTokenEntity.accessToken = userToken.accessToken
        userTokenEntity.email = userToken.email
        userTokenEntity.loggedIn = userToken.loggedIn

        do {
            try context.save()
        } catch let error {
            print("Error when saving token: \(error)")
        }
    }
}
