//
//  FavoriteView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject var viewModel: UsersViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !viewModel.usersArray.isEmpty{
                LazyVGrid(columns: layout, spacing: 35) {
                    ForEach(viewModel.usersArray.filter{ viewModel.savedItems.contains($0.id)}, id:\.id) { user in
                        VStack(spacing: 15){
                            NavigationLink{
                                RepositoryView(userName: user.login)
                            }label: {
                                UserCell(user: user)
                            }
                            Image(systemName: viewModel.contains(user) ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    viewModel.toggleFav(user: user)
                                }
                                .neumorphismSelectedCircleStyle()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("Background")))
                        .neumorphismUnSelectedStyle()
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(gradient, lineWidth: 2)
                                .opacity(viewModel.contains(user) ? 1 : 0)
                            
                        }
                        .animation(Animation.easeInOut(duration: 0.35), value: viewModel.contains(user))
                    }
                }
            }
            else {
                LazyVGrid(columns: layout, spacing: 20) {
                    ProgressView()
                    ProgressView()
                    ProgressView()
                    ProgressView()
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
