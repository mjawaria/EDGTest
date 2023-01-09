//
//  ProductRow.swift
//  MS
//
//  Created by ManendraSingh on 09/01/23.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            URLImage(urlString: product.imageURL)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .bold()
                Text("$\(product.price.first?.value ?? 0)")
            }
            
            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
