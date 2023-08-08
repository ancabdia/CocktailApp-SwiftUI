//
//  RemoteCocktailTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import XCTest
@testable import CocktailAPP

final class RemoteCocktailTests: XCTestCase {
    var remoteCocktail: RemoteCocktail?

    override func setUpWithError() throws {
        try super.setUpWithError()
        remoteCocktail = .init(idDrink: "11001", strDrink: "Old Fashioned", strVideo: "https://www.youtube.com/watch?v=YsE_igrPXZs", strCategory: "Cocktail", strInstructions: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg", strAlcoholic: "Alcoholic", strGlass: "Old-fashioned glass", strIngredient1:  "Bourbon", strIngredient2: "Angostura bitters", strIngredient3: "Sugar", strIngredient4: "Water", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "4.5 cL", strMeasure2: "2 dashes", strMeasure3: "1 cube", strMeasure4: "dash", strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil)
    }

    override func tearDownWithError() throws {
        remoteCocktail = nil
        try super.tearDownWithError()
    }

    func testRemoteCocktail_whenCreating_succesful() throws {
        //check remoteCocktail is not nil
        XCTAssertNotNil(remoteCocktail)
        
        //check remoteCocktail has min parameters to Cocktail
        XCTAssertEqual(remoteCocktail?.idDrink, "11001")
        XCTAssertEqual(remoteCocktail?.strDrink, "Old Fashioned")
    }
}
