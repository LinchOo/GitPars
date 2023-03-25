//
//  DataService.swift
//  GitPars
//
//  Created by Олег Коваленко on 23.03.2023.
//

import Foundation
import Combine


class DataService {
    
    @Published var usersArray: [UserModel] = []
    @Published var userRepository: [RepositoryModel] = []
    
    var userSubscription: AnyCancellable?
    var repositorySubscription: AnyCancellable?
    let decoder = JSONDecoder()
    
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        GetUsers()
    }
    
    private func GetUsers() {
        guard let url = URL(string: "https://api.github.com/users") else { return }
        userSubscription = NetWorkManager.download(url: url)
            .decode(type: [UserModel].self, decoder: decoder)
            .sink(receiveCompletion: NetWorkManager.handleCompletion, receiveValue: { [weak self] (returnedUsers) in
                self?.usersArray = returnedUsers
                self?.userSubscription?.cancel()
            })
    }
    
    func GetRepositorys(login: String) {
        guard let url = URL(string: "https://api.github.com/users/"+login+"/repos") else { return }
        repositorySubscription = NetWorkManager.download(url: url)
            .decode(type: [RepositoryModel].self, decoder: decoder)
            .sink(receiveCompletion: NetWorkManager.handleCompletion, receiveValue: { [weak self] (returnedUsers) in
                self?.userRepository = returnedUsers
                self?.userSubscription?.cancel()
            })
    }
}

