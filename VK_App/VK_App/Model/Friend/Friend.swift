// Friend.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о друзьях
@objcMembers
final class Friend: Object, Codable {
    dynamic var id: Int
    dynamic var firstName: String
    dynamic var lastName: String

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }

    override class func primaryKey() -> String? {
        "id"
    }
}
