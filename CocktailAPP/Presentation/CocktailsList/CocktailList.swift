//
//  CocktailList.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI

struct CocktailList: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var cocktailViewModel: CocktailListViewModel
    
    init(cocktailViewModel: CocktailListViewModel) {
        self.cocktailViewModel = cocktailViewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cocktailViewModel.cocktails) { cocktail in
                    CocktailDetailView(cocktail: cocktail)
                }
            }
            .scrollContentBackground(.hidden) // Esconder el background
            .navigationTitle("Cocktails") // Título de la lista
            .navigationBarTitleDisplayMode(.inline) // Meter en el centro el título pequeño
        }
    }
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList(cocktailViewModel: CocktailListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation())))
    }
}
