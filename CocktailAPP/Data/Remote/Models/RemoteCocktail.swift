//
//  RemoteCocktail.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation
// MARK: - DTO: RemoteCocktailsResponse
///Lista de cocktail recibido de la llamda JSON
struct RemoteCocktailsResponse: Codable {
    let drinks: [RemoteCocktail]?
}

// MARK: - DTO: RemoteCocktail
///Un cocktail que proviene de la API, desde aqui incluyo todos los campos de la respuesta del JSON
struct RemoteCocktail: Codable {
    let idDrink: String
    let strDrink: String
    let strVideo: String?
    let strCategory: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let strAlcoholic: String?
    let strGlass: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
}

