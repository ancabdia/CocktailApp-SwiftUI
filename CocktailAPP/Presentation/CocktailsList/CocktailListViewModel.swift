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
        DispatchQueue.main.async {
            Task {
                //By default search bar returns 10 first from API
                guard let cocktailsRemote = try? await repository.filterByName(cocktailName: "") else {
                    self.cocktails = []
                    print("Unable to get cocktails from api")
                    return
                }
                self.cocktails = cocktailsRemote
            }
        }
    }
    
    //Function to return the searched cocktails by name
    func researchByName(cocktailName: String) {
        DispatchQueue.main.async {
            Task {
                guard let cocktailsRemote = try? await self.repository.filterByName(cocktailName: cocktailName) else {
                    self.cocktails = []
                    print("Unable to get cocktails from api on researchByName")
                    return
                }
                self.cocktails = cocktailsRemote
            }
        }
    }
}
