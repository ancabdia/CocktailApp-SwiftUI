//
//  RemoteCocktailDataSourceImpl.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case malformedURL
    case noConnection
    case timeOut
    case errorCode(Int?)
    case decoding
    case noData
    case other
}

final class RemoteCocktailDataSourceImplemententation: RemoteCocktailDataSourceProtocol {
    //MARK: - Properties
    private let session: NetworkFetchingProtocol
    private let server: String = "https://www.thecocktaildb.com"
    private let API_KEY = 1
    private let apiEndpoint: String = "/api/json/v1/"
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    //https://www.thecocktaildb.com//api/json/v1/1/random.php
    func getRandomCocktail() async throws -> RemoteCocktail {
        guard let url = getSessionRandomCocktail() else {
            throw NetworkError.malformedURL
        }
        
        // Obtain data from the call
        let (data, error) = try await session.data(url: url)
        
        // Obtain remote Drink
        let remoteDrinks = try JSONDecoder().decode(RemoteCocktailsResponse.self, from: data)
        
        //Fetch first RemoteCocktail
        guard let remoteRandomCocktail = remoteDrinks.drinks?.first else {
            throw error as! Error
        }
        
        return remoteRandomCocktail
    }
    
    func getCocktailsByName(cocktailName name: String) async throws -> [RemoteCocktail]? {
        guard let url = getSessionCocktailsByName(cocktailName: name) else {
            throw NetworkError.malformedURL
        }
        
        // Obtain data from the call
        do{
            let (data, _) = try await session.data(url: url)
            // Obtain remote Drink
            let remoteDrinks = try JSONDecoder().decode(RemoteCocktailsResponse.self, from: data)
            
            //Fetch first RemoteCocktail
            guard let remoteCocktails = remoteDrinks.drinks else {
                throw NetworkError.noData
            }
            
            return remoteCocktails
        } catch let error {
            throw error
        }
    }
}

//TODO: Crear una clase que sea URLRequestHelper
//-Protocol
//-Impl
//    getSessionRandomCocktail(session, server, apiEndopoint)
//
//Mockear esa clase para dar error o no error

extension RemoteCocktailDataSourceImplemententation {
    //www.thecocktaildb.com//api/json/v1/1/random.php
    func getSessionRandomCocktail() -> URLRequest? {
        // tratar los errores (THROWS y tratar en el punto del código deseado)
        guard let url = URL(string: "\(server)/\(apiEndpoint)/\(API_KEY)/random.php") else {
            print(NetworkError.malformedURL)
            return nil
        }
        
        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
    
    //www.thecocktaildb.com/api/json/v1/{{API_KEY}}/search.php?s=cocktailName
    func getSessionCocktailsByName(cocktailName: String) -> URLRequest? {
        guard let url = URL(string: "\(server)/\(apiEndpoint)/\(API_KEY)/search.php?s=\(cocktailName)") else {
            print(NetworkError.malformedURL)
            return nil
        }
        
        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
