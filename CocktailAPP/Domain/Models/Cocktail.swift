//
//  Cocktail.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

//https://www.thecocktaildb.com/images/ingredients/"strIngredientX.name"-"Size?".png
//Size: Small, Medium

struct Cocktail: Identifiable, Hashable {
    let id: String
    let name: String
    let category: Category
    let instructions: String?
    let photo: String?
    let ingredients: [String?]
    let measures: [String?]
}

enum Category: String {
    case ordinaryDrink = "Ordinary Drink"
    case cocktail = "Cocktail"
    case punch = "Punch / Party Drink"
    case beer = "Beer"
    case other = "Other / Unknown"
}
