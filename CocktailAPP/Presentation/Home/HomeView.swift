//
//  HomeView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI
struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    //MARK: - Variable for shaking state
    @State private var isShaking = false
    @State private var shaked = false
    
    //MARK: - Variable for animation
    private let lottieView = LottieView(lottieFile: "shaker.mp4.lottie")
    let arrayOfWords = ["Mezclando...", "Exprimiendo...", "Sirviendo..."]
    @State private var currentIndex = 0
    @State var firstString : String = ""
    @State var timer: Timer? = nil
    @State var isBlurred = false
    
    var newTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { v in
            v.invalidate()
            currentIndex += 1
            if currentIndex == arrayOfWords.count { currentIndex = 0 }
            DispatchQueue.main.async {
                firstString = arrayOfWords[currentIndex]
                self.timer = self.newTimer
            }
        }
    }
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Cocktail of the day")
                    .textCase(.uppercase)
                    .font(.title)
                    .bold()
                lottieView.frame(width: 200, height: 200)
                if isShaking {
                    // Display the loading animation here
                    VStack{
                        Text(firstString)
                            .onAppear{
                                self.timer = newTimer
                            }
                    }
                } else {
                    VStack{
                        Text("Shake me!")
                            .bold()
                            .onShake {
                                isShaking = true
                                lottieView.animationView.play()
                                //generate the cocktail
                                homeViewModel.generateCocktail()
                                //fake sensation of loading from api so you can see full animation
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    isShaking = false
                                    lottieView.animationView.pause()
                                    timer?.invalidate()
                                    shaked = true //Activate navigate
//                                    rootViewModel.showCocktailDetail(cocktail: homeViewModel.cocktail!)
                                }
                            }
                        if shaked && homeViewModel.cocktail != nil{
                            NavigationLink("View cocktail", destination: CocktailDetailView(cocktail: homeViewModel.cocktail!))
                        }
                    }
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteCocktailDataSourceImplemententation())))
    }
}
