//
//  FavouriteProductView.swift
//  MS
//
//  Created by ManendraSingh on 09/01/23.
//

import SwiftUI

struct FavouriteProductView: View {
    @StateObject var viewModel = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favouriteProducts, id: \.self) { product in
                     NavigationLink (destination: ProductDetail(product: product)) {

                         HStack(spacing: 20) {
                             URLImage(urlString: product.imageURL)
                            
                             VStack(alignment: .leading, spacing: 10) {
                                 Text(product.title)
                                     .bold()

                                 Text("$\(product.price.first?.value ?? 0)")
                             }
                             Spacer()
                             Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                                 .foregroundColor(viewModel.contains(product) ? .red : .gray)
                                 .onTapGesture {
                                     viewModel.contains(product) ? viewModel.removeFromFavourites(product: product) : viewModel.addToFavourites(product: product)
                                 }
                         }
                         .padding(.horizontal)
                         .frame(maxWidth: .infinity, alignment: .leading)
                                             }
                 }
             }
         .navigationTitle("Product List")
         .toolbar {
             NavigationLink {
//                 CartView()
//                     .environmentObject(cartManager)
             } label: {
                // CartButton(numberOfProducts: cartManager.products.count)
             }
         }
         .onAppear() {
         }
        }
    }
}

struct FavouriteProductView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteProductView()
    }
}
