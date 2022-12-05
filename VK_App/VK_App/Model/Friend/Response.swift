// Response.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Средний уровень JSON Response
struct Response: Codable {
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case friends = "items"
    }
}
