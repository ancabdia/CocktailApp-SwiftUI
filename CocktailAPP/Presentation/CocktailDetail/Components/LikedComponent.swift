//
//  LikedComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import SwiftUI

struct LikedComponent: View {
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    private var liked: Bool
    
    init(liked: Bool) {
        self.liked = liked
    }
    
    var body: some View {
        liked ?
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 25, height: 25)
            .padding()
            .foregroundColor(.red)
            .accessibility(removeTraits: .isImage)
            .accessibilityLabel("Remove from your favorites cocktails")
        :
        Image(systemName: "heart")
            .resizable()
            .frame(width: 25, height: 25)
            .padding()
            .foregroundColor(isDarkModeOn ? .white : .black)
            .accessibility(removeTraits: .isImage)
            .accessibilityLabel("Add to your favourite cocktails")
    }
}

struct LikedComponent_Previews: PreviewProvider {
    static var previews: some View {
        LikedComponent(liked: false)
    }
}
