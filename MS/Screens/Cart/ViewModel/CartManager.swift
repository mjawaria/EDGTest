//
//  CartManager.swift
//  MS
//
//  Created by ManendraSingh on 09/01/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Float = 0
    
    // Payment-related variables
    @Published var paymentSuccess = false
    
    // Functions to add and remove from cart
    func addToCart(product: Product) {
        products.append(product)
        total +=  Float(product.price.first?.value ?? 0)
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= Float(product.price.first?.value ?? 0)
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
    }
}
