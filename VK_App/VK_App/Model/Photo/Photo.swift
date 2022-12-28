// Photo.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о фото Photo
struct Photo: Codable {
    /// Id фото
    let id: Int
    /// Sizes
    let sizes: [Sizes]

    private enum CodingKeys: String, CodingKey {
        case sizes
        case id
    }
}
