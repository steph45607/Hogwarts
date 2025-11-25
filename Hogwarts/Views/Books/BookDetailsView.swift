//
//  BookDetailsView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct BookDetailsView: View {
    @State var book : BookResponse
    @ObservedObject private var bookVM = BookViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: book.attributes.cover)) { phase in
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
                Text(book.attributes.title)
                    .padding(.horizontal)
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                    .font(.belle26)
                
                HStack{
                    VStack{
                        Text("Pages")
                        HStack(spacing:2){
                            Image(systemName: "book")
                            Text("\(book.attributes.pages)")
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    VStack{
                        Text("Chapters")
                        HStack(spacing:2){
                            Image(systemName: "bookmark")
                            Text("\(bookVM.chapterList!.count)")
                        }
                    }
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 50)
                    Link(destination: URL(string: book.attributes.wiki)!) {
                        VStack{
                            Text("Wiki")
                            Image(systemName: "globe")
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading){
                    Text("Summary")
                        .font(.belle26)
                    Text(book.attributes.summary)
                        .font(.belle18)
                }
                VStack(alignment: .leading){
                    Text("Chapters")
                        .font(.belle26)
                    ForEach(bookVM.chapterList!){chp in
                        VStack(alignment: .leading){
                            Text("\(chp.attributes.order) \(chp.attributes.slug.fromSlugToTitleCase())")
                                .font(.belle18)
                            Text((chp.attributes.summary?.isEmpty == true ? "Summary not available" : chp.attributes.summary) ?? "Summary not available")
                        }
                        .padding(.bottom, 4)
                    }
                }
            }
            .padding()
            .background(.paper)
        }
        .font(.belle16)
        .onAppear{
            print("CHAPTER BEFORE")
            print(book.id)
            bookVM.loadAllChapters(bookId: String(book.id))
            print("CHAPTER AFTER")
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
    
    //    BookDetailsView(book: sampleBook)
}
