//
//  NewsResult.swift
//  VK_App
//
//  Created by Анастасия Козлова on 06.12.2022.
//

import Foundation

/// Верхний уровень JSON NewsResult
struct NewsResult: Decodable {
    let response: NewsResponse
}
