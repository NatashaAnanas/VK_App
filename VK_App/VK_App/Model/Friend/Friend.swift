//
//  Friend.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Информация о друзьях
final class Friend: Object, Codable {
    @Persisted var firstName: String
    @Persisted var lastName: String

    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
