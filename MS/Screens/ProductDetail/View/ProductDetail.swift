//
//  ProductDetail.swift
//  MS
//
//  Created by ManendraSingh on 09/01/23.
//

import SwiftUI

struct ProductDetail: View {
    let product: Product
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                URLImage(urlString: product.imageURL)
                Spacer()
                VStack(alignment: .listRowSeparatorTrailing, spacing: 10) {
                    Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.contains(product) ? .red : .gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .onTapGesture {
                            viewModel.contains(product) ? viewModel.removeFromFavourites(product: product) : viewModel.addToFavourites(product: product)
                        }
                    Spacer()
                    Text(product.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                    Spacer()
                    Text("Rating \(product.ratingCount)")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Text("$\(product.price.first?.value ?? 0)")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                   
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(Text("Product Details"))
        .padding(.top)
        .onDisappear {
        }
    }
}
