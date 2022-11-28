//
//  GroupResponse.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Средний уровень JSON GroupResponse
struct GroupResponse: Codable {
    let group: [Groups]

    enum CodingKeys: String, CodingKey {
        case group = "items"
    }
}
