//
//  WebView.swift
//  TechHive
//
//  Created by Omkar Nikhal on 2/18/23.
//

import SwiftUI

struct WebView: View {
    
    var url: String?
    var body: some View {
        WebPage(url: url)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.google.com")
    }
}
