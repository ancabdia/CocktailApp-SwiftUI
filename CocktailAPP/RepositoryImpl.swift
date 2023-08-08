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
    
    private let localDataSource: LocalDataSourceProtocol //nuevo protocol
    
    var cocktails: [Cocktail] = []
    
    //MARK: - Init
    init(remoteDataSource: RemoteCocktailDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    //implementar las funciones del Local
    func addFavCocktail(cocktail: Cocktail) {
        
        cocktails.append(cocktail)
        
        localDataSource.saveFavCocktail(cocktail: cocktails.first!)
    }
    
    func removeFavCocktail(cocktail: Cocktail) {
        cocktails.removeAll { cocktailLocal in
            cocktailLocal.id == cocktail.id
        }
    }
    
    //MARK: - Methods from Domain Protocol
    func getRandomCocktail() async throws -> Cocktail {
        //Cocktail mapped
        let remoteCocktail: RemoteCocktail = try await remoteDataSource.getRandomCocktail()
        return CocktailMapper.mapRemoteOneCocktailToCocktail(remoteCocktail: remoteCocktail)
    }
    
    func filterByName(cocktailName name: String) async throws -> [Cocktail]? {
        guard let remoteCocktails: [RemoteCocktail] = try await remoteDataSource.filterByName(cocktailName: name) else {
            return nil
        }
        return CocktailMapper.mapRemoteCocktailsToCocktails(remoteCocktails: remoteCocktails)
    }
}
