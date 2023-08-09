//
//  ListComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct ListComponent: View {
    var screenSize = UIScreen.main.bounds
    
    private var ingredients: [String?]
    private var measures: [String?]
    
    init(ingredients: [String?], measures: [String?]) {
        self.ingredients = ingredients
        self.measures = measures
    }
    
    var body: some View {
        VStack{
            DisclosureGroup("Ingredients") {
                ForEach(0..<max(ingredients.count, measures.count), id: \.self) { index in
                    let ingredient = index < ingredients.count ? ingredients[index] : nil
                    let measure = index < measures.count ? measures[index] : nil
                    if let ingredient = ingredient {
                        ListComponentButton(ingredient: ingredient, measure: measure)
                    }
                }
            }.disclosureGroupStyle(MyDisclosureStyle())
        }.padding()
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(ingredients: ["Vodka", "Orange Juice", "Jam", "Row"], measures: ["1 oz ", "3/4 oz "])
    }
}
