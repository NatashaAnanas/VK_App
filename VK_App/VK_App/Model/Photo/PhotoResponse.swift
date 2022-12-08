// PhotoResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Средний уровень JSON PhotoResponse
struct PhotoResponse: Codable {
    /// Фотографии
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos = "items"
    }
}
