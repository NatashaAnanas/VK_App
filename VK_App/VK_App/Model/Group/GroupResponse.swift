// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Средний уровень JSON GroupResponse
struct GroupResponse: Codable {
    /// Группы
    let groups: [Groups]

    enum CodingKeys: String, CodingKey {
        case groups = "items"
    }
}
