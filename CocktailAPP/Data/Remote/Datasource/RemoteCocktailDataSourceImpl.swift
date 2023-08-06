//
//  RemoteCocktailDataSourceImpl.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case malformedURL
    case noData
    case noUser
    case errorCode(Int?)
    case decoding
    case other
}

final class RemoteCocktailDataSourceImplemententation: RemoteCocktailDataSourceProtocol {
    //MARK: - Properties
    private let server: String = "https://www.thecocktaildb.com"
    private let API_KEY = 1
    private let apiEndpoint: String = "/api/json/v1/"
    
    
    //https://www.thecocktaildb.com//api/json/v1/1/random.php
    func getRandomCocktail() async throws -> RemoteCocktail {
        guard let url = getSessionRandomCocktail() else {
            throw NetworkError.malformedURL
        }
        
        // Obtain data from the call
        let (data, _) = try await URLSession.shared.data(for: url)
        
        // Obtain remote Drink
        let remoteDrinks = try JSONDecoder().decode(RemoteCocktailsResponse.self, from: data)
        
        //Fetch first RemoteCocktail
        guard let remoteRandomCocktail = remoteDrinks.drinks.first else {
            throw NetworkError.noData
        }
        
        return remoteRandomCocktail
    }
}

extension RemoteCocktailDataSourceImplemententation {
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
}
