//
//  ListTitle.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct TitleComponent: View {
    var screenSize = UIScreen.main.bounds
    
    private var image: String
    private var title: String
    private var description: String
    private var category: Category
    
    init(image: String, title: String, description: String, category: Category) {
        self.image = image
        self.title = title
        self.description = description
        self.category = category
    }
    
    var body: some View {
        AsyncImage(url: URL(string: image),
                   content: { image in
            image.resizable()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenSize.width, height: 343)
                .clipped()
        },
                   placeholder: {
            ProgressView()
        })
        
        VStack(spacing: 24){
            VStack{
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(category.rawValue)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Text(description)
        }.padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
}
}

struct TitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponent(image: "cocktail_image", title: "Sex on the Beach", description: "Build all ingredients in a highball glass filled with ice. Garnish with orange slice.", category: .cocktail)
    }
}
