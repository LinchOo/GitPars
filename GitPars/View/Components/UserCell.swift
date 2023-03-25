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

    var body: some View {
        VStack(spacing: 15){
            if let user = self.user{
                Text(user.login)
                    .foregroundColor(colorScheme == .dark ? .white  : .black )
                    .bold()
                UserImageView(user: user)
                    .frame(width: 125,height: 125)
            } else {
                
            }
        }
        .cornerRadius(20)
    }
}
