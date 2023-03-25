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
    @State var isShow = false

    var body: some View {
        VStack{
            Text("Developers")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            ScrollView(.vertical, showsIndicators: false) {
                if !viewModel.usersArray.isEmpty{
                    LazyVGrid(columns: layout,spacing: 35) {
                        ForEach(viewModel.usersArray, id:\.id) { user in
                            if isShow{
                                UserCell(user: user)
                                    .transition(.opacity)
                            }
                        }
                    }
                    .onAppear{
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isShow = true
                        }
                       
                    }
                    .onDisappear{
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isShow = false
                        }
                    }
                    .padding(.vertical)
                }
                else {
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(1..<5, id: \.self){_ in
                            VStack{
                                ProgressView()
                                    .frame(minWidth: 120,minHeight: 200)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
                                    .neumorphismUnSelectedStyle()
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .padding(.vertical)
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
//{
//    VStack{
//        Text("Developers")
//            .font(.title)
//            .fontWeight(.bold)
//            .padding()
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
//                .padding(.vertical)
//
//            }
//            else {
//                LazyVGrid(columns: layout, spacing: 20) {
//                    ForEach(1..<5, id: \.self){_ in
//                        VStack{
//                            ProgressView()
//                                .frame(minWidth: 120,minHeight: 200)
//                                .padding()
//                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
//                                .neumorphismUnSelectedStyle()
//                        }
//                    }
//                }
//                .padding(.vertical)
//            }
//        }
//    }
//    .background(
//        Rectangle()
//            .fill(Color("Background"))
//            .frame(maxWidth: .infinity,maxHeight: .infinity)
//            .edgesIgnoringSafeArea(.all)
//    )
//}
