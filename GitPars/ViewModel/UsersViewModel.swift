//
//  HomeViewModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation

class UsersViewModel: ObservableObject {
    static let shared = UsersViewModel()
    @Published var usersArray = [UserModel]()
    @Published var showingFavs = true
    @Published var savedItems: Set<Int> = [1,3]
    
    var filteredItems: [UserModel] {
        if showingFavs {
            return usersArray.filter { savedItems.contains($0.id)}
        } else {
            return usersArray
        }
    }
    private var db = DataBase()
    
    init() {
        self.savedItems = db.load()
    }
    
    func sortFavs() {
            showingFavs.toggle()
    }
    func contains(_ user: UserModel) -> Bool {
        savedItems.contains(user.id)
    }
    func toggleFav(user: UserModel) {
        if contains(user) {
            savedItems.remove(user.id)
        } else {
            savedItems.insert(user.id)
        }
        db.save(items: savedItems
        )
    }
    
    func fetchUsers(){
        let usersUrlString = "https://api.github.com/users"
        if let url = URL(string: usersUrlString){
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                        // Error
                    } else {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data, let users = try? decoder.decode([UserModel].self, from: data){
                            self.usersArray = users
                            
                        } else {
                            // Error
                        }
                    }
                }
            }.resume()
        }
    }
}
