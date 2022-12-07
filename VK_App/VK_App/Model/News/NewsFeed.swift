//
//  Items.swift
//  VK_App
//
//  Created by Анастасия Козлова on 06.12.2022.
//

import Foundation

/// Новость
final class NewsFeed: Decodable {
    
    /// идентификатор новости
    var id: Int
    /// идентификатор источника новости
    var sourceID: Int
    /// Текстовый контент
    var text: String
    /// Дата поста
    var date: Int
    /// Имя автора поста
    var authorName: String?
    /// Фото автора поста
    var avatarPath: String?
   
    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case text
        case date
    }
}
