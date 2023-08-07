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
                AsyncImage(url: URL(string: cocktail.photo ?? "none"),
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 73)
                },
                           placeholder: {
                    Image(cocktail.photo ?? "none")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 73)
                })
                
                
                // Nombre y descripción alineados al principio
                VStack (alignment: .leading, content: {
                    Text(cocktail.name)
                        .fontWeight(.semibold)
                    //.font(.title3)
                        .font(.system(size: 14))
                    Text(cocktail.instructions ?? "none")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(3)
                })
                Spacer() // Spacer para apretar todo a la izquierda
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
                measures: ["1 oz ", "3/4 oz "]
            )
        )
    }
}
