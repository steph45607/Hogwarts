//
//  SpellCatalogView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct SpellCatalogView: View {
    @StateObject private var vm = ViewModel()
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
                    Text("Spells")
                        .font(.belle26)
                    ScrollView{
                        if let spellCatalog = vm.spellCatalog{
                            LazyVGrid(columns: columns){
                                ForEach(spellCatalog){ spell in
//                                    BookCard(book: book)
                                    SpellCard(spell: spell)
//                                    Text("test")
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
                .onAppear{
                    vm.loadAllSpells()
                }
            }
        }
    }
}

#Preview {
    PotionCatalogView()
}
