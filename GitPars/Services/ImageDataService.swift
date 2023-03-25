//
//  ImageDataService.swift
//  GitPars
//
//  Created by Олег Коваленко on 24.03.2023.
//

import Foundation
import SwiftUI
import Combine

class ImageDataService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let user: UserModel
    private let fileManager = LocalFileManager.shared
    private let folderName = "users_images"
    private let imageName: String
    
    init(user: UserModel){
        self.user = user
        self.imageName = user.login
        getUserImage()
    }
    
    private func getUserImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            
            // Take from FileManager
            image = savedImage
        } else {
            
            // Download Image
            downloadUserImage()
        }
    }
    
    private func downloadUserImage(){
        guard let url = URL(string: user.avatarUrl) else { return }
        
        imageSubscription = NetWorkManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetWorkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return}
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
