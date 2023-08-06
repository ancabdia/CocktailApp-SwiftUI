//
//  Lottie.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    //    let lottieFile: String
    
    let animationView = LottieAnimationView(name: "shaker.mp4.lottie")
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = .loop
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }
    
    func shakedAction() {
        animationView.play()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
