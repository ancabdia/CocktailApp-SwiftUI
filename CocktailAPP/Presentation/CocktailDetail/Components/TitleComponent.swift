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
    
    @State private var liked = false
    
    init(cocktail: Cocktail, detailViewModel: DetailViewModel) {
        self.cocktail = cocktail
        self.detailViewModel = detailViewModel
    }
    
    var body: some View {
        AsyncImage(url: URL(string: cocktail.photo!),
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
                HStack{
                    Text(cocktail.name)
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button(action: {
                        liked.toggle()
                        print("boton cliclado guardar elemento")
                        detailViewModel.saveFav(cocktail: cocktail)
                    }, label: {
                        HStack {
                            LikedComponent(liked: liked)
                        }
                    })
                    
                }
                Text(cocktail.category.rawValue)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Text(cocktail.instructions!)
        }.padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
    }
}

struct TitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponent(cocktail: Cocktail(id: "10101", name: "Cocktail Mock", video: "https://youtube.com",category: Category.cocktail , instructions: "esta es la forma de preparar un cocktail", photo: "cocktail_image", ingredients: [], measures: [], isAlcoholic: true, isFavourite: false), detailViewModel: DetailViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation(), localDataSource: LocalDataSourceImplemententation())))
    }
}
