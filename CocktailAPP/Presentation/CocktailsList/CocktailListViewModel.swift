//
//  CocktailModel.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import Foundation
import SwiftUI
final class CocktailListViewModel: ObservableObject {
    // MARK: Properties
    private let repository: RepositoryProtocol
    @Published var cocktails: [Cocktail] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        Task {
            self.cocktails = await repository.getCocktails(cocktailName: "", isAlcoholic: nil) ?? []
        }
    }
    
    //Function to return the searched cocktails by name
    @MainActor
    func researchByName(cocktailName: String, isAlcoholic: Bool?) {
            Task {
                self.cocktails = await repository.getCocktails(cocktailName: cocktailName, isAlcoholic: isAlcoholic) ?? cocktails
            }
    }
}
