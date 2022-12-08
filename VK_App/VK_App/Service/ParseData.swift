//
//  ParseData.swift
//  VK_App
//
//  Created by Анастасия Козлова on 08.12.2022.
//

import Foundation

/// ParseData
final class ParseData: Operation {
    // MARK: Public Properties

    var outputData: [Groups] = []

    // MARK: Initializers

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperations,
              let data = getDataOperation.data else { return }

        do {
            let response = try JSONDecoder().decode(GroupResult.self, from: data)
            outputData = response.response.groups
        } catch {
            print(error.localizedDescription)
        }
    }
}
