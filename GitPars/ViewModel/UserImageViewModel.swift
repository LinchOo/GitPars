//
//  UserImageViewModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 24.03.2023.
//

import Foundation
import SwiftUI
import Combine

class UserImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let user: UserModel
    private let dataService: ImageDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(user: UserModel){
        self.user = user
        self.dataService = ImageDataService(user: user)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
