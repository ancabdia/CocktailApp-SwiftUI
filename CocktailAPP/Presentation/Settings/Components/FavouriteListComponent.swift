//
//  ListComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct FavoriteListComponent: View {
    
    @ObservedObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        Section{
            NavigationStack{
                List(settingsViewModel.favCocktails){ cocktail in
                    NavigationLink{
                        CocktailDetailView(cocktail: cocktail)
                    } label: {
                        CocktailCellView(cocktail: cocktail)
                    }
                }.navigationBarTitle(Text("Favorite Cocktails"))
                    .refreshable {
                        settingsViewModel.getFavCocktail()
                    }
            }
        }
    }
}

struct FavoriteListComponent_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListComponent(settingsViewModel: SettingsViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
