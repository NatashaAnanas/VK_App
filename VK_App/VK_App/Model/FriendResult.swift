// FriendResult.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Верхний уровень JSON
struct FriendResult: Decodable {
    let response: Response
}

/// Средний уровень JSON
struct Response: Codable {
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case friends = "items"
    }
}

/// Информация о друзьях
final class Friend: Object, Codable {
    @Persisted var firstName: String
    @Persisted var lastName: String

    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
