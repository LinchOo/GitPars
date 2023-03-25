//
//  UserModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation

struct UserModel: Decodable, Identifiable {
    
    var id: Int
    var login: String
    var avatarUrl: String
    
}
