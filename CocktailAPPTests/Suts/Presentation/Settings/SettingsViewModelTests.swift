//
//  SettingsViewModelTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import XCTest
@testable import CocktailAPP

final class SettingsViewModelTests: XCTestCase {
    
    var sut: SettingsViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let mockRepository = MockRespository()
        sut = SettingsViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testSettingsViewModel_whenGetFavCocktail_succesfulResponse() throws {
        sut?.getFavCocktail()
        
        let cocktail = sut?.favCocktails
        
        XCTAssertNotNil(cocktail)
    }

}
