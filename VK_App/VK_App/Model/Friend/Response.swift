// Response.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Друзья
struct Response: Codable {
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case friends = "items"
    }
}
