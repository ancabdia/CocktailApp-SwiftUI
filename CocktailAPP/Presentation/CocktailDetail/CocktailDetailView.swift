//
//  CocktailDetailView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct CocktailDetailView: View {
    var screenSize = UIScreen.main.bounds
    var cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TitleComponent(image: cocktail.photo ?? "none", title: cocktail.name, description: cocktail.instructions!, category: cocktail.category)
                Spacer()
                Section {
                    ListComponent(ingredients: cocktail.ingredients, measures: cocktail.measures)
                }
                Spacer()
                if(cocktail.video != nil){
                    Section{
                        VideoComponent(video: cocktail.video ?? "" )
                    }
                }
            }
            .padding()
        }
    }
    
}

struct CocktailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailView(
            cocktail: Cocktail(
                id: "1",
                name: "Sex on the beach",
                video: "https://www.youtube.com/watch?v=ApMR3IWYZHI",
                category: .cocktail,
                instructions: "Build all ingredients in a highball glass filled with ice. Garnish with orange slice.",
                photo: "cocktail_image",
                ingredients: ["Vodka", "Orange Juice", "Jam", "Row"],
                measures: ["1 oz ", "3/4 oz "],
                isAlcoholic: true
            )
        )
    }
}

