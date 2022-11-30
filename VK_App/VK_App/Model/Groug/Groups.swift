// Groups.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о группе
@objcMembers
final class Groups: Object, Codable {
    dynamic var id: Int
    dynamic var nameGroup: String
    dynamic var urlPhoto: String

    private enum CodingKeys: String, CodingKey {
        case id
        case nameGroup = "name"
        case urlPhoto = "photo_100"
    }

    override class func primaryKey() -> String? {
        "id"
    }
}
