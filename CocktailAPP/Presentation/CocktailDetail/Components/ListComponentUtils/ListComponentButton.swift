//
//  ListComponentButton.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct ListComponentButton: View {
    
    var ingredient: String
    var measure: String?
    
    init(ingredient: String, measure: String? = nil) {
        self.ingredient = ingredient
        self.measure = measure
    }
    
    var body: some View {
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
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

struct ListComponentButton_Previews: PreviewProvider {
    static var previews: some View {
        ListComponentButton(ingredient: "Vodka", measure: "4 cl")
    }
}
