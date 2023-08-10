//
//  DetailViewModelTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import XCTest
@testable import CocktailAPP

final class DetailViewModelTests: XCTestCase {
    
    var sut: DetailViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let mockRepository = MockRespository()
        sut = DetailViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testDetailViewModel_whenSavingFavoriteCocktail_succesful() async {
        //GIVEN
        let repo = MockRespository()
        sut = DetailViewModel(repository: repo)
        
        //WHEN
        let cocktail = Cocktail(id: "1", name: "Cocktail", video: nil, category: Category.beer, instructions: "", photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavorite: false)
        
        sut?.saveFav(cocktail: cocktail)
        
        
        //THEN
        XCTAssertNotNil(sut?.isFavorite(cocktailID: cocktail.id))
    }
    
    func testDetailViewModel_whenDeleteFavoriteCocktail_succesful() async {
        //GIVEN
        let repo = MockRespository()
        let cocktail = Cocktail(id: "1", name: "Cocktail", video: nil, category: Category.beer, instructions: "", photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavorite: false)
        
        repo.addFavCocktail(cocktail: cocktail)
        
        sut = DetailViewModel(repository: repo)
        
        //WHEN
        sut?.deleteFav(cocktail: cocktail)
        
        //THEN
        XCTAssertNotNil(sut?.isFavorite(cocktailID: cocktail.id))
    }

}
