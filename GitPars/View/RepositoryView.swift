//
//  RepositoryView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct RepositoryView: View {
    
    @StateObject var viewModel = RepositoryViewModel()
    var userName: String
    var body: some View {
        List{
            if !viewModel.repositoryArray.isEmpty{
                ForEach(viewModel.repositoryArray, id:\.id) { repository in
                    VStack(alignment: .leading){
                        RepositoryCell(repository: repository)
                    }
                    
                }
            }
            else {
                LazyVGrid(columns: repLayout, spacing: 20) {
                    ProgressView()
                    ProgressView()
                    ProgressView()
                    ProgressView()
                }
            }
        }
        .navigationTitle("Repositorys")
        .onAppear{
            viewModel.fetchUserRepositorys(userName: userName)
        }
    }
}
