//
//  NewsResponse.swift
//  VK_App
//
//  Created by Анастасия Козлова on 06.12.2022.
//

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
