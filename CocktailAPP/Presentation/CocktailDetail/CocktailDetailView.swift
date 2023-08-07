//
//  CocktailDetailView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI
import AVKit

struct CocktailDetailView: View {
    var screenSize = UIScreen.main.bounds
    var cocktail: Cocktail
    
    @State var player = AVPlayer(url: URL(string: "https://swiftanytime-content.s3.ap-south-1.amazonaws.com/SwiftUI-Beginner/Video-Player/iMacAdvertisement.mp4")!) // 1
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    //    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                TitleComponent(image: cocktail.photo ?? "none", title: cocktail.name, description: cocktail.instructions ?? "", category: cocktail.category)
                ListComponent(ingredients: cocktail.ingredients, measures: cocktail.measures)
                VideoPlayer(player: player)
            }
        }
        //        .navigationBarTitle(cocktail.name) // Set navigation bar title
        //        .navigationBarItems(leading: Button(action : {
        //            self.mode.wrappedValue.dismiss()
        //        }){
        //            Image(systemName: "arrow.left")
        //        })
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
                measures: ["1 oz ", "3/4 oz "]
            )
        )
    }
}

