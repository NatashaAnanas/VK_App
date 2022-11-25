//
//  GroupMo.swift
//  VK_App
//
//  Created by Анастасия Козлова on 24.11.2022.
//

import RealmSwift

/// Верхний уровень JSON
struct GroupResult: Decodable {
    let response: GroupResponse
}

/// Средний уровень JSON
struct GroupResponse: Codable {
    let group: [Groups]
    
    enum CodingKeys: String, CodingKey {
        case group = "items"
    }
}

/// Информация о группе
final class Groups: Object, Codable {
    @Persisted var nameGroup: String
    @Persisted var urlPhoto: String
    
    private enum CodingKeys: String, CodingKey {
        case nameGroup = "name"
        case urlPhoto = "photo_100"
    }
}
