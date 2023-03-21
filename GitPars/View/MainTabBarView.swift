//
//  ContentView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct MainTabBarView: View {
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        TabView{
            NavigationView{
               HomeView(viewModel: viewModel)
            }
            .tabItem {
                VStack{
                    Image(systemName: "homekit")
                    Text("Home")
                }
            }
            NavigationView{
                FavoriteView(viewModel: viewModel)
            }
            .tabItem {
                VStack{
                    Image(systemName: "star.square")
                    Text("Favorites")
                }
            }
            .badge(viewModel.savedItems.count)
        }
        .onAppear{
            viewModel.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
