//
//  RepositoryImp.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

///
///Class RepositoryImpl
///Manage a remoteDataSource (RemoteCocktail) and mapped to Domain (Cocktail)
final class RepositoryImpl: RepositoryProtocol {
    //MARK: - Properties
    private let remoteDataSource: RemoteCocktailDataSourceProtocol
    
    private let localDataSource: LocalDataSourceProtocol
    
    //MARK: - Init
    init(remoteDataSource: RemoteCocktailDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    //implementar las funciones del Local
    func addFavCocktail(cocktail: Cocktail) {
        localDataSource.addFavCocktail(cocktail: cocktail)
    }
    
    func removeFavCocktail(cocktail: Cocktail) {
        localDataSource.removeFavCocktail(cocktailID: cocktail.id)
    }
    
    func getFavCocktails() -> [Cocktail]? {
        return localDataSource.readFavCocktails()
    }
    
    func isFavourite(cocktailID: String) -> Bool {
        return localDataSource.isFavourite(cocktailID: cocktailID)
    }
    
    //MARK: - Methods from Domain Protocol
    func getRandomCocktail() async throws -> Cocktail {
        //Cocktail mapped
        let remoteCocktail: RemoteCocktail = try await remoteDataSource.getRandomCocktail()
        return CocktailMapper.mapRemoteOneCocktailToCocktail(remoteCocktail: remoteCocktail)
    }
    
    @MainActor
    func getCocktails(cocktailName name: String = "", isAlcoholic: Bool? = nil) async throws -> [Cocktail]? {
        do {
            let remoteCocktails: [RemoteCocktail] = try await remoteDataSource.getCocktailsByName(cocktailName: name) ?? []
            let cocktailsMapped:[Cocktail] =  CocktailMapper.mapRemoteCocktailsToCocktails(remoteCocktails: remoteCocktails)
            
            //filtrar por alcoholic lo que tienes en el View
            if(isAlcoholic != nil){
                let result:[Cocktail] = cocktailsMapped.filter{
                    $0.isAlcoholic == isAlcoholic
                }
                return result
            }else{
                return cocktailsMapped
            }
            
        } catch let error {
            switch error._code {
            default:
                throw DomainError.generalError //error general
            }
        }
    }
}
