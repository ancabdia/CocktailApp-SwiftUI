//
//  ListTitle.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct TitleComponent: View {
    var screenSize = UIScreen.main.bounds
    
    @ObservedObject var detailViewModel: DetailViewModel
    
    private var cocktail: Cocktail
    
    @State private var liked: Bool
    
    init(cocktail: Cocktail, detailViewModel: DetailViewModel) {
        self.cocktail = cocktail
        self.detailViewModel = detailViewModel
        liked = detailViewModel.isFavourite(cocktailID: cocktail.id)
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Image("placeholder") // Use your placeholder image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screenSize.width, height: 343)
                        .clipped()
                        .accessibilityLabel("Image of \(cocktail.name)")
                        .accessibilityValue(Text("Representation of a cocktail"))

                        .overlay(
                            AsyncImage(url: URL(string: cocktail.photo!)) { image in
                                image.resizable()
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: screenSize.width, height: 343)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                            }
                        )
            
            VStack {
                HStack {
                    Text(cocktail.name)
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button(action: {
                        liked.toggle()
                        liked ? detailViewModel.saveFav(cocktail: cocktail) : detailViewModel.deleteFav(cocktail: cocktail)
                        print("button clicked to save element")
                    }, label: {
                        HStack {
                            LikedComponent(liked: liked)
                        }
                    })
                }
                Text(cocktail.category.rawValue)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
            Text(cocktail.instructions!)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
        }
    }
}

struct TitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponent(cocktail: Cocktail(id: "10101", name: "Cocktail Mock", video: "https://youtube.com",category: Category.cocktail , instructions: "esta es la forma de preparar un cocktail", photo: "cocktail_image", ingredients: [], measures: [], isAlcoholic: true, isFavourite: false), detailViewModel: DetailViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
