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
    @State private var searchCocktail: String = ""
    
    init(cocktailViewModel: CocktailListViewModel) {
        self.cocktailViewModel = cocktailViewModel
    }
    
    var filteredCocktails: [Cocktail] {
        guard !searchCocktail.isEmpty else { return cocktailViewModel.cocktails }
        //return new call to API with searchCocktail term as name
        cocktailViewModel.researchByName(cocktailName: searchCocktail)
        return cocktailViewModel.cocktails.filter{$0.name.localizedCaseInsensitiveContains(searchCocktail)}
    }
    
    var body: some View {
        NavigationStack {
            List(filteredCocktails) { cocktail in
                NavigationLink{
                    CocktailDetailView(cocktail: cocktail)
                } label: {
                    CocktailCellView(cocktail: cocktail)
                }
            }
            .navigationTitle("Cocktails")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .searchable(text: $searchCocktail, placement: .automatic, prompt: "Seach cocktails")
        }
    }
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList(cocktailViewModel: CocktailListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation())))
    }
}
