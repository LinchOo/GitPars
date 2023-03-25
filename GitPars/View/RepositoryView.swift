//
//  RepositoryView.swift
//  GitPars
//
//  Created by Олег Коваленко on 21.03.2023.
//

import SwiftUI

struct RepositoryView: View {
    
    //@StateObject var viewModel = RepositoryViewModel()
    @EnvironmentObject private var viewModel: UsersViewModel
    @State var userName: String
    

    var body: some View {
        List{
            if !viewModel.userRepository.isEmpty{
                ForEach(viewModel.userRepository, id:\.id) { repository in
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
            viewModel.addRepositorySubscriber(userName: userName)
        }
    }
}
