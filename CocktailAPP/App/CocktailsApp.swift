//
//  CocktailAPPApp.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

@main
struct CocktailsApp: App {
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteCocktailDataSourceImplemententation()
            let localDataSource = LocalDataSourceImplemententation()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
            
        }
    }
}
