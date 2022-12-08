// Groups.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о группах
@objcMembers
final class Groups: Object, Codable {
    /// Идентификатор новости
    dynamic var id: Int
    /// Название группы
    dynamic var groupName: String
    /// URL группы
    dynamic var urlPhoto: String

    private enum CodingKeys: String, CodingKey {
        case id
        case groupName = "name"
        case urlPhoto = "photo_100"
    }

    override class func primaryKey() -> String? {
        "id"
    }
}
