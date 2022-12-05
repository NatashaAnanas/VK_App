// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Средний уровень JSON GroupResponse
struct GroupResponse: Codable {
    let group: [Groups]

    enum CodingKeys: String, CodingKey {
        case group = "items"
    }
}
