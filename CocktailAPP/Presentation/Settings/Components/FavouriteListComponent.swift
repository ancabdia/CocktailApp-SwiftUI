//
//  ListComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct FavouriteListComponent: View {
    
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
                }.navigationBarTitle(Text("Favourite Cocktails"))
                    .refreshable {
                        settingsViewModel.getFavCocktail()
                    }
            }
        }
    }
}

struct FavouriteListComponent_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteListComponent(settingsViewModel: SettingsViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
