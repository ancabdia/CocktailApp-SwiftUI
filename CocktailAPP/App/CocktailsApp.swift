//
//  CocktailAPPApp.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

@main
struct CocktailsApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteCocktailDataSourceImplemententation()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
            
        }
    }
}
