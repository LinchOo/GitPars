//
//  RepositoryModel.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation

struct RepositoryModel : Decodable, Identifiable{
    
    var id: Int
    var name: String
    var description: String?
    
}
