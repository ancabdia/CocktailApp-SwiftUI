//
//  Cocktail.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation

//https://www.thecocktaildb.com/images/ingredients/"strIngredientX.name"-"Size?".png
//Size: Small, Medium

// Codable: https://stackoverflow.com/questions/48568373/codable-class-does-not-conform-to-protocol-decodable
struct Cocktail: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let video: String?
    let category: Category
    let instructions: String?
    let photo: String?
    let ingredients: [String?]
    let measures: [String?]
    let isAlcoholic: Bool?
    let isFavourite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, video, category, instructions, photo, ingredients, measures, isAlcoholic, isFavourite
    }
    
    init(id: String, name: String, video: String?, category: Category, instructions: String?, photo: String?, ingredients: [String?], measures: [String?], isAlcoholic: Bool?, isFavourite: Bool) {
        self.id = id
        self.name = name
        self.video = video
        self.category = category
        self.instructions = instructions
        self.photo = photo
        self.ingredients = ingredients
        self.measures = measures
        self.isAlcoholic = isAlcoholic
        self.isFavourite = isFavourite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        video = try container.decodeIfPresent(String.self, forKey: .video)
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        ingredients = try container.decode([String?].self, forKey: .ingredients)
        measures = try container.decode([String?].self, forKey: .measures)
        isAlcoholic = try container.decodeIfPresent(Bool.self, forKey: .isAlcoholic)
        isFavourite = try container.decode(Bool.self, forKey: .isFavourite)
        
        let rawCategory = try container.decode(String.self, forKey: .category)
        category = Category(rawValue: rawCategory) ?? .other
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(video, forKey: .video)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(photo, forKey: .photo)
        try container.encode(ingredients, forKey: .ingredients)
        try container.encode(measures, forKey: .measures)
        try container.encode(isAlcoholic, forKey: .isAlcoholic)
        try container.encode(isFavourite, forKey: .isFavourite)
        try container.encode(category.rawValue, forKey: .category)
    }
}

enum Category: String, Codable {
    case ordinaryDrink = "Ordinary Drink"
    case cocktail = "Cocktail"
    case punch = "Punch / Party Drink"
    case beer = "Beer"
    case other = "Other / Unknown"
}
