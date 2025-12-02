//
//  Card.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct BookCard: View {
    @State var book : BookResponse
    var body: some View {
        NavigationLink{
            BookDetailsView(book: book)
        }
        label:{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: book.attributes.cover)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 120, height: 180)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .cornerRadius(8)

                    case .failure(_):
                        Image(systemName: "photo")
                            .font(.largeTitle)
//                            .resizable()
//                            .scaledToFit()
                            .frame(width: 120, height: 180)
                            .foregroundColor(.gray)
//                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                    @unknown default:
                        EmptyView()
                    }
                }
                Text(book.attributes.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                HStack{
                    HStack(spacing:2){
                        Image(systemName: "book.fill")
                        Text("\(book.attributes.pages)")
                    }
                    HStack(spacing: 2){
                        Image(systemName: "calendar")
                        Text(book.attributes.release_date)
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
