// Sizes.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// URL фото
final class Sizes: Object, Codable {
    /// URL фото
    @objc dynamic var url: String
    /// Высота фото
    @objc dynamic var height: Int
    /// Ширина фото
    @objc dynamic var width: Int

    override class func primaryKey() -> String? {
        "url"
    }
}
