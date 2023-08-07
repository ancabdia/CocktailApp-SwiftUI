//
//  CocktailModel.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import Foundation
final class CocktailListViewModel: ObservableObject {
    // MARK: Properties
    private let repository: RepositoryProtocol
    @Published var cocktails: [Cocktail] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let cocktailsRemote = try? await repository.filterByName(cocktailName: "Sex") else {
                    self.cocktails = []
                    print("Unable to get cocktails from api")
                    return
                }
                self.cocktails = cocktailsRemote
            }
        }
    }
}
