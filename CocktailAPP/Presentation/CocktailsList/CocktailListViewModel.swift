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
    
    @Published var errorText: Bool = false
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getCocktail()
    }
    
    func getCocktail(cocktailName: String = "", isAlcoholic: Bool? = nil) {
        Task {
            do {
                self.cocktails = try await repository.getCocktails(cocktailName: cocktailName, isAlcoholic: isAlcoholic) ?? []
            } catch let error as DomainError {
                switch error {
                case .generalError:
                    print("general error")
                    errorText.toggle()
                case .noConnection:
                    print("no connection")
                }
            }
        }
    }
}
