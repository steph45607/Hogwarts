//
//  MovieDetailsView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct MovieDetailsView: View {
    @State var movie : MovieResponse
    @ObservedObject private var movieVM = ViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: movie.attributes.poster!)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 280)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .cornerRadius(8)

                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    @unknown default:
                        EmptyView()
                    }
                }
                Text(movie.attributes.title)
                    .padding(.horizontal)
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                    .font(.belle26)
                
                HStack{
                    VStack{
                        Text("Duration")
                        HStack(spacing:2){
                            Image(systemName: "clock")
                            Text(movie.attributes.running_time!)
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    VStack{
                        Text("Rating")
                        HStack(spacing:2){
                            Image(systemName: "person")
                            Text("\(movie.attributes.rating!)")
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    Link(destination: URL(string: movie.attributes.wiki!)!) {
                        VStack{
                            Text("Wiki")
                            Image(systemName: "globe")
                        }
                        .foregroundColor(.black)
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    Link(destination: URL(string: movie.attributes.trailer!)!) {
                        VStack{
                            Text("Trailer")
                            Image(systemName: "movieclapper")
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading){
                    HStack{
                        Text("Producer:")
                        ForEach(movie.attributes.directors!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Director:")
                        ForEach(movie.attributes.directors!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Cinematographer:")
                        ForEach(movie.attributes.cinematographers!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Editor:")
                        ForEach(movie.attributes.editors!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Producer:")
                        ForEach(movie.attributes.producers!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Music Composer:")
                        ForEach(movie.attributes.music_composers!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    HStack{
                        Text("Screenwriters:")
                        ForEach(movie.attributes.screenwriters!, id: \.self) { person in
                            Text(person)
                        }
                    }
                    
                    HStack{
                        Text("Budget:")
                        Text(movie.attributes.budget!)
                    }
                    HStack{
                        Text("Box Offixe:")
                        Text(movie.attributes.box_office!)
                    }
                    HStack{
                        Text("Release Date:")
                        Text(movie.attributes.release_date!)
                    }
                }
                VStack(alignment: .leading){
                    Text("Summary")
                        .font(.belle26)
                    Text(movie.attributes.summary ?? "Summary not available")
                        .font(.belle18)
                }
            }
            .padding()
            .background(.paper)
        }
        .font(.belle16)
    }
}
