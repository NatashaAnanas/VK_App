//
//  Groups.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Информация о группе
final class Groups: Object, Codable {
    @Persisted var nameGroup: String
    @Persisted var urlPhoto: String

    private enum CodingKeys: String, CodingKey {
        case nameGroup = "name"
        case urlPhoto = "photo_100"
    }
}
