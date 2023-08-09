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
    
    //change to cocktails y hacer el stackOverflow
//    func save(cocktail: Cocktail) {
//            do {
//                let jsonData = try JSONEncoder().encode(cocktail)
//                let jsonString = String(data: jsonData, encoding: .utf8)!
//                UserDefaults.standard.setValue(jsonString, forKey: "cocktail")
//                UserDefaults.standard.synchronize()
//            } catch {
//                print("Error encoding cocktail: \(error)")
//            }
//        }
//    
//    func readCocktails() -> Cocktail? {
//        if let jsonString = UserDefaults.standard.string(forKey: "cocktail"),
//           let jsonData = jsonString.data(using: .utf8) {
//            do{
//                let cocktail = try JSONDecoder().decode(Cocktail.self, from: jsonData)
//                return cocktail
//            } catch{
//                print("Error decoding cocktail: \(error)")
//                return nil
//            }
//        }
//        return nil
//    }
}
