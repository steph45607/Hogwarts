//
//  ContentView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bookVM = BookViewModel()
    var body: some View {
        VStack {
            if let bookCatalog = bookVM.bookCatalog{
                Text(bookCatalog.description)
//                Text(bookCatalog[0].id)
//                ForEach(bookCatalog) { catalog in
//                    Text(catalog.name)
//                }
            }
        }
        .padding()
        .onAppear{
            bookVM.loadAllBooks()
        }
    }
}

#Preview {
    ContentView()
}
