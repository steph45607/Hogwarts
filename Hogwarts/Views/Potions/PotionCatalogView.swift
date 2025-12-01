//
//  MovieCatalogView.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct PotionCatalogView: View {
    @StateObject private var vm = ViewModel()
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
                    Text("Potions")
                        .font(.belle26)
                    ScrollView{
                        if let potions = vm.potionCatalog{
                            LazyVGrid(columns: columns){
                                ForEach(potions){ potion in
                                    PotionCard(potion: potion)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
                .onAppear{
                    vm.loadAllPotions()
                }
            }
        }
    }
}

#Preview {
    MovieCatalogView()
}
