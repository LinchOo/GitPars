//
//  CoreDataService.swift
//  GitPars
//
//  Created by Олег Коваленко on 24.03.2023.
//

import Foundation
import CoreData

class CoreDataService {
    
    private let container: NSPersistentContainer
    private let containerName = "DataBase"
    private let entityName = "UsersEntity"
    
    @Published var savedEntitys: [UsersEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error.localizedDescription)")
            }
        }
        getUsersEntitys()
    }
    
    // MARK: Public Section
    
    func favorite(user: UserModel)
    {
        if let entity = savedEntitys.first(where: { $0.userId == user.id }){
            delete(entity: entity)
        } else{
            add(user: user)
        }
    }
    
    func getUsers(userEntitys: [UsersEntity]) -> [UserModel]{
        var users:[UserModel] = []
        for entity in userEntitys {
            users.append(UserModel(id: Int(entity.userId), login: entity.userlogin!, avatarUrl: entity.avatarUrl!))
        }
        return users
    }
    
    // MARK: Private Section
    
    private func getUsersEntitys() {
        let request = NSFetchRequest<UsersEntity>(entityName: entityName)
        do {
           savedEntitys = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Users Entitys. \(error.localizedDescription)")
        }
    }
    
    private func add(user: UserModel) {
        let entity = UsersEntity(context: container.viewContext)
        entity.userId = Int64(user.id)
        entity.userlogin = user.login
        entity.avatarUrl = user.avatarUrl
        entity.isFavorit = true
        
        applyChanges()
    }
    
    private func update(entity: UsersEntity, favorite: Bool) {
        applyChanges()
    }
    
    private func delete(entity: UsersEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do{
            try container.viewContext.save()
        } catch let error {
            print("Error saveing to Core Data. \(error.localizedDescription)")
        }
    }
    
    private func applyChanges() {
        save()
        getUsersEntitys()
    }
}
