//
//  MovieCatalogView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct CharacterCatalogView: View {
    @StateObject private var vm = ViewModel()
    
    @State private var sort : Bool = true
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
                    HStack{
                        Text("Characters")
                            .font(.belle26)
                        Spacer()
                        Button{
                            sort.toggle()
                        } label: {
                            Image(systemName: "arrow.up.arrow.down.circle")
                        }
                        .tint(.steps)
                    }
                    ScrollView{
                        if let characters = vm.characterCatalog{
                            LazyVGrid(columns: columns){
                                ForEach(characters){ character in
                                    CharacterCard(character: character)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
                .onChange(of: sort, { _, _ in
                    vm.loadAllCharacters(asc: sort)
                })
                .onAppear{
                    vm.loadAllCharacters(asc: sort)
                }
            }
        }
    }
}

#Preview {
    CharacterCatalogView()
}
