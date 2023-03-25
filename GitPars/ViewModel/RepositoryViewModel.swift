////
////  RepositoryViewModel.swift
////  GitPars
////
////  Created by Олег Коваленко on 21.03.2023.
////
//
//import Foundation
//
//
//class RepositoryViewModel: ObservableObject {
//    static let shared = UsersViewModel()
//    @Published var repositoryArray = [RepositoryModel]()
//    
//    func fetchUserRepositorys(userName: String) {
//        
//        let usersUrlString = "https://api.github.com/users/"+userName+"/repos"
//        if let url = URL(string: usersUrlString){
//            
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                
//                DispatchQueue.main.async {
//                    if let error = error {
//                        print(error.localizedDescription)
//                        // Error
//                    } else {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        
//                        if let data = data, let repository = try? decoder.decode([RepositoryModel].self, from: data){
//                            self.repositoryArray = repository
//                            
//                        } else {
//                            // Error
//                        }
//                    }
//                }
//            }.resume()
//        }
//    }
//}
