//
//  PhotoResponse.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Средний уровень JSON
struct PhotoResponse: Codable {
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos = "items"
    }
}
