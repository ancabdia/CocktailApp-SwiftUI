//
//  HomeViewModelTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import XCTest
@testable import CocktailAPP


//TODO: - Pending finish test class
final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRespository()
        
        sut = HomeViewModel(repository: mockRepository)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    
    ///References to generateCocktail()
    func testHomeViewModel_whenGenerateCocktail_succesfulResponse() async {
        //GIVEN
        XCTAssertNil(sut?.cocktail)
        let expectation = expectation(description: "Cocktail random")
        self.sut?.generateCocktail(){
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(sut?.cocktail)
    }
    
    func testHomeViewModel_whenGenerateCocktail_failResponse() async {
        var repo = MockRespository()
        
        repo.errorRandomCocktail = true
        
        sut = HomeViewModel(repository: repo)
        
        let expectation = expectation(description: "Cocktail random")
        self.sut?.generateCocktail(){
            expectation.fulfill()
        }
        
        let cocktail = sut?.cocktail
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNil(cocktail)
    }
}

