//
//  ContentView.swift
//  TechHive
//
//  Created by Omkar Nikhal on 2/17/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                VStack{
                    Text("")
                    HStack{
                        Text("Votes").padding(.horizontal).foregroundColor(Color(red: 0, green: 0, blue: 0)).font(.system(size: 20))
                        Spacer()
                        Text("Posts").padding(.horizontal).foregroundColor(Color(red: 0, green: 0, blue: 0)).font(.system(size: 20))
                        Spacer()
                        Spacer()
                    }.background(Color(red: 0.4, green: 0.58, blue: 0.66))
                        .frame(maxWidth: .infinity)
                    Text("")
                }.background(Color(red: 0.4, green: 0.58, blue: 0.66))
                
                List(networkManager.posts) { post in
                    
                    NavigationLink(destination: WebView(url: post.url), label: {
                        HStack(spacing:20){
                            Text("\(post.points)").foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.8))
                            Text(post.title).padding(.leading).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.8))
                        }
                    })
                    .listRowBackground(Color(red: 0.6, green: 0.42, blue: 0.33))
                    
                }.listStyle(.plain)
                    .toolbarBackground(
                        Color(red: 0.26, green: 0.18, blue: 0.11),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .navigationBarTitle(Text("Tech Hive").font(.subheadline), displayMode: .large)
            }.ignoresSafeArea(edges:.bottom)
        }.onAppear(perform: networkManager.getData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

