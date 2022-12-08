//
//  ReloadTableController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 08.12.2022.
//

import RealmSwift

/// ReloadTableController
final class ReloadTableController: Operation {
    // MARK: Initializers
    override func main() {
        guard let getParseData = dependencies.first as? ParseData else { return }
        let parseData = getParseData.outputData
        do {
            let realm = try Realm()
            guard let oldData = RealmService.get(Groups.self) else { return }
            try realm.write {
                realm.delete(oldData)
                realm.add(parseData)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
