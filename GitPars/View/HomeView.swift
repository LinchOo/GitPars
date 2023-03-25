//
//  HomeView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject private var viewModel: UsersViewModel
    @State var isFavorite = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !viewModel.usersArray.isEmpty{
                LazyVGrid(columns: layout,spacing: 35) {
                    ForEach(viewModel.usersArray, id:\.id) { user in
                        if viewModel.userCoreDataService.savedEntitys.contains(where:{ userEntity in userEntity.userId == user.id }){
                            VStack(spacing: 15){
                                NavigationLink{
                                    RepositoryView(userName: user.login)
                                }label: {
                                    UserCell(user: user)
                                }
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .onTapGesture {
                                        isFavorite.toggle()
                                        viewModel.Favorite(user: user)
                                    }
                                    .neumorphismSelectedCircleStyle()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
                            .neumorphismUnSelectedStyle()
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(gradient, lineWidth: 2)
                                    .opacity(isFavorite ? 1 : 0)
                                
                            }
                            .animation(Animation.easeInOut(duration: 0.35), value: isFavorite)
                            
                        } else {
                            
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    isFavorite.toggle()
                                    viewModel.Favorite(user: user)
                                }
                                .neumorphismSelectedCircleStyle()
                        }
                    }
                }
            } else {
                
                LazyVGrid(columns: layout, spacing: 20) {
                    ProgressView()
                    ProgressView()
                    ProgressView()
                    ProgressView()
                }
                .onAppear{
                    print("\(viewModel.usersArray.count)")
                    
                }
            }
        }
        .background(
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
//
//struct HomeView: View {
//
//    @EnvironmentObject private var viewModel: UsersViewModel
//    @State var isFavorite = false
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            if !viewModel.usersArray.isEmpty{
//                LazyVGrid(columns: layout,spacing: 35) {
//                    ForEach(viewModel.usersArray, id:\.id) { user in
//                        VStack(spacing: 15){
//                            NavigationLink{
//                                RepositoryView(userName: user.login)
//                            }label: {
//                                UserCell(user: user)
//
//                            }
//                            if viewModel.userCoreDataService.savedEntitys.contains(where:{ userEntity in userEntity.userId == user.id }){
//
//                                Image(systemName: "star.fill")
//                                    .foregroundColor(.yellow)
//                                    .onTapGesture {
//                                        isFavorite.toggle()
//                                        viewModel.Favorite(user: user)
//                                    }
//                                    .neumorphismSelectedCircleStyle()
//                            } else {
//
//                                Image(systemName: "star")
//                                    .foregroundColor(.yellow)
//                                    .onTapGesture {
//                                        isFavorite.toggle()
//                                        viewModel.Favorite(user: user)
//                                    }
//                                    .neumorphismSelectedCircleStyle()
//                            }
//                        }
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
//                        .neumorphismUnSelectedStyle()
//                        .overlay {
//                            RoundedRectangle(cornerRadius: 25)
//                                .stroke(gradient, lineWidth: 2)
//                                .opacity(isFavorite ? 1 : 0)
//
//                        }
//                        .animation(Animation.easeInOut(duration: 0.35), value: isFavorite)
//                    }
//                }
//            }
//            else {
//                LazyVGrid(columns: layout, spacing: 20) {
//                    ProgressView()
//                    ProgressView()
//                    ProgressView()
//                    ProgressView()
//                }
//                .onAppear{
//                    print("\(viewModel.usersArray.count)")
//
//                }
//            }
//        }
//        .background(
//            Rectangle()
//                .fill(Color("Background"))
//                .frame(maxWidth: .infinity,maxHeight: .infinity)
//                .edgesIgnoringSafeArea(.all)
//        )
//    }
//}
//
