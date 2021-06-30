//
//  UserDatabase.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

import Foundation
import CoreData

final class UserDatabase {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserModel")
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

extension UserDatabase: AuthDB {
    func saveToken(userToken: UserToken) {
        let userTokenEntity = UserTokenEntity()
        userTokenEntity.accessToken = userToken.accessToken
        userTokenEntity.email = userToken.email
        userTokenEntity.loggedIn = userToken.loggedIn

        do {
            try context.save()
        } catch let error {
            print("Error when saving token: \(error.localizedDescription)")
        }
    }

    func getToken() -> UserTokenEntity? {
        let request: NSFetchRequest = UserTokenEntity.fetchRequest()

        guard let token = try? context.fetch(request).first else {
            print("There is no token in database")
            return nil
        }

        return token
    }

    func saveUser(user: User) {
        let userEntity = UserEntity()
        userEntity.id = user.id
        userEntity.name = user.name

        do {
            try context.save()
        } catch let error {
            print("Error when saving user: \(error.localizedDescription)")
        }
    }
}
