//
//  MovieCatalogView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MovieCatalogView: View {
    @StateObject private var movieVM = ViewModel()
    //    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Movies")
                        .font(.belle26)
                    ScrollView{
                        if let movies = movieVM.movieCatalog{
                            LazyVGrid(columns: columns){
                                ForEach(movies){ movie in
                                    MovieCard(movie: movie)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
                .onAppear{
                    movieVM.loadAllMovies()
                }
            }
        }
    }
}

#Preview {
    MovieCatalogView()
}
