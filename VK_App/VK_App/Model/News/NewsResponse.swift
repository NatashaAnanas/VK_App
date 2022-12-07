//
//  NewsResponse.swift
//  VK_App
//
//  Created by Анастасия Козлова on 06.12.2022.
//

import Foundation

/// Новости
struct NewsResponse: Decodable {
    let news: [NewsFeed]
    let groups: [Groups]
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case news = "items"
        case friends = "profiles"
        case groups
    }
}
