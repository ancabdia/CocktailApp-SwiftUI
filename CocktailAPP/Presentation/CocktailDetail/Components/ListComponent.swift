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
        List {
            ForEach(0..<max(ingredients.count, measures.count), id: \.self) { index in
                let ingredient = index < ingredients.count ? ingredients[index] : nil
                let measure = index < measures.count ? measures[index] : nil
                
                if let ingredient = ingredient {
                    Button(action:{
                        let url = URL(string:
                                        "https://wikipedia.org/en/\(ingredient.replacingOccurrences(of: " ", with: "%20"))"
                        )!
                        UIApplication.shared.open(url, options: [:])
                    }){
                        let url = URL(string:
                                        "https://thecocktaildb.com/images/ingredients/\(ingredient.replacingOccurrences(of: " ", with: "%20")).png"
                        )
                        
                        HStack(alignment: .center, spacing: 8) {
                            AsyncImage(url: url,
                                       content: { image in
                                image.resizable()
                                    .frame(width: 60, height: 60)
                            },
                                       placeholder: {
                                ProgressView()
                            })
                            VStack(alignment: .leading, spacing: 2) {
                                Text(ingredient)
                                    .font(Font.system(size: 17))
                                Text(ingredient)
                                    .font(Font.system(size: 12))
                                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            if let measure = measure {
                                Text(measure)
                                    .font(Font.system(size: 12))
                                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                }
            }
            .padding()
        }
        .listStyle(.inset)
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(ingredients: ["Vodka", "Orange Juice", "Jam", "Row"], measures: ["1 oz ", "3/4 oz "])
    }
}
