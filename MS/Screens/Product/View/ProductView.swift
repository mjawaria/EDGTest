//
//  ProductView.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationView {
            List {
                 ForEach(viewModel.products, id: \.self) { product in
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
             //    CartButton(numberOfProducts: cartManager.products.count)
             }
         }
            .onAppear() {
                viewModel.fetch(url: Constant.API.baseURL + Constant.API.productURL)
            }
        }
    }
}

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
        } else {
            Image(systemName: "home")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
