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
    
    @MainActor
    func getCocktails(cocktailName name: String = "", isAlcoholic: Bool? = nil) async -> [Cocktail]? {
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
            
        } catch {
            print("error from server")
            return nil
        }
    }
}
