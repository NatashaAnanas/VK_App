//
//  Photo.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// Информация о фото Photo
struct Photo: Codable {
    let sizes: [Sizes]
}
