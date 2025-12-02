//
//  MovieDetailsView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    @State var character : CharacterResponse
    @ObservedObject private var vm = ViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: character.attributes.image ?? "null")) { phase in
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
                Text(character.attributes.name)
                    .padding(.horizontal)
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                    .font(.belle26)
                
                HStack{
                    VStack{
                        Text("Duration")
                        HStack(spacing:2){
                            Image(systemName: "clock")
                            //                            Text(character.attributes.running_time!)
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    VStack{
                        Text("Rating")
                        HStack(spacing:2){
                            Image(systemName: "person")
                            //                            Text("\(character.attributes.rating!)")
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    //                    Link(destination: URL(string: character.attributes.wiki!)!) {
                    VStack{
                        Text("Wiki")
                        Image(systemName: "globe")
                    }
                    .foregroundColor(.black)
                }
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 1, height: 50)
                //                    Link(destination: URL(string: character.attributes.trailer!)!) {
                //                        VStack{
                //                            Text("Trailer")
                //                            Image(systemName: "movieclapper")
                //                        }
                //                        .foregroundColor(.black)
                //                    }
            }
        
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading){
                //                    HStack{
                //                        Text("Producer:")
                //                        ForEach(character.attributes.directors!, id: \.self) { person in
                //                            Text(person)
                //                        }
                //                    }
                //                    HStack{
                //                        Text("Director:")
                //                        ForEach(character.attributes.directors!, id: \.self) { person in
                //                            Text(person)
                //                        }
                //                    }
                //                    HStack{
                //                        Text("Cinematographer:")
                //                        ForEach(character.attributes.cinematographers!, id: \.self) { person in
                //                            Text(person)
                //                        }
                //                    }
            }
            VStack(alignment: .leading){
                Text("Summary")
                    .font(.belle26)
                Text(character.attributes.marital_status ?? "Summary not available")
                    .font(.belle18)
            }
        }
    }
        .padding()
        .background(.paper)
        .font(.belle16)
    }

    
}
