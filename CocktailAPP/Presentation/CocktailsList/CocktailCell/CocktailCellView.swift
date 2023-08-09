//
//  CocktailCellView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI

struct CocktailCellView: View {
    
    var cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    var body: some View {
        VStack(alignment: .leading, content: { // Para alinear al inicio
            HStack(content: { // Para el row
                // Imagen
                CellImageComponent(photo: cocktail.photo ?? "")
                // Nombre y descripción alineados al principio
                VStack (alignment: .leading, content: {
                    CellTitleComponent(name: cocktail.name, instructions: cocktail.instructions ?? "")
                })
                Spacer() //Spacer para apretar todo a la izquierda
            })
        })
        
    }
}

struct CocktailCellView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCellView(
            cocktail: Cocktail(
                id: "1",
                name: "Sex on the beach",
                video: "none",
                category: .cocktail,
                instructions: "Build all ingredients in a highball glass filled with ice. Garnish with orange slice.",
                photo: "cocktail_image",
                ingredients: ["Vodka", "Orange Juice", "Jam", "Row"],
                measures: ["1 oz ", "3/4 oz "],
                isAlcoholic: true,
                isFavourite: false
            )
        )
    }
}
