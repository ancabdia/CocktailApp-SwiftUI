//
//  VideoComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI
import AVKit

struct VideoComponent: View {
    var screenSize = UIScreen.main.bounds
    @State private var player = AVPlayer()
    private var video: String?
    
    init(video: String) {
        self.video = video
    }

    var body: some View {
        Section{
            Text("Video")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            VideoPlayer(player: player)
                .frame(height: 200)
                .onAppear{
                    player = AVPlayer(url: URL(string: video!)!)
                }
            Text(video!)
        }.padding()
    }
}

struct VideoComponent_Previews: PreviewProvider {
    static var previews: some View {
        VideoComponent(video: "https://www.youtube.com/watch?v=ApMR3IWYZHI")
    }
}
