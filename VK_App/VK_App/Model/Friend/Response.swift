//
//  PhotoResponse.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Средний уровень JSON
struct Response: Codable {
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case friends = "items"
    }
}
