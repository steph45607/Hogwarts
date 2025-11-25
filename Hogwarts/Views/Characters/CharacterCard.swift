//
//  Card.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct CharacterCard: View {
    @State var character : CharacterResponse
    var body: some View {
        NavigationLink{
            CharacterDetailsView(character: character)
        }
        label:{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: character.attributes.image ?? "nil")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 150, height: 200)
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
                            .frame(width: 150, height: 230)
                            .foregroundColor(.gray)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    @unknown default:
                        EmptyView()
                    }
                }
                Text(character.attributes.name)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                HStack{
                    HStack(spacing:2){
                        Image(systemName: "House")
//                        Text(character.attributes.running_time ?? "0")
                    }
                    HStack(spacing: 2){
                        Image(systemName: "calendar")
//                        Text(character.attributes.release_date ?? "unknown")
                    }
                }
                .font(.belle12)
                .foregroundColor(.steps)
            }
            .font(.belle16)
            .padding(.bottom, 4)
        }
    }
}

#Preview {
    let sampleBook = Book(
//        id: "76040954-a2ea-45bc-a058-6d2d9f6d71ea",
        author: "J. K. Rowling",
        cover: "https://www.wizardingworld.com/images/products/books/UK/rectangle-1.jpg",
        dedication: "For Jessica, who loves stories, for Anne, who loved them too, and for Di, who heard this one first",
        pages: 223,
        release_date: "1997-06-26",
        summary: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment … Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!",
        title: "Harry Potter and the Philosopher's Stone",
        wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone"
    )

//    BookCard(book: sampleBook)
}
