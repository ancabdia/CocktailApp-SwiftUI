//
//  SettingsViewModel.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    //MARK: Properties
    private let repository: RepositoryProtocol
    
    @Published var favCocktails: [Cocktail] = []
    
    init(repository: RepositoryProtocol){
        self.repository = repository
        getFavCocktail()
    }
    
    func getFavCocktail(){
        favCocktails = repository.getFavCocktails() ?? favCocktails
    }
}
