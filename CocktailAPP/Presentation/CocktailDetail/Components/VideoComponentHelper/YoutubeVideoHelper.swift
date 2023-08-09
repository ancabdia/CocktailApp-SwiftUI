//
//  YoutubeVideoHelper.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 9/8/23.
//
import WebKit
import SwiftUI

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
