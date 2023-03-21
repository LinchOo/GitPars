//
//  UserModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation

struct UserModel: Decodable {
    
    var id: Int
    var login: String
    var avatarUrl: String
    
}
