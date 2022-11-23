// Session.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сессия (обращениe к ВК сервисам)
class Session {
    // MARK: - Private Constant

    private enum Constants {
        static let userIdText = "51484090"
    }

    // MARK: - Static properties

    static let instance = Session()

    // MARK: - Public properties

    let userId = Constants.userIdText
    var token = String()

    // MARK: - Initializers

    private init() {}
}
