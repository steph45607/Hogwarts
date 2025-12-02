//
//  MainView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var vm = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Today's Recommendation")
                            .font(.belle26)

                        if let movie = vm.movieOfTheDay, let book = vm.bookOfTheDay{
                            HStack{
                                MovieCard(movie: movie)
                                BookCard(book: book)
                            }
                        } else {
                            Text("Loading…")
                                .font(.belle20)
                                .foregroundColor(.steps)
                        }
                    }
                    .padding(.horizontal)
                    List{
                        Section{
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
                                PotionCatalogView()
                            } label: {
                                Label("Potions", systemImage: "bubbles.and.sparkles")
                            }
                            NavigationLink {
                                SpellCatalogView()
                            } label: {
                                Label("Spells", systemImage: "wand.and.sparkles")
                            }
                        } header: {
                            Text("Menu")
                                .font(.belle26)
                        }
                        .listRowBackground(Color.paper)
                    }
                    .font(.belle18)
                    .foregroundColor(.steps)
                    .tint(.steps)
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .onAppear{
            vm.loadAllMovies()
            vm.loadAllBooks()
        }
    }
}

#Preview {
    MainView()
}
