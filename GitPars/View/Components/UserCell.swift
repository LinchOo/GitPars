//
//  UserCell.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct UserCell: View {
    @Environment(\.colorScheme) var colorScheme
    var user: UserModel
    var imgUrl: URL {
        URL(string: user.avatarUrl)!
    }
    
    var body: some View {
        VStack(spacing: 15){
            Text(user.login)
                .foregroundColor(colorScheme == .dark ? .white  : .black )
                .bold()
            AsyncImage(url: URL(string: user.avatarUrl)) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    ProgressView()
                }
            }
            .frame(width: 125,height: 125)
        }
        .cornerRadius(20)
    }
}
