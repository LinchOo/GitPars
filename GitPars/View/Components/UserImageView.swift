//
//  UserImageView.swift
//  GitPars
//
//  Created by Олег Коваленко on 24.03.2023.
//

import SwiftUI

struct UserImageView: View {
    @StateObject var viewModel: UserImageViewModel
    
    init(user: UserModel){
        _viewModel = StateObject(wrappedValue: UserImageViewModel(user: user))
    }
    
    var body: some View {
        ZStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if viewModel.isLoading{
                ProgressView()
            }else {
                Image(systemName: "questionmark")
                    
            }
        }
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView(user: dev)
    }
}
