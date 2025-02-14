//
//  DesignExtension.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Lightshadow"), radius: 5, x: -5, y: -5)
            .shadow(color: Color("Darkshadow"), radius: 5, x: 5, y: 5)
    }
}
struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Lightshadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("Darkshadow"), radius: 5, x: -5, y: -5)
    }
}
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .background(Circle().fill(Color("Background")))
            .shadow(color: Color("Lightshadow"), radius: 2, x: -2, y: -2)
            .shadow(color: Color("Darkshadow"), radius: 5, x: 5, y: 5)
            //.neumorphismUnSelectedStyle()
    }
}

extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    func neumorphismSelectedCircleStyle() -> some View {
            modifier(NeumorphismUnSelectedCircle())
        
    }
    
}
