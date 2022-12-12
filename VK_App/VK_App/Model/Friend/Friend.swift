// Friend.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Друг
@objcMembers
final class Friend: Object, Codable {
    /// Идентификатор новости
    dynamic var id: Int
    /// Имя друга
    dynamic var firstName: String
    /// Фамилия друга
    dynamic var lastName: String
    /// Фото друга
    dynamic var photo: String

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }

    override class func primaryKey() -> String? {
        "id"
    }
}
