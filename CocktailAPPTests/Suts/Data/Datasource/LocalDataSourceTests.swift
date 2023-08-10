//
//  LocalDataSourceTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import XCTest
@testable import CocktailAPP
final class LocalDataSourceTests: XCTestCase {
    
    var localDataSource: LocalDataSourceProtocol?

    override func setUpWithError() throws {
        try? super.setUpWithError()
        
        localDataSource = LocalDataSourceImplemententation()
    }

    override func tearDownWithError() throws {
        localDataSource = nil
        
        try super.tearDownWithError()
    }

    func testLocalDataSource_whenAddFavCocktail_success() throws {
        //GIVEN
        let cocktail = Cocktail(id: "1", name: "Nombre del cocktail", video: nil, category: Category.beer, instructions: nil, photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavorite: false)
        //WHEN
        localDataSource?.addFavCocktail(cocktail: cocktail)
        //THEN
        let cocktails = localDataSource?.readFavCocktails()
        XCTAssertEqual(cocktails?.last, cocktail)
    }
    
    func testRemoveFavCocktail_whenRemoveFavCocktail_success() {
        //GIVEN
        let cocktail = Cocktail(id: "1", name: "Nombre del cocktail", video: nil, category: Category.beer, instructions: nil, photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavorite: false)
        localDataSource?.addFavCocktail(cocktail: cocktail)
        
        let cocktails = localDataSource?.readFavCocktails()
        let found = cocktails?.contains(where: { cocktail in
            cocktail.id == "1"
        })
        XCTAssertTrue(found!)
        
        //WHEN
        localDataSource?.removeFavCocktail(cocktailID: "1")
        
        //THEN
        let cocktailsAfter = localDataSource?.readFavCocktails()
        let foundDelete = cocktailsAfter?.contains(where: { cocktail in
            cocktail.id == "1"
        })
        XCTAssertFalse(foundDelete!)
    }
    
    func testIsFavoriteCocktail_whenIsFavorite_success() {
        let cocktail = Cocktail(id: "1", name: "Nombre del cocktail", video: nil, category: Category.beer, instructions: nil, photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavorite: false)
        localDataSource?.addFavCocktail(cocktail: cocktail)
        
        let isFavorite = localDataSource?.isFavorite(cocktailID: "1")
        
        XCTAssertTrue(isFavorite!)
    }

}
