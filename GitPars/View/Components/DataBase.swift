//
//  DataBase.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import Foundation

final class DataBase {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}

