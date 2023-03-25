//
//  ContentView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct MainTabBarView: View {
    
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        TabView{
            NavigationView{
               HomeView()
            }
            .tabItem {
                VStack{
                    Image(systemName: "homekit")
                    Text("Home")
                }
            }
            NavigationView{
                FavoriteView()
            }
            .tabItem {
                VStack{
                    Image(systemName: "star.square")
                    Text("Favorites")
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
