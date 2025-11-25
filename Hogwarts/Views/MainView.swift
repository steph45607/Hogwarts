//
//  MainView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            BookCatalogView()
                .tabItem{
                    Label("Books", systemImage: "book.closed")
                }
            BookCatalogView()
                .tabItem{
                    Label("Movies", systemImage: "book.closed")
                }
            BookCatalogView()
                .tabItem{
                    Label("Characters", systemImage: "book.closed")
                }
            BookCatalogView()
                .tabItem{
                    Label("Potions", systemImage: "book.closed")
                }
            BookCatalogView()
                .tabItem{
                    Label("Spells", systemImage: "book.closed")
                }

        }
        .tint(.steps)
    }
}

#Preview {
    MainView()
}
