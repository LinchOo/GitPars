//
//  FavoriteView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject private var viewModel: UsersViewModel
    @State var isFavorite = true
    
    @State var isShow = false
    
    
    var body: some View {
        VStack{
            Text("Favorit's")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            ScrollView(.vertical, showsIndicators: false) {
                if !viewModel.userEntityArray.isEmpty{
                    LazyVGrid(columns: layout, spacing: 35) {
                        ForEach(viewModel.userEntityArray, id:\.id) { user in
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
                    VStack(alignment: .center){
                        Text("Add some one to favorit's")
                            .font(.title)
                            .minimumScaleFactor(0.6)
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
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

//var body: some View {
//    VStack{
//        Text("Favorit's")
//            .font(.title)
//            .fontWeight(.bold)
//            .padding()
//        ScrollView(.vertical, showsIndicators: false) {
//            if !viewModel.userEntityArray.isEmpty{
//                LazyVGrid(columns: layout, spacing: 35) {
//                    ForEach(viewModel.userEntityArray, id:\.id) { user in
//                        VStack(spacing: 15){
//                            NavigationLink{
//                                RepositoryView(userName: user.login)
//                            }label: {
//                                UserCell(user: user)
//                            }
//                            Image(systemName: "star.fill")
//                                .foregroundColor(.yellow)
//                                .onTapGesture {
//                                    isFavorite.toggle()
//                                    viewModel.Favorite(user: user)
//                                }
//                                .neumorphismSelectedCircleStyle()
//
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
//            }
//            else {
//                VStack(alignment: .center){
//                    Text("Add some one to favorit's")
//                        .font(.title)
//                        .minimumScaleFactor(0.6)
//                        .fontWeight(.bold)
//                        .padding()
//
//                }
//                .frame(maxWidth: .infinity,maxHeight: .infinity)
//            }
//        }
//        .padding(.vertical)
//    }
//    .background(
//        Rectangle()
//            .fill(Color("Background"))
//            .frame(maxWidth: .infinity,maxHeight: .infinity)
//            .edgesIgnoringSafeArea(.all)
//    )
//}
//}
