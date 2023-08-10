//
//  CocktailMapperTests.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import XCTest
@testable import CocktailAPP

final class CocktailMapperTests: XCTestCase {
    
    var remoteCocktail: RemoteCocktail?
    var expected_cocktail: Cocktail?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        remoteCocktail = .init(idDrink: "11001", strDrink: "Old Fashioned", strVideo: "https://www.youtube.com/watch?v=YsE_igrPXZs", strCategory: "", strInstructions: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg", strAlcoholic: "Alcoholic", strGlass: "Old-fashioned glass", strIngredient1:  "Bourbon", strIngredient2: "Angostura bitters", strIngredient3: "Sugar", strIngredient4: "Water", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "4.5 cL", strMeasure2: "2 dashes", strMeasure3: "1 cube", strMeasure4: "dash", strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil)
        
        expected_cocktail = .init(id: "11001", name: "Old Fashioned", video: "https://www.youtube.com/watch?v=YsE_igrPXZs", category: Category.other, instructions: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.", photo: "https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg", ingredients: ["Bourbon", "Angostura bitters", "Sugar", "Water"], measures: ["4.5 cL", "2 dashes", "1 cube", "dash"], isAlcoholic: true, isFavorite: false)
    }

    override func tearDownWithError() throws {
        remoteCocktail = nil
        expected_cocktail = nil
        try super.tearDownWithError()
    }

    func testMapRemoteOneCocktailToCocktail_whenMappingCocktail_succesfulAlcoholicDrink() throws {
        let cocktail = CocktailMapper.mapRemoteOneCocktailToCocktail(remoteCocktail: remoteCocktail!)
        
        XCTAssertNotNil(cocktail)
        XCTAssertEqual(cocktail.id, expected_cocktail?.id)
        XCTAssertEqual(cocktail.category, expected_cocktail?.category)
        XCTAssertEqual(cocktail.name, expected_cocktail?.name)
        XCTAssertEqual(cocktail.ingredients, expected_cocktail?.ingredients)
        XCTAssertEqual(cocktail.measures, expected_cocktail?.measures)
        XCTAssertEqual(cocktail.isAlcoholic, expected_cocktail?.isAlcoholic)
        XCTAssertEqual(cocktail.photo, expected_cocktail?.photo)
        XCTAssertEqual(cocktail, expected_cocktail)
    }
    
    func testMapRemoteOneCocktailToCocktail_whenMappingCocktail_succesfulNotAlcoholicDrink() throws {
        remoteCocktail = .init(idDrink: "11001", strDrink: "Old Fashioned", strVideo: "https://www.youtube.com/watch?v=YsE_igrPXZs", strCategory: "", strInstructions: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg", strAlcoholic: "Non Alcoholic", strGlass: "Old-fashioned glass", strIngredient1:  "Bourbon", strIngredient2: "Angostura bitters", strIngredient3: "Sugar", strIngredient4: "Water", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "4.5 cL", strMeasure2: "2 dashes", strMeasure3: "1 cube", strMeasure4: "dash", strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil)
        
        expected_cocktail = .init(id: "11001", name: "Old Fashioned", video: "https://www.youtube.com/watch?v=YsE_igrPXZs", category: Category.other, instructions: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.", photo: "https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg", ingredients: ["Bourbon", "Angostura bitters", "Sugar", "Water"], measures: ["4.5 cL", "2 dashes", "1 cube", "dash"], isAlcoholic: false, isFavorite: false)
        
        
        let cocktail = CocktailMapper.mapRemoteOneCocktailToCocktail(remoteCocktail: remoteCocktail!)
        
        XCTAssertNotNil(cocktail)
        XCTAssertEqual(cocktail.id, expected_cocktail?.id)
        XCTAssertEqual(cocktail.category, expected_cocktail?.category)
        XCTAssertEqual(cocktail.name, expected_cocktail?.name)
        XCTAssertEqual(cocktail.ingredients, expected_cocktail?.ingredients)
        XCTAssertEqual(cocktail.measures, expected_cocktail?.measures)
        XCTAssertEqual(cocktail.isAlcoholic, expected_cocktail?.isAlcoholic)
        XCTAssertEqual(cocktail.photo, expected_cocktail?.photo)
        XCTAssertEqual(cocktail, expected_cocktail)
    }
    
    func testMapRemoteCocktailsToCocktails_whenMappingCocktail_succesfulAlcoholicDrink(){
        var arrayOfCocktails:[RemoteCocktail] = []
        
        arrayOfCocktails.append(remoteCocktail!)
        arrayOfCocktails.append(remoteCocktail!)
        
        let cocktails:[Cocktail] = CocktailMapper.mapRemoteCocktailsToCocktails(remoteCocktails: arrayOfCocktails)
        
        XCTAssertNotNil(cocktails)
        XCTAssertEqual(cocktails.count, 2)
        XCTAssertEqual(cocktails.first?.id, remoteCocktail?.idDrink)
        XCTAssertEqual(cocktails.first?.name, remoteCocktail?.strDrink)
        XCTAssertEqual(cocktails.first?.category, Category.other)
        XCTAssertEqual(cocktails.first?.photo, remoteCocktail?.strDrinkThumb)
    }
}
