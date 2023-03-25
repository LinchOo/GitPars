//
//  GitParsApp.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

let screen  = UIScreen.main.bounds
let repLayout = [GridItem(.fixed(screen.width - 100))]
let layout = [GridItem(.adaptive(minimum: screen.width / 3 , maximum: screen.width / 2))]
var gradient: LinearGradient {
    LinearGradient(colors: [Color("GradientTop"), Color("GradientBottom")], startPoint: .bottom, endPoint: .top)
}
var dev = UserModel(id: 113, login: "Linch", avatarUrl: "https://media.licdn.com/dms/image/D4E03AQEexlucw4P-5A/profile-displayphoto-shrink_800_800/0/1676283816261?e=1684972800&v=beta&t=aw72SRXohc0H3kIrVF1GrauOch365-nB31K8OdztuNQ")

@main
struct GitParsApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainTabBarView()
        }
    }
}
