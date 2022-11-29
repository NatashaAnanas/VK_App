//
//  Sizes.swift
//  VK_App
//
//  Created by Анастасия Козлова on 25.11.2022.
//

import RealmSwift

/// URL фото
final class Sizes: Object, Codable {
    @objc dynamic var url: String
    
    override class func primaryKey() -> String? {
        return "url"
    }
}
