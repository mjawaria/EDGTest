//
//  MSApp.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import SwiftUI

@main
struct MSApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Products")
                    }
                FavouriteProductView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                    }
            }
        }
    }
}
