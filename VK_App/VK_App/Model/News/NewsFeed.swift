//
//  Items.swift
//  VK_App
//
//  Created by Анастасия Козлова on 06.12.2022.
//

import Foundation

/// Новость
final class NewsFeed: Decodable {
    var id: Int
    var sourceID: Int
    var text: String
    var authorName: String?
    var avatarPath: String?
    var date: Int
   
    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case text
        case date
    }
}
