//
//  ContentView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct BookCatalogView: View {
    @StateObject private var bookVM = ViewModel()
    //    @Namespace private var animationNamespace
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
                    Text("Books")
                        .font(.belle26)
                    ScrollView{
                        if let bookCatalog = bookVM.bookCatalog{
                            LazyVGrid(columns: columns){
                                ForEach(bookCatalog){ book in
                                    BookCard(book: book)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
                .onAppear{
                    bookVM.loadAllBooks()
                }
            }
        }
    }
}

#Preview {
    BookCatalogView()
}
