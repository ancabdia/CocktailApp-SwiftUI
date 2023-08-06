//
//  SplashView.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 294, height: 44)
                .background(
                    Image(uiImage: UIImage(named: "logo")!).accessibilityLabel("Logo from the app")
                )
                .padding(EdgeInsets(top: 222, leading: 47, bottom: 578, trailing: 47))
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                rootViewModel.onSplash()
            }
        }
        .background(
            Image(uiImage: UIImage(named: "background")!).ignoresSafeArea()
        )
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
