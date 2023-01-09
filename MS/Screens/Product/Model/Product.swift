//
//  Product.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import Foundation

struct ProductRaw: Codable, Hashable {
    let products: [Product]
}

struct Product: Codable, Hashable {
    let id: String
    let title: String
    let citrusId: String?
    let imageURL: String
    let price: [Price]
    let brand: String
    let badges: [String]
    let ratingCount: Float
    let messages: Message
    let isAddToCartEnable: Bool
    let addToCartButtonText: String
    let isInTrolley: Bool
    let isInWishlist: Bool
    let purchaseTypes: [PurchaseType]
    let isFindMeEnable: Bool
    let saleUnitPrice: Float
    let totalReviewCount: Int
    let isDeliveryOnly: Bool
    let isDirectFromSupplier: Bool
}

struct Price: Codable, Hashable {
    let message: String
    let value: Float
    let isOfferPrice: Bool
}


struct Message: Codable, Hashable {
    let secondaryMessage: String?
    let promotionalMessage: String?
    let sash: Sash
}

struct Sash: Codable, Hashable {

}

struct PurchaseType: Codable, Hashable {
    let purchaseType: String
    let displayName: String
    let unitPrice: Float
    let minQtyLimit: Int
    let maxQtyLimit: Int
    let cartQty: Int
}
