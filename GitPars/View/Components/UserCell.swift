//
//  UserCell.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct UserCell: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var viewModel: UsersViewModel
    @State var isFavorit = false
//    @State var isShow = false
    
    var user: UserModel
    
    var body: some View {
        VStack(spacing: 15){
//            if isShow{
                VStack{
                    
                    Text(user.login)
                        .foregroundColor(colorScheme == .dark ? .white  : .black )
                        .bold()
                    NavigationLink{
                        RepositoryView(userName: user.login)
                    } label: {
                        UserImageView(user: user)
                            .frame(width: 125,height: 125)
                            .cornerRadius(20)
                    }
                    
                    Image(systemName: isFavorit ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            withAnimation {
                                isFavorit.toggle()
                                viewModel.Favorite(user: user)
                            }
                        }
                        .neumorphismSelectedCircleStyle()
                }
                
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
        .neumorphismUnSelectedStyle()
        .overlay {
            RoundedRectangle(cornerRadius: 25)
                .stroke(gradient, lineWidth: 2)
                .opacity(isFavorit ? 1 : 0)
            
        }
        .onAppear{
            isFavorit = viewModel.userCoreDataService.cheker(user: user)
//            withAnimation(.easeIn(duration: 0.3)){
//                isShow = true
//            }
            
        }
//        .onDisappear{
//            isShow = false
//        }
    }
    //    var body: some View {
    //        VStack(spacing: 15){
    //            if let user = self.user{
    //                Text(user.login)
    //                    .foregroundColor(colorScheme == .dark ? .white  : .black )
    //                    .bold()
    //                UserImageView(user: user)
    //                    .frame(width: 125,height: 125)
    //            } else {
    //
    //            }
    //        }
    //        .cornerRadius(20)
    //    }
}
