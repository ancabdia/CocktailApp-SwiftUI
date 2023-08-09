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
            cocktailViewModel.getCocktail(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
        }
    }
    @State private var isAlcoholic: Bool = true
    
    init(cocktailViewModel: CocktailListViewModel) {
        self.cocktailViewModel = cocktailViewModel
    }
    
    var body: some View {
        VStack{
            NavigationStack {
                if(!cocktailViewModel.errorText){
                    Toggle(isOn: $isAlcoholic) {
                        Text("Alcoholic Drinks")
                    }.padding()
                }
                if (!cocktailViewModel.errorText) {
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
                        cocktailViewModel.getCocktail(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
                        
                    }
                    .onChange(of: isAlcoholic){ isAlcoholic in
                        print("LLAMADA ON CHANGE con texto: \(isAlcoholic)")
                        cocktailViewModel.getCocktail(cocktailName: searchCocktail, isAlcoholic: isAlcoholic)
                    }
                }else{
                    Label("The list has no data", systemImage: "person.fill.xmark")
                        .searchable(text: $searchCocktail, placement: .automatic, prompt: "Search cocktails")
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
