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
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        Button{
                            print("first")
                            vm.firstPage(asc: sort)
                        }label:{
                            Image(systemName: "chevron.backward.to.line")
                                .tint(.steps)
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button{
                            print("prev")
                            vm.prevPage(asc: sort)
                        }label:{
                            Image(systemName: "chevron.backward")
                                .tint(.steps)
                        }
                    }
                    ToolbarItem(placement: .bottomBar){
                        Text("\(vm.characterCatalogPage.current)")
//                            .padding()
//                            .background(.steps)
//                            .cornerRadius(20)
//                            .foregroundColor(.white)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button{
                            print("next")
                            vm.nextPage(asc: sort)
                        }label:{
                            Image(systemName: "chevron.forward")
                                .tint(.steps)
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button{
                            print("end")
                            vm.lastPage(asc: sort)
                        }label:{
                            Image(systemName: "chevron.forward.to.line")
                                .tint(.steps)
                        }
                    }
                })
                .padding()
                .onChange(of: sort, { _, _ in
//                    vm.loadAllCharacters(asc: sort)
//                    vm.loadPageCharacters(asc: newSort)
                    vm.sortCurrentPage(asc: sort)
                })
                .onAppear{
//                    vm.loadAllCharacters(asc: sort)
                    vm.loadPageCharacters(asc: sort)
                }
            }
        }
    }
}

#Preview {
    CharacterCatalogView()
}
