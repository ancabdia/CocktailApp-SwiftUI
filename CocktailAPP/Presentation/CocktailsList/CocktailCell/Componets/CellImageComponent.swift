//
//  CellImageComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//

import SwiftUI

struct CellImageComponent: View {
    
    var photo: String
    
    init(photo: String) {
        self.photo = photo
    }
    
    var body: some View {
        AsyncImage(url: URL(string: photo),
                   content: { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 73)
        },
                   placeholder: {
            Image(photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 73)
        })
    }
}

struct CellImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        CellImageComponent(photo: "cocktail_image")
    }
}
