//
//  Landmark.swift
//  Landmarks
//
//  Created by yang on 2022/5/31.
//

import Foundation
import SwiftUI
import CoreLocation

// Hashable make the Landmark can be used in a Set or as a key of a Dictionary
// Codeable make the data can be encode and decode, most family used with JSON.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        // note: Don't misspell the name of the key in JSON
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    // readonly
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

