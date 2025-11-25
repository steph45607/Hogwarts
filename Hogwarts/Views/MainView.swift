//
//  MainView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
//            VStack{
//                Text("Today's Recommendation")
//            }
            TabView{
                BookCatalogView()
                    .tabItem{
                        Label("Books", systemImage: "book.closed")
                    }
                MovieCatalogView()
                    .tabItem{
                        Label("Movies", systemImage: "movieclapper.fill")
                    }
                BookCatalogView()
                    .tabItem{
                        Label("Characters", systemImage: "figure.wave")
                    }
                BookCatalogView()
                    .tabItem{
                        Label("Potions", systemImage: "bubbles.and.sparkles")
                    }
                BookCatalogView()
                    .tabItem{
                        Label("Spells", systemImage: "wand.and.sparkles")
                    }

            }
            .tint(.steps)
        }
    }
}

#Preview {
    MainView()
}
