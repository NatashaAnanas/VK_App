//
//  Friend.swift
//  VK_App
//
//  Created by Анастасия Козлова on 23.11.2022.
//

import Foundation

/// Модель Friend
struct Friend: Decodable {
    var response: Response
}

/// Модель Response
struct Response: Decodable {
    var count: Int
    var items: Items
}

/// Модель Items
struct Items: Decodable {
    var id: Int
    var firstName: String
    var lastName: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
