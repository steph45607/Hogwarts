//
//  SpellDetailsView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct SpellDetailsView: View {
    @State var spell : SpellResponse
    @ObservedObject private var vm = ViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: spell.attributes.image ?? "null")) { phase in
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
                Text(spell.attributes.name)
                    .padding(.horizontal)
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                    .font(.belle26)
                
                HStack{
                    VStack{
                        Text("Category")
                        Text("\(spell.attributes.category ?? "-")")
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    VStack{
                        Text("Hand")
                            Text("\(spell.attributes.hand ?? "-")")
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    VStack{
                        Text("Light")
                            Text("\(spell.attributes.light ?? "-")")
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    Link(destination: URL(string: spell.attributes.wiki ?? "")!) {
                        VStack{
                            Text("Wiki")
                            Image(systemName: "globe")
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16){
                HStack{
                    VStack(alignment:.leading){
                        HStack(alignment: .top){
                            Text("Creator:")
                            Text(spell.attributes.creator ?? "Not found")
                        }
                        HStack(alignment: .top){
                            Text("Effect:")
                            Text(spell.attributes.effect ?? "Not found")
                        }
                        HStack(alignment: .top){
                            Text("Incantation:")
                            Text(spell.attributes.incantation ?? "Not found")
                        }

                    }
                    Spacer()
                }
            }
            .padding()
            .background(.paper)
        }
        .font(.belle16)
    }
}
