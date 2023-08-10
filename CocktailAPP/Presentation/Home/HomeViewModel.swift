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
    
    //inicializar el closure para no tener que inicializarlo
    func generateCocktail(clousure: @escaping () -> () = {} ){
        DispatchQueue.main.async {
            Task {
                //No asigna
                guard let CocktailFromApi = try? await self.repository.getRandomCocktail()else {
                    self.cocktail = nil
                    print("Unable to get cocktail from api")
                    //meter en el closure
                    clousure() //solo para saber si cumple la expectation
                    return
                }
                //asigna
                self.cocktail = CocktailFromApi
                //meter en el closure
                clousure()
            }
        }
    }
}
