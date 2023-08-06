//
//  CocktailMapper.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

enum CocktailMapper{
    static func mapRemoteOneCocktailToCocktail(remoteCocktail cocktail: RemoteCocktail) -> Cocktail {
        var ingredients: [String] = []
        var measures: [String] = []
        
        // Use Mirror to access the properties of the RemoteCocktail
        let mirror = Mirror(reflecting: cocktail)
        for (label, value) in mirror.children {
            if let label = label, label.hasPrefix("strIngredient"), let ingredient = value as? String, !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            
            if let label = label, label.hasPrefix("strMeasure"), let measure = value as? String, !measure.isEmpty {
                measures.append(measure)
            }
        }
        
        return Cocktail(id: cocktail.idDrink, name: cocktail.strDrink, category: Category(rawValue: cocktail.strCategory ?? "") ?? .other, instructions: cocktail.strInstructions, photo: cocktail.strDrinkThumb ?? "none", ingredients: ingredients, measures: measures)
    }
    
    static func mapRemoteCocktailsResponseToCocktails(remoteCocktails response: RemoteCocktailsResponse) -> [Cocktail] {
        return response.drinks.map{ remoteCocktail in
            
            var ingredients: [String] = []
            var measures: [String] = []
            
            // Use Mirror to access the properties
            let mirror = Mirror(reflecting: remoteCocktail)
            for (label, value) in mirror.children {
                if let label = label, label.hasPrefix("strIngredient"), let ingredient = value as? String, !ingredient.isEmpty {
                    ingredients.append(ingredient)
                }
                
                if let label = label, label.hasPrefix("strMeasure"), let measure = value as? String, !measure.isEmpty {
                    measures.append(measure)
                }
            }
            
            return Cocktail(
                id: remoteCocktail.idDrink,
                name: remoteCocktail.strDrink,
                category: Category(rawValue: remoteCocktail.strCategory ?? "other") ?? .other,
                instructions: remoteCocktail.strInstructions!,
                photo: remoteCocktail.strDrinkThumb ?? "none",
                ingredients: ingredients,
                measures: measures
            )
        }
    }
}
