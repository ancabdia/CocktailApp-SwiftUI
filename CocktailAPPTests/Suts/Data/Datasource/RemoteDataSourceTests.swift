//
//  RemoteDataSourceTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import XCTest
import Combine
@testable import CocktailAPP

final class RemoteDataSourceTests: XCTestCase {
    var subscribers = Set<AnyCancellable>() // var cancellables
    var sut: RemoteCocktailDataSourceProtocol?
    let token = "1"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let dataToken = token.data(using: .utf8)
        let URLSessionMock = NetworkFetchingMock(returning: .success(dataToken!))
        sut = RemoteCocktailDataSourceImplemententation(session: URLSessionMock)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        try super.setUpWithError()
    }
    
    func testRemoteDataSource_whenGetRandomCocktailWithSuccessResult_expectCocktail() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteCocktailDataSourceImplemententation(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            let randomResponseCocktail = RemoteCocktail(idDrink: "1", strDrink: "Cocktail Random", strVideo: nil, strCategory: "cocktail", strInstructions: "how to make the cocktail", strDrinkThumb: nil, strAlcoholic: nil, strGlass: nil, strIngredient1: "Vodka", strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "1 cl", strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil)
            
            let remoteCocktail = RemoteCocktailsResponse(drinks: [randomResponseCocktail])
            
            let data = try JSONEncoder().encode(remoteCocktail)
            
            return(response, data)
        }
        
        //WHEN
        guard let cocktail = try? await sut?.getRandomCocktail() else{
            XCTFail("Cocktail must be return")
            return
        }
        
        //THEN
        XCTAssertNotNil(cocktail)
        XCTAssertEqual(cocktail.strDrink, "Cocktail Random")
    }
}
