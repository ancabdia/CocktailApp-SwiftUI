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
    @State private var searchCocktail: String = "" {
        didSet{
            cocktailViewModel.researchByName(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
        }
    }
    @State private var isAlcoholic: Bool = true
    
    init(cocktailViewModel: CocktailListViewModel) {
        self.cocktailViewModel = cocktailViewModel
    }
    
    var body: some View {
        VStack{
            NavigationStack {
                Toggle(isOn: $isAlcoholic) {
                    Text("Alcoholic Drinks")
                }.padding()
                List(cocktailViewModel.cocktails) { cocktail in
                    NavigationLink{
                        CocktailDetailView(cocktail: cocktail)
                    } label: {
                        CocktailCellView(cocktail: cocktail)
                    }
                }
                .navigationTitle("Cocktails")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .searchable(text: $searchCocktail, placement: .automatic, prompt: "Search cocktails")
                .onChange(of: searchCocktail){ text in
                    print("LLAMADA ON CHANGE con texto: \(text)")
                    cocktailViewModel.researchByName(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
                    
                }
                .onChange(of: isAlcoholic){ isAlcoholic in
                    print("LLAMADA ON CHANGE con texto: \(isAlcoholic)")
                    cocktailViewModel.researchByName(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
                }
            }
        }
        
    }
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList(cocktailViewModel: CocktailListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
