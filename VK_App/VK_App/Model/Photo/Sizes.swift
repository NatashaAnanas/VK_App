//
//  Sizes.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// URL фото
final class Sizes: Object, Codable {
    @Persisted var url: String
}
