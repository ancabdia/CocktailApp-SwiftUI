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
//        let mockRepository = MockRespository()
        
//        sut = HomeViewModel(repository: mockRepository, homeView: nil)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testHomeViewModFel_whenGetHeroes_succesfulResponse() throws {
        // GIVEN
        let expectation = XCTestExpectation(description: "get Heroes")
//        let repository = MockRespository(loginSuccessful: true)
    }

}

