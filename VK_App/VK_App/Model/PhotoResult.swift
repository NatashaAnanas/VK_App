// PhotoResult.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Верхний уровень JSON
struct PhotoResult: Decodable {
    let response: PhotoResponse
}

/// Средний уровень JSON
struct PhotoResponse: Codable {
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos = "items"
    }
}

/// Информация о фото
struct Photo: Codable {
    let sizes: [Sizes]
}

/// URL фото
final class Sizes: Object, Codable {
    @Persisted var url: String
}
