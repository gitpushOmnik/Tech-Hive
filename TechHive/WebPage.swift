import SwiftUI
import WebKit
import Foundation

struct WebPage: UIViewRepresentable{

    var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = url{
            if let url = URL(string: safeURL){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
