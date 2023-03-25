//
//  RepositoryCell.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct RepositoryCell: View {
    var repository: RepositoryModel
    
    var body: some View {
        VStack(alignment: .leading){
            
                Text("Repository name:  "+repository.name)
                if let description = repository.description
                {
                    Text("Description:  "+description)
                }
            
        }
    }
}
