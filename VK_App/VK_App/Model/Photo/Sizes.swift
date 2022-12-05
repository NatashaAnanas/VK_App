// Sizes.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// URL фото
final class Sizes: Object, Codable {
    @objc dynamic var url: String

    override class func primaryKey() -> String? {
        "url"
    }
}
