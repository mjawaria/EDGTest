//
//  ProductViewModel.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import Foundation
import Combine
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var favouriteProducts: [Product] = []
    private var favoriteIds: Set<String> = []
    
    func fetch(url : String) {
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            // Convert to JSON
            do {
                let product = try JSONDecoder().decode(ProductRaw.self, from: data)
                DispatchQueue.main.async {
                    self?.products = product.products
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // Add to Favourites
    func addToFavourites(product: Product) {
        favouriteProducts.append(product)
        favoriteIds.insert(product.id)
    }
    
    func removeFromFavourites(product: Product) {
        favouriteProducts = favouriteProducts.filter { $0.id != product.id }
        favoriteIds.remove(product.id)
    }
    
    func contains(_ product: Product) -> Bool {
        favoriteIds.contains(product.id)
        }
//    func contains(_ task: Task) -> Bool {
//            tasks.contains(task.id)
//        }
}

extension ProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }

}
