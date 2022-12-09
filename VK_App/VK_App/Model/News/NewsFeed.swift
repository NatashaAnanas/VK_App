// NewsFeed.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Новость
final class NewsFeed: Decodable {
    /// Идентификатор новости
    var id: Int
    /// Идентификатор источника новости
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
