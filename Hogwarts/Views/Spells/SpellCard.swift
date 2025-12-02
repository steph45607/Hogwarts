//
//  SpellCard.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct SpellCard: View {
    @State var spell : SpellResponse
    var body: some View {
        NavigationLink{
            SpellDetailsView(spell: spell)
        }
        label:{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: spell.attributes.image ?? "nil")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 150, height: 230)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .cornerRadius(8)

                    case .failure(_):
                        Image(systemName: "photo")
                            .font(.largeTitle)
//                            .resizable()
//                            .scaledToFit()
                            .frame(width: 150, height: 230)
                            .foregroundColor(.gray)
//                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    @unknown default:
                        EmptyView()
                    }
                }
                Text(spell.attributes.name)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                Text(spell.attributes.light ?? "")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                    .font(.belle12)
                    .foregroundColor(.steps)
                Text(spell.attributes.incantation ?? "")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                    .font(.belle12)
                    .foregroundColor(.steps)
            }
            .font(.belle16)
            .padding(.bottom, 4)
        }
    }
}
