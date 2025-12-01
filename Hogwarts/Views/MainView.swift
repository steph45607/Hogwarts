//
//  MainView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background.ignoresSafeArea()
                VStack{
                    VStack(alignment: .leading){
                        Text("Today's Recommendation")
                        
                    }
                    List{
                        Section("Menu"){
                            NavigationLink {
                                BookCatalogView()
                            } label: {
                                Label("Books", systemImage: "book.closed")
                            }
                            NavigationLink {
                                MovieCatalogView()
                            } label: {
                                Label("Movies", systemImage: "movieclapper.fill")
                            }
                            NavigationLink {
                                CharacterCatalogView()
                            } label: {
                                Label("Characters", systemImage: "figure.wave")
                            }
                            NavigationLink {
                                BookCatalogView()
                            } label: {
        //                        Text("Potions")
                                Label("Potions", systemImage: "bubbles.and.sparkles")
                            }
                            NavigationLink {
                                BookCatalogView()
                            } label: {
                                Label("Spells", systemImage: "wand.and.sparkles")
                            }
                        }
                        .listRowBackground(Color.paper)
                    }
//                    .content.background(.red)
                    .font(.belle18)
                    .foregroundColor(.steps)
                    .tint(.steps)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
