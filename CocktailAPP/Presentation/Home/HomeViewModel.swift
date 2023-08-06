//
//  HomeViewModel.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: Properties
    private let repository: RepositoryProtocol
    @Published var cocktail: Cocktail?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func generateCocktail() {
        DispatchQueue.main.async {
            Task {
                guard let CocktailFromApi = try? await self.repository.getRandomCocktail()else {
                    self.cocktail = nil
                    print("Unable to get cocktail from api")
                    return
                }
                self.cocktail = CocktailFromApi
            }
        }
    }
}
