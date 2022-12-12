// ParseGroupData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Парсинг групп асинх
final class ParseGroupData: Operation {
    // MARK: Public Properties

    var groups: [Groups] = []

    // MARK: Initializers

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperations,
              let data = getDataOperation.data else { return }

        do {
            let response = try JSONDecoder().decode(GroupResult.self, from: data)
            groups = response.response.groups
        } catch {
            print(error.localizedDescription)
        }
    }
}
