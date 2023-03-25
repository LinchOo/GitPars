//
//  HomeViewModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    
    @Published var usersArray: [UserModel] = []
    @Published var usersEntity: [UserModel] = []
    @Published var userEntityArray: [UserModel] = []
    @Published var userRepository: [RepositoryModel] = []
    
    let userCoreDataService = CoreDataService()
    private let dataService = DataService()
    private var userCancellables = Set<AnyCancellable>()
    private var repositoryCancellables = Set<AnyCancellable>()
    private var entityrepositoryCancellables = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$usersArray
            .sink {[weak self] (returnUsers) in
                self?.usersArray = returnUsers
            }
            .store(in: &userCancellables)
        
        $usersEntity
            .combineLatest(userCoreDataService.$savedEntitys)
            .map{ userModels, usersEntitys -> [UserModel] in
                self.userCoreDataService.getUsers(userEntitys: usersEntitys)
            }
            .sink { [weak self] returnedUsers in
                self?.userEntityArray = returnedUsers
            }
            .store(in: &entityrepositoryCancellables)

    }
    
    func addRepositorySubscriber(userName: String) {
        dataService.GetRepositorys(login: userName)
        dataService.$userRepository
            .sink {[weak self] (returnedRepository) in
                self?.userRepository = returnedRepository
            }
            .store(in: &repositoryCancellables)
    }
    
    func Favorite(user: UserModel) {
        userCoreDataService.favorite(user: user)
    }
}
