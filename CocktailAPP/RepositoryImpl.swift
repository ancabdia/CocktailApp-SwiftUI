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
    
    //MARK: - Init
    init(remoteDataSource: RemoteCocktailDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
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
