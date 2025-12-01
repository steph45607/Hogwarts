//
//  Card.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import SwiftUI

struct PotionCard: View {
    @State var potion : PotionResponse
    var body: some View {
        NavigationLink{
            PotionDetailsView(potion: potion)
        }
        label:{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: potion.attributes.image!)) { phase in
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
//                Text(movie.attributes.title)
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.leading)
//                    .frame(width: 150, alignment: .leading)
//                HStack{
//                    HStack(spacing:2){
//                        Image(systemName: "clock")
//                        Text(movie.attributes.running_time ?? "0")
//                    }
//                    HStack(spacing: 2){
//                        Image(systemName: "calendar")
//                        Text(movie.attributes.release_date ?? "unknown")
//                    }
//                }
//                .font(.belle12)
//                .foregroundColor(.steps)
            }
            .font(.belle16)
            .padding(.bottom, 4)
        }
    }
}
