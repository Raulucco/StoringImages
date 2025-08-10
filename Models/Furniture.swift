//
//  Furniture.swift
//  StoringImages
//
//  Created by Raul CM on 10.08.2025.
//

import Foundation
import SwiftData

@Model
class Furniture {
    @Attribute(.externalStorage) var photo: Data?
    
    init(photo: Data? = nil) {
        self.photo = photo
    }
}
