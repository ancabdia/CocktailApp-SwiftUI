//
//  VideoComponent.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 7/8/23.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    
    let videoId: String
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct VideoComponent: View {
    var screenSize = UIScreen.main.bounds
    private var video: String?
    
    init(video: String) {
        self.video = video.replacingOccurrences(of: "https://www.youtube.com/watch?v=", with: "")
    }

    var body: some View {
        Section{
            Text("Video")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            YouTubeView(videoId: video!)
                .frame(height: 200)
        }.padding()
    }
}

struct VideoComponent_Previews: PreviewProvider {
    static var previews: some View {
        VideoComponent(video: "https://www.youtube.com/watch?v=ApMR3IWYZHI")
    }
}
