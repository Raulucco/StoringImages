//
//  StoringImagesApp.swift
//  StoringImages
//
//  Created by Mohammad Azam on 11/29/23.
//

import SwiftUI

@main
struct StoringImagesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }.modelContainer(for: Furniture.self)
        }
    }
}
