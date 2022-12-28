// NewsResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Новости
struct NewsResponse: Decodable {
    /// Новости
    let newsFeed: [NewsFeed]
    /// Группы
    let groups: [Groups]
    /// Друзья
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case newsFeed = "items"
        case friends = "profiles"
        case groups
    }
}
