// Attachments.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Контент
final class Attachments: Decodable {
    /// Фото
    let photo: Photo?
    /// Тип публикации
    let type: String
}
