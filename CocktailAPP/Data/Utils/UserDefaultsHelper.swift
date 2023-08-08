//
//  UserDefaultsHelper.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation
import Foundation

final class UserDefaultsHelper {
    
    static let defaults = UserDefaultsHelper()
    private init() {}
    
    func save(cocktail: Cocktail) {
            do {
                let jsonData = try JSONEncoder().encode(cocktail)
                let jsonString = String(data: jsonData, encoding: .utf8)!
                UserDefaults.standard.setValue(jsonString, forKey: "cocktail")
                UserDefaults.standard.synchronize()
            } catch {
                print("Error encoding cocktail: \(error)")
            }
        }
    
    func readCocktails() -> Cocktail? {
        if let jsonString = UserDefaults.standard.string(forKey: "cocktail"),
           let jsonData = jsonString.data(using: .utf8) {
            do{
                let cocktail = try JSONDecoder().decode(Cocktail.self, from: jsonData)
                return cocktail
            } catch{
                print("Error decoding cocktail: \(error)")
                return nil
            }
        }
        return nil
    }
}

//
//
//
//    func saveCocktails(favCocktails: [Cocktail]) {
//        let serializedCocktails = favCocktails.map { cocktail in
//            return serialize(cocktail)
//        }
//
//        UserDefaults.standard.set(serializedCocktails, forKey: "cocktails")
//        UserDefaults.standard.synchronize()
//    }
//
//    func readCocktails() -> [Cocktail]? {
//        if let savedData = UserDefaults.standard.array(forKey: "cocktails") as? [[String: Any]] {
//            return savedData.compactMap { data in
//                return deserialize(data)
//            }
//        }
//        return nil
//    }
    
//
//    //convert types
//    private func serialize(_ cocktail: Cocktail) -> [String: Any] {
//        var serialized: [String: Any] = [:]
//        serialized["id"] = cocktail.id
//        serialized["name"] = cocktail.name
//        serialized["category"] = cocktail.category.rawValue
//        serialized["video"] = cocktail.video
//        serialized["instructions"] = cocktail.instructions
//        serialized["photo"] = cocktail.photo
//        serialized["ingredients"] = cocktail.ingredients
//        serialized["measures"] = cocktail.measures
//        serialized["isAlcoholic"] = cocktail.isAlcoholic
//        serialized["isFavourite"] = cocktail.isFavourite
//
//        return serialized
//    }
//
//    private func deserialize(_ data: [String: Any]) -> Cocktail? {
//        guard let id = data["id"] as? String,
//              let name = data["name"] as? String,
//              let video = data["video"] as? String,
//              let category = data["category"] as? Category,
//              let instructions = data["instructions"] as? String,
//              let photo = data["photo"] as? String,
//              let ingredients = data["ingredients"] as? [String?],
//              let measures = data["measures"] as? [String?],
//              let isAlcoholic = data["isAlcoholic"] as? Bool,
//              let isFavourite = data["isFavourite"] as? Bool
//        else {
//            return nil
//        }
//
//        return Cocktail(id: id, name: name, video: video, category: category, instructions: instructions, photo: photo, ingredients: ingredients, measures: measures, isAlcoholic: isAlcoholic, isFavourite: isFavourite)
//    }
//}
