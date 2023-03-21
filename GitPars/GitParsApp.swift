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

@main
struct GitParsApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabBarView()
        }
    }
}
