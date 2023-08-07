//
//  RootView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct RootView: View {
    // MARK: - Properties
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch (rootViewModel.status) {
            
        case Status.none:
            SplashView()
            
        case Status.loading:
            ProgressView()
            
        case Status.error(error: let errorString):
            Text("Error \(errorString)")
            
        case Status.loaded:
            let homeViewModel = HomeViewModel(repository: rootViewModel.repository)
            let cocktailViewModel = CocktailListViewModel(repository: rootViewModel.repository)
            TabView {
                HomeView(homeViewModel: homeViewModel).tabItem {
                    Label("RandomCocktail", systemImage: "wand.and.stars")
                }
                
                CocktailList(cocktailViewModel: cocktailViewModel).tabItem{
                    Label("Cocktails", systemImage: "book")
                }
            }
            
        case Status.cocktailDetail(let cocktail):
            CocktailDetailView(cocktail: cocktail)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation())))
    }
}

